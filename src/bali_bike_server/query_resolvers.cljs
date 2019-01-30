(ns bali-bike-server.query-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]
            ["firebase-admin" :default firebase-admin]))

(defn bikes
  [_ _ {:keys [prisma]}]
  (prisma [:bikes]))

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
