#!/bin/sh

eval "$(docker-machine env -u)"
docker-compose -f local-docker-compose.yml up -d
supervisor index.js
