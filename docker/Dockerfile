FROM alpine:3.11.5 AS java
RUN apk update && apk add openjdk11-jre

FROM java
WORKDIR /app
COPY hello.jar /app/
ENTRYPOINT java -jar hello.jar
