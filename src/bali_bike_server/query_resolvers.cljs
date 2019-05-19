(ns bali-bike-server.query-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            [bali-bike-server.constants :as constants]
            [clojure.string :as string]
            ["firebase-admin" :default firebase-admin]
            ["moment" :as moment]))

(defn- named-query
  [query variables]
  (let [cleaned-variables (into {} (remove (comp nil? second) variables))]
    (dissoc
     (reduce (fn [result [variable-name variable-value]]
               (let [text (:text result)
                     values (:values result)
                     index (:index result)]
                 (->
                  result
                  (assoc :text (string/replace text (str variable-name) (str "$" index)))
                  (assoc :values (conj values variable-value))
                  (assoc :index (+ index 1)))))
             {:index 1 :values [] :text query} cleaned-variables)
     :index)))

(def areas-join-statement
  (str "left outer join default$default.\"Bike_areaIds\"  "
       "as \"AreaIds\" "
       "on \"Bike\".\"id\" = \"AreaIds\".\"nodeId\" "))

(def bookings-where-statement
  (str
   "\"Bike\".\"id\" NOT IN "
   "(select \"RelationTable\".\"A\" "
   "from default$default.\"Booking\" as \"Booking\" "
   "JOIN default$default.\"_BikeToBooking\" as "
   "\"RelationTable\" on \"Booking\".\"id\" = \"RelationTable\".\"B\" "
   "where \"Booking\".\"startDate\" <= :end-date AND "
   "\"Booking\".\"endDate\" >= :start-date AND \"Booking\".\"status\" = 'CONFIRMED')"))

(def bike-status-where-statement
  (str "\"Bike\".\"status\" = 'ACTIVE'"))

(def model-where-statement "\"Bike\".\"modelId\" = :model-id ")
(def area-where-statement "\"AreaIds\".\"value\" = :area-id ")
(def whatsapp-where-statement "\"Bike\".\"whatsapp\" = :whatsapp ")
(def min-daily-price-where-statement "\"Bike\".\"dailyPrice\" >= :min-daily-price ")
(def max-daily-price-where-statement "\"Bike\".\"dailyPrice\" <= :max-daily-price ")
(def min-weekly-price-where-statement "\"Bike\".\"weeklyPrice\" >= :min-weekly-price ")
(def max-weekly-price-where-statement "\"Bike\".\"weeklyPrice\" <= :max-weekly-price ")
(def min-monthly-price-where-statement "\"Bike\".\"monthlyPrice\" >= :min-monthly-price ")
(def max-monthly-price-where-statement "\"Bike\".\"monthlyPrice\" <= :max-monthly-price ")

(defn order-statement
  [order]
  (case order
    "DATE_ASC" " order by \"Bike\".id asc "
    "DATE_DESC" " order by \"Bike\".id desc "
    "DAILY_PRICE_ASC" " order by \"Bike\".\"dailyPrice\" asc, \"Bike\".id desc "
    "DAILY_PRICE_DESC" " order by \"Bike\".\"dailyPrice\" desc, \"Bike\".id desc "
    "WEEKLY_PRICE_DESC" " order by \"Bike\".\"weeklyPrice\" desc, \"Bike\".id desc "
    "MONTHLY_PRICE_ASC" " order by \"Bike\".\"monthlyPrice\" asc, \"Bike\".id desc "
    "MONTHLY_PRICE_DESC" " order by \"Bike\".\"monthlyPrice\" desc, \"Bike\".id desc "
    " order by \"Bike\".id desc "))

