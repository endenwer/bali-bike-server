(ns bali-bike-server.rules
  (:require [promesa.core :as p]
            ["graphql-shield" :refer [rule]]))

(def is-authenticated
  ((rule) (fn [parent args context info] (js/Boolean (:user context)))))

(def is-booking-owner
  ((rule) (fn [_ _ {:keys [prisma user args]}]
            (when user
              (->
               (p/promise (prisma [:booking {:id (:id args)}]))
               (p/then (fn [booking] (= (.-userUid booking) (:uid user)))))))))

(def is-bike-owner
  ((rule) (fn [_ _ {:keys [prisma user args]}]
            (when user
              (->
               (p/promise (prisma [:bike {:id (:id args)}]))
               (p/then (fn [bike] (= (.-ownerUid bike) (:uid user)))))))))
