# dockerfile for making the TNS site container

# build using a big os container
FROM node:16 AS base
WORKDIR /tmp/website
COPY ./package*.json /tmp/website/
RUN npm install

# source image for all future containers
FROM base AS src
COPY ./app/ /tmp/website/

# testing image
FROM nginx:alpine AS test
COPY --from=src /tmp/website /usr/share/nginx/html

# production images
# package the application in a small container using alpine
FROM nginx:alpine AS prod

LABEL org.opencontainers.image.description "Website Container for mrcupp.com"
LABEL org.opencontainers.image.title "mrcupp-project"
LABEL org.opencontainers.image.revision "4"
LABEL org.opencontainers.image.created "2022-04-29"
LABEL org.opencontainers.image.author "Aaron Cupp [mrcupp@mrcupp.com]"
LABEL org.opencontainers.image.homepage "https://mrcupp.com"
LABEL org.opencontainers.image.source "https://github.com/iammrcupp/mrcupp-project"

COPY --from=src  /tmp/website /usr/share/nginx/html