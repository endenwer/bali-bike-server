(ns bali-bike-server.mutation-resolvers
  (:require [promesa.core :as p :refer-macros [alet]]))

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
