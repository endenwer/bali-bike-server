(ns bali-bike-server.middlewares
  (:require-macros [promesa.core :refer [alet]])
  (:require [promesa.core :as p]
            [bali-bike-server.auth :as auth]))

(defn inject-user
  [resolve root args context info]
  (if-let [token (.get (:request context) "Authorization")]
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
