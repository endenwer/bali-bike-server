(ns bali-bike-server.query-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            ["firebase-admin" :default firebase-admin]
            ["moment" :as moment]))

(defn bikes
  [_ _ {:keys [prisma args pg-client]}]
  (let [start-date (.toISOString (moment (:startDate args)))
        end-date (.toISOString (moment (:endDate args)))]
    (if (and start-date end-date)
      (alet [result (p/await
                     (p/promise
                      (.query
                       pg-client
                       (str "select \"Bike\".* from default$default.\"Bike\" as \"Bike\" "
                            "left outer join default$default.\"_BikeToBooking\" as \"RelationTable\" "
                            "on \"Bike\".\"id\" = \"RelationTable\".\"A\" "
                            "left outer join default$default.\"Booking\" as \"Booking\" "
                            "on \"Booking\".\"id\" = \"RelationTable\".\"B\" "
                            "where not(\"Booking\".\"startDate\" <= "
                            "'" end-date "' "
                            "AND \"Booking\".\"endDate\" >= "
                            "'" start-date "' "
                            "AND \"Booking\".\"status\" = 'CONFIRMED') "
                            "OR \"Booking\".id is null "
                            "order by \"Bike\".id asc "
                            "limit " (:first args) " "
                            "offset " (:skip args)))))]
            (.-rows result))
      (do
        (prisma [:bikes {:first (:first args) :skip (:skip args)}])))))

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
