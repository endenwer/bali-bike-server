(ns bali-bike-server.auth
  (:require-macros [promesa.core :refer [alet]])
  (:require ["firebase-admin" :default firebase-admin]
            [promesa.core :as p]))

(def service-account "serviceAccountKey.json")
(def database-url "https://bali-bike.firebaseio.com")
(def storage-bucket "bali-bike-app.appspot.com")

(defn get-user [token]
  (->
   (alet [auth (.auth firebase-admin)
          decoded-token (p/await (.verifyIdToken auth token))]
         decoded-token)
   (p/catch (fn [error] nil))))

(defn init []
  (let [credential (.credential.cert firebase-admin service-account)]
    (.initializeApp firebase-admin (clj->js {:credential credential
                                             :databaseURL database-url
                                             :storageBucket storage-bucket}))))
