# Apache Kafka on Kubernetes

```bash
# get the necessary images
gcloud auth configure-docker 

docker pull marketplace.gcr.io/google/kafka/zookeeper:2.8
docker pull marketplace.gcr.io/google/kafka:2.8
```

```bash
minikube start
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

# test with kcat, i.e. kafkacat

# final clean up
minikube delete --all
```

```bash
# run a temporary pod
kubectl run -it --rm temp-pod --image busybox -- sh 
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

Kafkacat, or Kcat

+ https://github.com/edenhill/kcat
+ https://github.com/GoogleCloudPlatform/click-to-deploy/tree/master/k8s/kafka