(defn- query-bikes
  [pg-client args]
  (let [start-date (.toISOString (moment (:startDate args)))
        end-date (.toISOString (moment (:endDate args)))
        whatsapp (when (:whatsapp args) (str "+" (:whatsapp args)))
        bikes-order (:orderBy args)
        area-id (:areaId args)
        model-id (:modelId args)
        min-daily-price (:minDailyPrice args)
        max-daily-price (:maxDailyPrice args)
        min-weekly-price (:minWeeklyPrice args)
        max-weekly-price (:maxWeeklyPrice args)
        min-monthly-price (:minMonthlyPrice args)
        max-monthly-price (:maxMonthlyPrice args)
        where-statements (remove nil?
                                 [(when (and start-date end-date) bookings-where-statement)
                                  (when area-id area-where-statement)
                                  (when model-id model-where-statement)
                                  (when whatsapp whatsapp-where-statement)
                                  (when min-daily-price min-daily-price-where-statement)
                                  (when max-daily-price max-daily-price-where-statement)
                                  (when min-weekly-price min-weekly-price-where-statement)
                                  (when max-weekly-price max-weekly-price-where-statement)
                                  (when min-monthly-price min-monthly-price-where-statement)
                                  (when max-monthly-price max-monthly-price-where-statement)
                                  bike-status-where-statement])]
    (p/then
     (p/promise
      (.query
       pg-client
       (clj->js
        (named-query
         (str "select \"Bike\".* from default$default.\"Bike\" as \"Bike\" "
              (when area-id areas-join-statement)
              (when-not (empty? where-statements)
                (str "where " (string/join " AND " where-statements)))
              (order-statement bikes-order)
              "limit :first "
              "offset :skip")
         {:start-date start-date
          :end-date end-date
          :area-id area-id
          :model-id model-id
          :whatsapp whatsapp
          :min-daily-price min-daily-price
          :max-daily-price max-daily-price
          :min-weekly-price min-weekly-price
          :max-weekly-price max-weekly-price
          :min-monthly-price min-monthly-price
          :max-monthly-price max-monthly-price
          :first (:first args)
          :skip (:skip args)}))))
     #(.-rows %))))

(defn- query-bike-photos
  [pg-client bikes]
  (if (empty? bikes)
    (p/promise nil)
    (let [bike-ids (map #(get % "id") (js->clj bikes))]
      (p/then
       (p/promise
        (.query
         pg-client
         #js {:text (str "select default$default.\"Bike_photos\".* "
                         "from default$default.\"Bike_photos\" "
                         "where default$default.\"Bike_photos\".\"nodeId\" "
                         "in ("
                         (string/join
                          ", "
                          (reduce #(conj %1 (str "$" (+ 1 %2))) [] (range (count bike-ids))))
                         ")")
              :values (clj->js bike-ids)}))
       #(.-rows %)))))

(defn- merge-photos-to-bikes
  [bikes photos]
  (if (or (empty? bikes) (empty? photos))
    (p/promise nil)
    (let [grouped-photos (group-by #(get % "nodeId") (js->clj photos))
          grouped-sorted-photos (reduce
                                 #(assoc %1 (first %2)
                                         (map (fn [p] (get p "value"))
                                              (sort (fn [a b]
                                                      (> (get "position" a)
                                                         (get "position" b)))
                                                    (second %2))))
                                 {}
                                 grouped-photos)]
      (map #(do (set! (.-photos %) (clj->js (get grouped-sorted-photos (.-id %))))
                (identity %))
           bikes))))

(defn bikes
  [_ _ {:keys [prisma args pg-client]}]
  (alet [bikes (p/await (query-bikes pg-client args))
         bike-photos (p/await (query-bike-photos pg-client bikes))
         bikes-with-photos (merge-photos-to-bikes bikes bike-photos)]
        (clj->js bikes-with-photos)))

(defn own-bikes
  [_ _ {:keys [prisma user]}]
  (prisma [:bikes {:where {:ownerUid (:uid user)} :orderBy :id_DESC}]))

(defn bikes-on-moderation
  [_ _ {:keys [prisma]}]
  (prisma [:bikes {:where {:status "MODERATION"}}]))

(defn saved-bikes
  [_ _ {:keys [prisma user]}]
  (prisma [:savedBikesList {:userUid (:uid user)} [:bikes]]))

(defn bike
  [_ _ {:keys [prisma args]}]
  (prisma [:bike {:id (:id args)}]))

(defn bike-saved
  [_ _ {:keys [prisma parent user]}]
  (when user
    (alet [saved-bikes-query [:savedBikesList {:userUid (:uid user)} [:bikes]]
           saved-bikes (p/await (p/promise (prisma saved-bikes-query)))]
          (= (count (filterv #(= (.-id %) (:id parent)) saved-bikes)) 1))))

(defn bike-owner
  [_ _ {:keys [parent]}]
  (alet [user (p/await (.getUser (.auth firebase-admin) (:ownerUid parent)))]
        #js {:name (.-displayName user)
             :photoURL (.-photoURL user)
             :uid (.-uid user)}))

(defn bike-reviews
  [_ _ {:keys [prisma parent]}]
  (prisma [:bike {:id (:id parent)} [:reviews]]))

(defn bike-bookings
  [_ _ {:keys [prisma parent]}]
  (prisma [:bike {:id (:id parent)}
           [:bookings {:where {:status "CONFIRMED" :endDate_gt (moment)}}]]))

(defn bookings
  [_ _ {:keys [prisma user]}]
  (prisma [:bookings {:where {:userUid (:uid user)} :orderBy :id_DESC}]))

(defn bike-owner-bookings
  [_ _ {:keys [prisma user]}]
  (prisma [:bookings {:where {:bikeOwnerUid (:uid user)} :orderBy :id_DESC}]))

(defn booking
  [_ _ {:keys [prisma args]}]
  (prisma [:booking {:id (:id args)}]))

(defn booking-bike
  [_ _ {:keys [prisma parent]}]
  (prisma [:booking {:id (:id parent)} [:bike]]))

(defn booking-user
  [_ _ {:keys [parent]}]
  (alet [user (p/await (.getUser (.auth firebase-admin) (:userUid parent)))]
        #js {:name (.-displayName user)
             :photoURL (.-photoURL user)
             :uid (.-uid user)}))

(defn constants
  [_ _ _]
  (let [models (map #(identity {:id (first %) :value (second %)}) constants/models)
        areas (map #(identity {:id (first %) :value (second %)}) constants/areas)]
    (clj->js {:models models :areas areas})))
