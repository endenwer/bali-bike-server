(ns bali-bike-server.core
  (:require-macros [promesa.core :refer [alet]])
  (:require ["graphql-yoga" :refer [GraphQLServer] :rename {GraphQLServer graphql-server}]
            ["graphql-shield" :refer [rule shield]]
            ["/prisma-client" :default prisma-client]
            [bali-bike-server.auth :as auth]
            [oops.core :refer [oset!]]
            [promesa.core :as p]))

(def resolvers
  {:Query {:bikes (fn [_ _ {:keys [prisma]}] (.bikes prisma))
           :bike (fn [_ _ {:keys [prisma args]}] (.bike prisma #js {:id (:id args)}))
           :bookings (fn [_ args {:keys [prisma]}] (.bookings prisma))
           :booking (fn [_ {:keys [id]} {:keys [prisma args]}] (.booking prisma #js {:id (:id args)}))}
   :Mutation {:createBooking (fn [_ _ {:keys [prisma user args]}]
                               (.createBooking
                                prisma
                                #js {:startDate (:startDate args)
                                     :endDate (:endDate args)
                                     :deliveryLocationLongitude (:deliveryLocationLongitude args)
                                     :deliveryLocationLatitude (:deliveryLocationLatitude args)
                                     :deliveryLocationComment (:deliveryLocationComment args)
                                     :deliveryTime (:deliveryTime args)
                                     :userUid (:uid user)
                                     :bike {:connect {:id bikeId}}}))}
   :Bike {:reviews (fn [_ _ {:keys [prisma parent]}]
                     (.reviews (.bike prisma #js {:id (:id parent)})))}
   :Booking {:bike (fn [_ _ {:keys [prisma parent]}]
                     (.bike (.booking prisma #js {:id (:id parent)})))}})

(def is-authenticated
  ((rule) (fn [parent args context info] (js/Boolean (:user context)))))

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
  (if-let [token (.-headers.authorization (:request context))]
    (alet [user (p/await (auth/get-user token))
           new-context (assoc context :user (js->clj user :keywordize-keys true))]
          (resolve root args new-context info))
    (resolve root args context info)))

(defn move-params-to-context
  [resolve parent args context info]
  (resolve
   parent
   args
   (merge
    context
    {:args (js->clj args :keywordize-keys true)
     :parent (js->clj parent :keywordize-keys true)})
   info))

(def server
  (graphql-server. (clj->js {:typeDefs "./schema.graphql"
                             :resolvers (clj->js resolvers)
                             :middlewares [move-params-to-context inject-user permissions]
                             :context (fn [req]
                                        {:prisma (.-prisma prisma-client)
                                         :request (.-request req)})})))

(defn main []
  (auth/init)
  (.start server (fn [] (.log js/console "Started"))))

