FROM openjdk:8-jre-buster

WORKDIR /app

ENV KFAKA_HOME=/app/apache-kafka

ARG KAFKA_VERSION
ARG SCALA_VERSION

RUN wget https://dlcdn.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz &&\
  tar -xf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
  mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} apache-kafka && \
  rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

# copy zookeeper configuration
COPY zookeeper.properties zookeeper.properties

# copy kafka configuration and update script
COPY server.properties server.properties

COPY start_kafka.sh start_kafka.sh
RUN chmod +x /app/start_kafka.sh

# docker build -t local/kafka-base -f image-kafka/Dockerfile
# apache-kafka/bin/zookeeper-server-start.sh zookeeper.properties
# apache-kafka/bin/kafka-server-start.sh server.properties
