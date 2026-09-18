FROM node:lts-alpine@sha256:ebfe2f90462722a7a4de65e91990e97fe0d401c70e0e762c5b53302f905ec1c1

ENV TZ="Europe/London"

USER root

RUN apk update\
    && apk add \
    curl \
    zip \
    bash \
    openjdk17-jdk

RUN apk add --no-cache aws-cli

WORKDIR /app

COPY . .
RUN npm install --ignore-scripts

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]

# This is downloading the linux amd64 aws cli. For M1 macs build and run with the --platform=linux/amd64 argument. eg docker build . --platform=linux/amd64
