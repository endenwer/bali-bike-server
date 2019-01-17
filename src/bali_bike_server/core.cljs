(ns bali-bike-server.core
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["/prisma-client" :default prisma-client]))

(def resolvers
  {:Query {:bikes (fn [_ args context] (.prisma.bikes context))
           :bike (fn [_ args context] (.prisma.bike context (clj->js {:id (.-id args)})))
           :bookings (fn [_ args context] (.prisma.bookings context))
           :booking (fn [_ args context] (.prisma.booking context (clj->js {:id (.-id args)})))}
   :Bike {:reviews (fn [parent args context]
                     (.reviews (.prisma.bike context (clj->js {:id (.-id parent)}))))}
   :Booking {:bike (fn [parent args context]
                     (.bike (.prisma.booking context (clj->js {:id (.-id parent)}))))}})

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :context {:prisma (.-prisma prisma-client)}})))

(defn main []
  (.start server (fn [] (.log js/console "Started"))))

