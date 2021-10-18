FROM openjdk:8-jre-buster


WORKDIR /app

RUN wget https://dlcdn.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz &&\
  tar -xf kafka_2.13-3.0.0.tgz

RUN mv kafka_2.13-3.0.0 apache-kafka

COPY zookeeper.properties zookeeper.properties

COPY server.properties server.properties
COPY start_kafka.sh start_kafka.sh

RUN chmod +x /app/start_kafka.sh

ENV KFAKA_HOME=/app/apache-kafka

# ENTRYPOINT [ "/app/start_kafka.sh" ]

# docker build -t local/kafka -f image-kafka/Dockerfile
# apache-kafka/bin/zookeeper-server-start.sh zookeeper.properties
# apache-kafka/bin/kafka-server-start.sh server.properties

