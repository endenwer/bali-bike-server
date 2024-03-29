(ns bali-bike-server.core
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["graphql-shield" :as graphql-shield :refer [shield]]
            ["/prisma-client" :default prisma-client]
            ["pg" :as pg]
            [promesa.async-cljs :refer-macros [async]]
            [promesa.core :as p]
            [bali-bike-server.auth :as auth]
            [bali-bike-server.prisma-utils :as prisma-utils]
            [bali-bike-server.query-resolvers :as query-resolvers]
            [bali-bike-server.mutation-resolvers :as mutation-resolvers]
            [bali-bike-server.rules :as rules]
            [bali-bike-server.middlewares :as middlewares]))

(goog-define pg-host "localhost")

(def pg-client
  (pg/Client. #js {:database "prisma"
                   :user "prisma"
                   :password "prisma"
                   :host pg-host
                   :port 5432}))

(def resolvers
  {:Query {:bikes query-resolvers/bikes
           :savedBikes query-resolvers/saved-bikes
           :ownBikes query-resolvers/own-bikes
           :bikesOnModeration query-resolvers/bikes-on-moderation
           :bike query-resolvers/bike
           :bookings query-resolvers/bookings
           :bikeOwnerBookings query-resolvers/bike-owner-bookings
           :booking query-resolvers/booking
           :constants query-resolvers/constants}
   :Mutation {:createBooking mutation-resolvers/create-booking
              :addBikeToSaved mutation-resolvers/add-bike-to-saved
              :removeBikeFromSaved mutation-resolvers/remove-bike-from-saved
              :createBike mutation-resolvers/create-bike
              :updateBike mutation-resolvers/update-bike
              :deleteBike mutation-resolvers/delete-bike
              :activateBike mutation-resolvers/activate-bike
              :changeRole mutation-resolvers/change-role
              :confirmBooking mutation-resolvers/confirm-booking
              :cancelBooking mutation-resolvers/cancel-booking}
   :Bike {:reviews query-resolvers/bike-reviews
          :saved query-resolvers/bike-saved
          :owner query-resolvers/bike-owner
          :bookings query-resolvers/bike-bookings}
   :Booking {:bike query-resolvers/booking-bike
             :user query-resolvers/booking-user}})

(def permissions
  (shield (clj->js
          {:Query {:bookings rules/is-authenticated
                   :bikeOwnerBookings rules/is-authenticated
                   :booking rules/is-booking-owner
                   :ownBikes rules/is-authenticated
                   :bikesOnModeration rules/is-moderator}
           :Mutation {:createBooking rules/is-authenticated
                      :addBikeToSaved rules/is-authenticated
                      :removeBikeFromSaved rules/is-authenticated
                      :createBike rules/is-authenticated
                      :updateBike (graphql-shield/or rules/is-bike-owner rules/is-moderator)
                      :deleteBike (graphql-shield/or rules/is-bike-owner rules/is-moderator)
                      :activateBike rules/is-moderator
                      :changeRole rules/is-authenticated
                      :confirmBooking rules/is-booking-bike-owner
                      :cancelBooking rules/is-booking-bike-owner}})))

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :middlewares [middlewares/move-params-to-context
                                           middlewares/inject-user
                                           permissions]
                             :context (fn [req]
                                        {:prisma #(prisma-utils/exec (.-prisma prisma-client) %)
                                         :request (.-request req)
                                         :pg-client pg-client})})))

(defn main []
  (->
   (async
    (p/await (.connect pg-client))
    (auth/init)
    (.start server (fn [] (.log js/console "Started"))))
   (p/catch #(.log js/console %))))
