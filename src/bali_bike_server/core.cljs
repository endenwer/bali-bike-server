(ns bali-bike-server.core
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["/prisma-client" :default prisma-client]))

(def resolvers
  {:Query {:bikes (fn [_ args context] (.prisma.bikes context))
           :bike (fn [_ args context] (.prisma.bike context (clj->js {:id (.-bikeId args)})))}})

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :context {:prisma (.-prisma prisma-client)}})))

(defn main []
  (.start server (fn [] (.log js/console "Started")))
  (.log js/console "Hello world!"))

