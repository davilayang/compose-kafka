# Kafka with Docker Compose

## 

```bash
docker-compose up --build
```

Start another container with the built image 

```bash
# join the same network
docker run -ti --rm --network compose-kafka_default local/kafka bash
cd apache-kafka
# create a topic
bin/kafka-topics.sh --create --topic quickstart-events \
  --partitions 1 --replicate-factor 1 --bootstrap-server kafka-1:9092
bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server kafka-1:9092

# publish message to the topic
bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092

# subscribe to the topic and receive message, in another terminal
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning \
  --bootstrap-server kafka-1:9092
```


## tipcs

Now, let's use the nc command to verify that both the servers are listening on the respective ports:

```bash
nc -vz localhost 22181
# Connection to localhost port 22181 [tcp/*] succeeded!
docker exec -it <container-name> nc -vz localhost 29092
# Connection to localhost port 29092 [tcp/*] succeeded!
```

+ https://www.baeldung.com/ops/kafka-docker-setup
+ https://kafka.apache.org/documentation
+ https://github.com/wurstmeister/kafka-docker/wiki/Connectivity
 

# kafka with Kubernetes

+ https://technology.amis.nl/platform/kubernetes/running-apache-kafka-on-minikube/
+ https://github.com/d1egoaz/minikube-kafka-cluster
+ https://github.com/conduktor/kafka-stack-docker-compose
+ https://github.com/Yolean/kubernetes-kafka
+ https://medium.com/oracledevs/15-minutes-to-get-a-kafka-cluster-running-on-kubernetes-and-start-producing-and-consuming-from-a-b0fa7f8bcfeb
+ https://www.wise.jobs/2021/09/23/running-kafka-in-kubernetes-part-1-why-we-migrated-our-kafka-clusters-to-kubernetes/ 

+ https://www.magalix.com/blog/kafka-on-kubernetes-and-deploying-best-practice
+ https://stackoverflow.com/questions/56259599/im-having-hard-time-setting-up-kafka-on-gke-and-would-like-to-know-the-best-way