(ns bali-bike-server.query-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            [clojure.string :as string]
            ["firebase-admin" :default firebase-admin]
            ["moment" :as moment]))

(defn named-query
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

(defn bikes
  [_ _ {:keys [prisma args pg-client]}]
  (let [start-date (.toISOString (moment (:startDate args)))
        end-date (.toISOString (moment (:endDate args)))
        area-id (:areaId args)
        model-id (:modelId args)]
    (alet [result (p/await
                   (p/promise
                    (.query
                     pg-client
                     (clj->js
                      (named-query
                       (str "select \"Bike\".* from default$default.\"Bike\" as \"Bike\" "
                            (when (and start-date end-date)
                              (str
                               "left outer join default$default.\"_BikeToBooking\" "
                               "as \"RelationTable\" "
                               "on \"Bike\".\"id\" = \"RelationTable\".\"A\" "
                               "left outer join default$default.\"Booking\" as \"Booking\" "
                               "on \"Booking\".\"id\" = \"RelationTable\".\"B\" "))
                            (when area-id
                              (str "left outer join default$default.\"Bike_areaIds\"  "
                                   "as \"AreaIds\" "
                                   "on \"Bike\".\"id\" = \"AreaIds\".\"nodeId\" "))
                            (when (and start-date end-date)
                              (str
                               "where not(\"Booking\".\"startDate\" <= :end-date::timestamptz "
                               "AND \"Booking\".\"endDate\" >= :start-date::timestamptz "
                               "AND \"Booking\".\"status\" = 'CONFIRMED') "
                               "OR \"Booking\".id is null "))
                            (when area-id "where \"AreaIds\".\"value\" = :area-id ")
                            (when model-id "where \"Bike\".\"modelId\" = :model-id ")
                            "order by \"Bike\".id asc "
                            "limit :first "
                            "offset :skip")
                       {:star-date start-date
                        :end-date end-date
                        :area-id area-id
                        :model-id model-id
                        :first (:first args)
                        :skip (:skip args)})))))]
          (.-rows result))))

(defn own-bikes
  [_ _ {:keys [prisma user]}]
  (prisma [:bikes {:where {:ownerUid (:uid user)} :orderBy :id_DESC}]))

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

(defn bookings
  [_ _ {:keys [prisma user]}]
  (prisma [:bookings {:where {:userUid (:uid user)}}]))

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
