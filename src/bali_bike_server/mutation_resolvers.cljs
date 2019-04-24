(ns bali-bike-server.mutation-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            [bali-bike-server.constants :as constants]
            [clojure.string :as string]
            ["firebase-admin" :default firebase-admin]
            ["moment-precise-range-plugin"]
            ["moment" :as moment]
            ["postmark" :as postmark]
            ["https" :as https]))

(def postmark-client (postmark/ServerClient. "dd8c31b4-d90f-4dc6-9eee-1f32e1f5c3f4"))

(defn get-dates-diff
  [start-date end-date]
  (let [diff (.preciseDiff moment (moment start-date) (moment end-date) true)
        months (.-months diff)]
    (if (> months 0)
      (js->clj diff :keywordize-keys true)
      (do
        (set! (.-days diff) (+ 1 (.-days diff)))
        (js->clj diff :keywordize-keys true)))))

(defn round-to-thousands
  [number]
  (* (js/Math.round (/ number 1000)) 1000))

(defn get-short-dates-range-string
  [start-date end-date]
  (str (.format (moment start-date) "MMM D")
       " - "
       (.format (moment end-date) "MMM D")))

(defn calculate-total-price
  [{:keys [start-date end-date monthly-price weekly-price daily-price]}]
  (let [dates-diff (get-dates-diff start-date end-date)
        days (:days dates-diff)
        weeks (quot days 7)
        months (:months dates-diff)]
    (cond
      (> months 0) (+ (* monthly-price months) (* (round-to-thousands (/ monthly-price 30)) days))
      (> weeks 0) (+ (* weeks weekly-price)
                     (* (round-to-thousands (/ weekly-price 7)) (- days (* weeks 7))))
      :else (* daily-price days))))

(defn send-notification
  [user-uid notification]
  (let [user-ref (.doc (.firestore firebase-admin) (str "users/" user-uid))]
    (.then
     (.get user-ref)
     (fn [user]
       (.sendToDevice
        (.messaging firebase-admin)
        (.-pushTokens (.data user))
        (clj->js notification))))))

(defn send-booking-notification
  [booking bike]
  (let [bike-owner-uid (.-bikeOwnerUid booking)
        model-id (.-modelId bike)
        start-date (.-startDate booking)
        end-date (.-endDate booking)
        notification {:data {:id (.-id booking) :type "NEW_BOOKNG"}
                      :notification {:title "New Booking"
                                     :body (str (get constants/models model-id) ", "
                                                (get-short-dates-range-string
                                                 start-date end-date))}}]
    (send-notification bike-owner-uid notification)))

(defn send-booking-email
  [booking bike]
  (alet [owner-uid (.-bikeOwnerUid booking)
         owner (p/await (.getUser (.auth firebase-admin) owner-uid))
         model (get constants/models (.-modelId bike))
         start-date (.format (moment (.-startDate booking)) "MMMM D")
         end-date (.format (moment (.-endDate booking)) "MMMM D")
         bike-photo (first (.-photos bike))
         delivery-location (.-deliveryLocationAddress booking)
         total-price (.-totalPrice booking)]
        (.sendEmailWithTemplate
         postmark-client
         (clj->js {:From "noreply@balibike.app"
                   :To (.-email owner)
                   :TemplateAlias "new_booking"
                   :TemplateModel {:bike_model model
                                   :start_date start-date
                                   :end_date end-date
                                   :bike_photo_url bike-photo
                                   :delivery_location delivery-location
                                   :total_payment total-price}}))))

(defn send-telegram-message-to-me []
  (https/get "https://api.telegram.org/bot762520235:AAEVu2VTl1tNjEG1ANAHkDR2k9xjQ7Ruf5k/sendMessage?chat_id=276487288&text=New%20booking"))

(defn create-booking
  [_ _ {:keys [prisma user args]}]
  (alet [bike (p/await (p/promise (prisma [:bike {:id (:bikeId args)}])))
         monthly-price (.-monthlyPrice bike)
         daily-price (.-dailyPrice bike)
         weekly-price (.-weeklyPrice bike)
         total-price (calculate-total-price {:start-date (:startDate args)
                                             :end-date (:endDate args)
                                             :monthly-price monthly-price
                                             :weekly-price weekly-price
                                             :daily-price daily-price})]
        (.then
         (prisma
          [:createBooking
           {:startDate (:startDate args)
            :endDate (:endDate args)
            :deliveryLocationLongitude (:deliveryLocationLongitude args)
            :deliveryLocationLongitudeDelta (:deliveryLocationLongitudeDelta args)
            :deliveryLocationLatitude (:deliveryLocationLatitude args)
            :deliveryLocationLatitudeDelta (:deliveryLocationLatitudeDelta args)
            :deliveryLocationAddress (:deliveryLocationAddress args)
            :deliveryLocationComment (:deliveryLocationComment args)
            :userUid (:uid user)
            :monthlyPrice monthly-price
            :weeklyPrice weekly-price
            :dailyPrice daily-price
            :totalPrice total-price
            :bikeOwnerUid (.-ownerUid bike)
            :bike {:connect {:id (:bikeId args)}}}])
         (fn [booking]
           (send-booking-notification booking bike)
           (when-not js/goog.DEBUG
             (send-booking-email booking bike)
             (send-telegram-message-to-me))
           booking))))

