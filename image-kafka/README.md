# Apache Kafka

## Connection from Host to Docker Network

This is the use case when client is not in the same network as the Kafka cluster. For example, with the Kafka cluster on docker-compose, you try to produce/consume messages on the cluster from you host machine.

The client and server interaction is not one-time but involving initial and subsequent actions. Also the brokers need to be able to talk to each other and to the zookeeper.

Configurations that affect the connectivity are:  

```text
listeners=PLAINTEXT://:9092,PLAINTEXT_HOST://:19092

advertised.listeners=PLAINTEXT://kafka-1:9092,PLAINTEXT_HOST://localhost:19092

listener.security.protocol.map=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
```

1. On initial connection, client makes a request to the given `bootstrap_servers`, e.g. `localhost:19092`. 
    + configured by `listeners`
    + published in `docker-compose.yml`
2. Broker returns host and port for subsequent connections, e.g. `localhost://19092`
    + configured by `advertised.listeners`
3. On subsequent connection, client uses protocol of `PLAINTEXT_HOST` and its port
    + Protocol is defined by `listeners.security.protocol.map`

## Other Tips

Checking if the port is accessible by `nc`

```bash
# checking localhost port
nc -vz localhost 22181
## Connection to localhost port 22181 [tcp/*] succeeded!

# checking container port
docker exec -it <container-name> nc -vz localhost 29092
## Connection to localhost port 29092 [tcp/*] succeeded!
```

## Useful Readings

+ [Official Documentation](https://kafka.apache.org/documentation)
+ [Networking and Connectivity](https://github.com/wurstmeister/kafka-docker/wiki/Connectivity)
+ [Guide to Setting Up Apache Kafka Using Docker](https://www.baeldung.com/ops/kafka-docker-setup)