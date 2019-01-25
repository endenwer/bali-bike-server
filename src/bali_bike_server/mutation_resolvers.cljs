(ns bali-bike-server.mutation-resolvers)

(defn create-booking
  [_ _ {:keys [prisma user args]}]
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
     :bike {:connect {:id (:bikeId args)}}}]))