(defn create-bike
  [_ _ {:keys [prisma user args]}]
  (let [owner-uid (:uid user)]
    (prisma
     [:createBike
      {:modelId (:modelId args)
       :photos {:set (:photos args)}
       :areaIds {:set (:areaIds args)}
       :manufactureYear (:manufactureYear args)
       :mileage (:mileage args)
       :dailyPrice (:dailyPrice args)
       :monthlyPrice (:monthlyPrice args)
       :weeklyPrice (:weeklyPrice args)
       :ownerUid owner-uid
       :whatsapp (:whatsapp args)
       :facebook (:facebook args)
       :onlyContacts (:onlyContacts args)
       :status "MODERATION"}])))

(defn get-photo-thumbnails
  [photos]
  (let [file-names (map #(last (re-find #"bike_photos\%2F(.+)\?" %)) photos)
        url-config {:action "read" :expires "03-01-2500"}
        bucket (.bucket (.storage firebase-admin))]
    (p/all
     (map-indexed
      (fn [index file-name]
        (if (string/includes? file-name "thumb_")
          (p/promise (get photos index))
          (.then
           (.getSignedUrl
            (.file bucket (str "bike_photos/thumb_" file-name))
            (clj->js url-config))
           #(aget % 0))))
      file-names))))

(defn activate-bike
  [_ _ {:keys [prisma args]}]
  (alet [bike (p/await (p/promise (prisma [:bike {:id (:id args)}])))
         photo-thumbnails (p/await (get-photo-thumbnails (.-photos bike)))]
        (prisma [:updateBike {:data {:status "ACTIVE"
                                     :photos {:set photo-thumbnails}}
                              :where {:id (:id args)}}])))

(defn update-bike
  [_ _ {:keys [prisma args]}]
  (alet [bike-id (:id args)
         bike (p/await (p/promise (prisma [:bike {:id bike-id}])))
         photo-changed? (not= (set (js->clj (.-photos bike))) (set (:photos args)))]
        (prisma [:updateBike
                 {:data {:photos {:set (:photos args)}
                         :areaIds {:set (:areaIds args)}
                         :mileage (:mileage args)
                         :dailyPrice (:dailyPrice args)
                         :monthlyPrice (:monthlyPrice args)
                         :weeklyPrice (:weeklyPrice args)
                         :whatsapp (:whatsapp args)
                         :facebook (:facebook args)
                         :onlyContacts (:onlyContacts args)
                         :status (if photo-changed? "MODERATION" "ACTIVE")}
                  :where {:id (:id args)}}])))

(defn delete-bike
  [_ _ {:keys [prisma args]}]
  (prisma [:deleteBike {:id (:id args)}]))

(defn add-bike-to-saved
  [_ _ {:keys [prisma user args]}]
  (alet [saved-list (p/await (p/promise (prisma [:savedBikesList {:userUid (:uid user)}])))]
        (if saved-list
          (prisma [:updateSavedBikesList {:where {:userUid (:uid user)}
                                          :data {:bikes {:connect {:id (:bikeId args)}}}}])
          (prisma [:createSavedBikesList {:userUid (:uid user)
                                          :bikes {:connect {:id (:bikeId args)}}}]))))

(defn remove-bike-from-saved
  [_ _ {:keys [prisma user args]}]
  (prisma [:updateSavedBikesList {:where {:userUid (:uid user)}
                                  :data {:bikes {:disconnect {:id (:bikeId args)}}}}]))

(defn change-role
  [_ _ {:keys [prisma user args]}]
  (let [role (:role args)
        valid-role? (contains? #{"bike-owner" nil} role)]
    (when valid-role?
      (.setCustomUserClaims (.auth firebase-admin) (:uid user) (clj->js {:role role})))))

(defn confirm-booking
  [_ _ {:keys [prisma args]}]
  (prisma [:updateBooking
           {:data {:status "CONFIRMED"}
            :where {:id (:id args)}}]))

(defn cancel-booking
  [_ _ {:keys [prisma args]}]
  (prisma [:updateBooking
           {:data {:status "CANCELED"}
            :where {:id (:id args)}}]))
