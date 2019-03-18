* Setup new server
`docker-compose -f initial-docker-compose.yml up`
`docker-machine ssh balibike`
`/etc/ssl/certs && sudo openssl dhparam -out dhparam-2048.pem 2048`
`docker-compose up -d`
`docker-compose up -d --no-deps --build nginx`
`docker-compose exec app prisma deploy`
