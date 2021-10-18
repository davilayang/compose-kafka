# Kafka with Docker Compose

## Getting Started

Start the cluster

```bash
docker-compose up --build
```

Produce and Consume with Python API

```bash
# (see python-api/example.py)
```

Stop and remove the cluster

```bash
docker-compose down --volumes
```

## 

**TODO: kafka on kubernetes**

+ https://technology.amis.nl/platform/kubernetes/running-apache-kafka-on-minikube/
+ https://github.com/d1egoaz/minikube-kafka-cluster
+ https://github.com/Yolean/kubernetes-kafka
+ https://medium.com/oracledevs/15-minutes-to-get-a-kafka-cluster-running-on-kubernetes-and-start-producing-and-consuming-from-a-b0fa7f8bcfeb
+ https://www.wise.jobs/2021/09/23/running-kafka-in-kubernetes-part-1-why-we-migrated-our-kafka-clusters-to-kubernetes/ 
+ https://www.magalix.com/blog/kafka-on-kubernetes-and-deploying-best-practice
+ https://stackoverflow.com/questions/56259599/im-having-hard-time-setting-up-kafka-on-gke-and-would-like-to-know-the-best-way