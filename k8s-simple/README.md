# 

Starting a Kubernetes cluster with locally built image

## 

```bash
minikube start --cpus 4 --memory 12g
        
docker build --build-arg KAFKA_VERSION=3.0.0 --build-arg SCALA_VERSION=2.13 \
    --tag local/kafka-base image-kafka
minikube image load local/kafka-base
```


## Useful

+ https://github.com/elkozmon/zoonavigator
+ https://farid-baharuddin.medium.com/setting-up-an-apache-zookeeper-cluster-in-docker-8960d5c23f5c