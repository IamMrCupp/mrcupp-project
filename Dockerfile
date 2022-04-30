# dockerfile for making the TNS site container

# build using a big os container
FROM node:16 AS base
WORKDIR /tmp/website
COPY ./package*.json /tmp/website/
RUN npm install

# make the container we will use for test/dev/etc
FROM base AS src
COPY ./app/ /tmp/website/

# testing
FROM nginx:alpine AS test
COPY --from=src /tmp/website /usr/share/nginx/html

# package the application in a small container using alpine
FROM nginx:alpine AS prod
LABEL org.opencontainers.image.description "Website Container for mrcupp.com"
LABEL org.opencontainers.image.title "mrcupp-project"
LABEL org.opencontainers.image.revision "4"
LABEL org.opencontainers.image.created "2022-04-29"
LABEL org.opencontainers.image.author "Aaron Cupp [mrcupp@mrcupp.com]"
LABEL org.opencontainers.image.homepage "https://mrcupp.com"
COPY --from=src  /tmp/website /usr/share/nginx/html