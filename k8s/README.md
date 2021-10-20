# Apache Kafka on Kubernetes

Prepare the docker images

```bash
# get the necessary images
gcloud auth configure-docker 

docker pull marketplace.gcr.io/google/kafka/zookeeper:2.8
docker pull marketplace.gcr.io/google/kafka:2.8
```

Start cluster with minikube

```bash
minikube start --cpus 4 --memory 12g
minikube dashboard

# add the images from host
minikube image load marketplace.gcr.io/google/kafka/zookeeper:2.8
minikube image load marketplace.gcr.io/google/kafka:2.8

# shell into the minikube cluster
minikube ssh
docker image ls # list the docker images on cluster

## could just give the directory ## 
# zookeeper
kubectl apply -f k8s/templates/zk-config-scripts.yaml
kubectl apply -f k8s/templates/zk-services.yaml
kubectl apply -f k8s/templates/zk-statefulset.yaml

# kafka
kubectl apply -f k8s/templates/kafka-secrets.yaml
kubectl apply -f k8s/templates/kafka-service.yaml
kubectl apply -f k8s/templates/kafka-poddisruptionbudget.yaml
kubectl apply -f k8s/templates/kafka-statefulset.yaml
```

Test with kafkacat, or kcat

+ https://github.com/edenhill/kcat

```bash
docker pull edenhill/kcat:1.7.0
minikube image load edenhill/kcat:1.7.0
kubectl run --rm -it kcat-client --command sh --image edenhill/kcat:1.7.0

# list brokers and topics in the cluster
kafkacat -L -b minikube-kafka-client # minikube-kafka-client is kafka service name

# produce message to topic "test-topic", this also creates the topic "test-topic"
kafkacat -P -b minikube-kafka-client -t test-topic 
## type the message at each line, then Ctrl+D

# consume messages from topic "test-topic"
kafkacat -C -b minikube-kafka-client -t test-topic
```

Clean up

```bash
minikube delete --all
```

**TODO**:  

+ interacting from outside the cluster, i.e. host network
+ ... 

## Ref

**TODO: kafka on kubernetes**

+ https://technology.amis.nl/platform/kubernetes/running-apache-kafka-on-minikube/
+ https://github.com/d1egoaz/minikube-kafka-cluster
+ https://github.com/Yolean/kubernetes-kafka
+ https://medium.com/oracledevs/15-minutes-to-get-a-kafka-cluster-running-on-kubernetes-and-start-producing-and-consuming-from-a-b0fa7f8bcfeb
+ https://www.wise.jobs/2021/09/23/running-kafka-in-kubernetes-part-1-why-we-migrated-our-kafka-clusters-to-kubernetes/ 
+ https://www.magalix.com/blog/kafka-on-kubernetes-and-deploying-best-practice
+ https://stackoverflow.com/questions/56259599/im-having-hard-time-setting-up-kafka-on-gke-and-would-like-to-know-the-best-way

Kafkacat, or Kcat

+ https://github.com/edenhill/kcat
+ https://github.com/GoogleCloudPlatform/click-to-deploy/tree/master/k8s/kafka