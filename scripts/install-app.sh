#!/bin/bash

# set -e
set -x

. ./set-env.sh


#minikube addons enable ingress

cd ../k8s

kubectl config use-context $CLUSTER1_NAME
kubectl apply -n $NAMESPACE_ORGANIZATION -f organization-configmap.yaml
kubectl apply -n $NAMESPACE_ORGANIZATION -f organization-secret.yaml
kubectl apply -n $NAMESPACE_ORGANIZATION -f organization-deployment.yaml
kubectl apply -n $NAMESPACE_USER -f user-configmap.yaml
kubectl apply -n $NAMESPACE_USER -f user-secret.yaml
kubectl apply -n $NAMESPACE_USER -f user-deployment.yaml
kubectl apply -n $NAMESPACE_GATEWAY -f gateway-configmap.yaml
kubectl apply -n $NAMESPACE_GATEWAY -f gateway-deployment.yaml
kubectl apply -n $NAMESPACE_GATEWAY -f gateway-secret.yaml
kubectl apply -n $NAMESPACE_GATEWAY -f ingress.yaml

# set Minikupe IP for microservices-cluster.info in /etc/hosts
minikube profile $CLUSTER1_NAME
CLUSTER1_IP=$(minikube ip)
echo $CLUSTER1_IP
sudo sed -i.bak 's/.*microservices-cluster.info/'"$CLUSTER1_IP"' microservices-cluster.info/' /etc/hosts && sudo rm /etc/hosts.bak
echo "$(minikube ip) microservices-cluster.info" | sudo tee -a /etc/hosts

cd ../scripts
