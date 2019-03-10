FROM node:8

# install clojure
WORKDIR /tmp
ENV CLOJURE_VERSION=1.9.0.375
RUN apt-get update \
  && apt-get -q -y install openjdk-8-jdk curl \
  && npm install -g shadow-cljs \
  && npm install -g prisma \
  && curl -s https://download.clojure.org/install/linux-install-$CLOJURE_VERSION.sh | bash

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN rm prisma.yml
RUN cp prisma.prod.yml prisma.yml
RUN shadow-cljs release app
ENV NODE_ENV production
EXPOSE 4000
CMD [ "npm", "start" ]