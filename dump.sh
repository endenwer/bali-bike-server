#!/bin/sh

eval $(docker-machine env balibike)
docker-compose exec postgres pg_dumpall -c -U prisma > dumps/dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
eval $(docker-machine env -u)
