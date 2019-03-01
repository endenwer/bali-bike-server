(ns bali-bike-server.mutation-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            ["firebase-admin" :default firebase-admin]
            ["moment-precise-range-plugin"]
            ["moment" :as moment]))

(defn get-dates-diff
  [start-date end-date]
  (js->clj (.preciseDiff moment (moment start-date) (moment end-date) true) :keywordize-keys true))

(defn round-to-thousands
  [number]
  (* (js/Math.round (/ number 1000)) 1000))

(defn- calculate-total-price
  [{:keys [start-date end-date monthly-price daily-price]}]
  (let [dates-diff (get-dates-diff start-date end-date)
        calculated-daily-price (if (> (:months dates-diff) 0)
                                (round-to-thousands (/ monthly-price 30))
                                daily-price)]
    (+ (* monthly-price (:months dates-diff))
       (* calculated-daily-price (:days dates-diff)))))

(defn create-booking
  [_ _ {:keys [prisma user args]}]
  (alet [bike (p/await (p/promise (prisma [:bike {:id (:bikeId args)}])))
         monthly-price (.-monthlyPrice bike)
         daily-price (.-dailyPrice bike)
         total-price (calculate-total-price {:start-date (:startDate args)
                                             :end-date (:endDate args)
                                             :monthly-price monthly-price
                                             :daily-price daily-price})]
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
           :dailyPrice daily-price
           :totalPrice total-price
           :bike {:connect {:id (:bikeId args)}}}])))

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
       :ownerUid owner-uid}])))

(defn update-bike
  [_ _ {:keys [prisma args]}]
  (let [bike-id (:id args)]
    (prisma [:updateBike
             {:data {:photos {:set (:photos args)}
                     :areaIds {:set (:areaIds args)}
                     :mileage (:mileage args)
                     :dailyPrice (:dailyPrice args)
                     :monthlyPrice (:monthlyPrice args)}
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
