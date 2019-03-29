#!/bin/sh

eval $(docker-machine env balibike)
docker-compose up -d --no-deps --build app
docker-compose exec app prisma deploy
