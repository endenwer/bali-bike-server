(ns bali-bike-server.core
  (:require-macros [promesa.core :refer [alet]])
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["graphql-shield" :refer [rule shield]]
            ["/prisma-client" :default prisma-client]
            [bali-bike-server.auth :as auth]
            [oops.core :refer [oset!]]
            [promesa.core :as p]))

(def resolvers
  {:Query {:bikes (fn [_ args context] (.prisma.bikes context))
           :bike (fn [_ args context] (.prisma.bike context (clj->js {:id (.-id args)})))
           :bookings (fn [_ args context] (.prisma.bookings context))
           :booking (fn [_ args context] (.prisma.booking context (clj->js {:id (.-id args)})))}
   :Mutation {:createBooking (fn [_ args context]
                               (.prisma.createBooking
                                context
                                (clj->js {:startDate (.-startDate args)
                                          :endDate (.-endDate args)
                                          :deliveryLocationLongitude (.-deliveryLocationLongitude args)
                                          :deliveryLocationLatitude (.-deliveryLocationLatitude args)
                                          :deliveryLocationComment (.-deliveryLocationComment args)
                                          :deliveryTime (.-deliveryTime args)
                                          :userUid (.-user.uid context)
                                          :bike {:connect {:id (.-bikeId args)}}})))}
   :Bike {:reviews (fn [parent args context]
                     (.reviews (.prisma.bike context (clj->js {:id (.-id parent)}))))}
   :Booking {:bike (fn [parent args context]
                     (.bike (.prisma.booking context (clj->js {:id (.-id parent)}))))}})

(def is-authenticated
  ((rule) (fn [parent args context info] (js/Boolean (.-user context)))))

(def is-booking-owner
  ((rule) (fn [parrent args context info]
            (if-let [user (.-user context)]
              (->
               (p/promise (.prisma.booking context (clj->js {:id (.-id args)})))
               (p/then (fn [booking] (= (.-userUid booking) (.-uid user)))))))))

(def permissions
  (shield (clj->js
          {:Query {:bookings is-authenticated
                   :booking is-booking-owner}
           :Mutation {:createBooking is-authenticated}})))

(defn inject-user
  [resolve root args context info]
  (if-let [token (.-request.headers.authorization context)]
    (alet [user (p/await (auth/get-user token))
           new-context (oset! context "!user" user)]
          (resolve root args new-context info))
    (resolve root args context info)))

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :middlewares [inject-user permissions]
                             :context (fn [req]
                                        (clj->js
                                         {:prisma (.-prisma prisma-client)
                                          :request (.-request req)}))})))

(defn main []
  (auth/init)
  (.start server (fn [] (.log js/console "Started"))))

