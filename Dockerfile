FROM node:lts-alpine@sha256:c6ad9e9c1d80f6eb607c26b4b0a132ff7a2344fad1c78ea3baa2a7d4c8de6d94

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
