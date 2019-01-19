(ns bali-bike-server.mutation-resolvers)

(defn create-booking
  [_ _ {:keys [prisma user args]}]
  (prisma
   [:createBooking
    {:startDate (:startDate args)
     :endDate (:endDate args)
     :deliveryLocationLongitude (:deliveryLocationLongitude args)
     :deliveryLocationLatitude (:deliveryLocationLatitude args)
     :deliveryLocationComment (:deliveryLocationComment args)
     :deliveryTime (:deliveryTime args)
     :userUid (:uid user)
     :bike {:connect {:id (:bikeId args)}}}]))
