(ns bali-bike-server.core
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["graphql-shield" :refer [shield]]
            ["/prisma-client" :default prisma-client]
            [bali-bike-server.auth :as auth]
            [bali-bike-server.prisma-utils :as prisma-utils]
            [bali-bike-server.query-resolvers :as query-resolvers]
            [bali-bike-server.mutation-resolvers :as mutation-resolvers]
            [bali-bike-server.rules :as rules]
            [bali-bike-server.middlewares :as middlewares]))

(def resolvers
  {:Query {:bikes query-resolvers/bikes
           :savedBikes query-resolvers/saved-bikes
           :bike query-resolvers/bike
           :bookings query-resolvers/bookings
           :booking query-resolvers/booking}
   :Mutation {:createBooking mutation-resolvers/create-booking
              :addBikeToSaved mutation-resolvers/add-bike-to-saved
              :removeBikeFromSaved mutation-resolvers/remove-bike-from-saved}
   :Bike {:reviews query-resolvers/bike-reviews
          :saved query-resolvers/bike-saved
          :owner query-resolvers/bike-owner}
   :Booking {:bike query-resolvers/booking-bike
             :user query-resolvers/booking-user}})

(def permissions
  (shield (clj->js
          {:Query {:bookings rules/is-authenticated
                   :booking rules/is-booking-owner}
           :Mutation {:createBooking rules/is-authenticated
                      :addBikeToSaved rules/is-authenticated
                      :removeBikeFromSaved rules/is-authenticated}})))

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :middlewares [middlewares/move-params-to-context
                                           middlewares/inject-user
                                           permissions]
                             :context (fn [req]
                                        {:prisma #(prisma-utils/exec (.-prisma prisma-client) %)
                                         :request (.-request req)})})))

(defn main []
  (auth/init)
  (.start server (fn [] (.log js/console "Started"))))
