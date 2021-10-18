FROM local/kafka-base:latest

WORKDIR /app

RUN rm zookeeper.properties && rm server.properties

COPY server.properties server.properties

# start another kafka broker, with broker-id = 2
