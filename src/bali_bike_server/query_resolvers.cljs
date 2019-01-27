(ns bali-bike-server.query-resolvers)

(defn bikes
  [_ _ {:keys [prisma]}]
  (prisma [:bikes]))

(defn saved-bikes
  [_ _ {:keys [prisma user]}]
  (prisma [:savedBikesList {:userUid (:uid user)} [:bikes]]))

(defn bike
  [_ _ {:keys [prisma args]}]
  (prisma [:bike {:id (:id args)}]))

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
