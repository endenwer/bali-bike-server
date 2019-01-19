(ns bali-bike-server.prisma-utils
  (:require [oops.core :refer [ocall+]]))

(defn exec
  [prisma q]
  (case (count q)
    1 (ocall+ prisma (name (first q)))
    2 (ocall+ prisma (name (first q)) (clj->js (second q)))
    3 (recur (ocall+ prisma (name (first q)) (clj->js (second q))) (last q))))
