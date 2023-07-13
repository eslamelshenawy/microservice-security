#!/bin/bash

set -e
set -x

. ./set-env.sh

cd ..

minikube profile $CLUSTER1_NAME

# make Kubernetes reusing Docker daemon
# https://kubernetes.io/docs/setup/minikube/#reusing-the-docker-daemon
eval $(minikube docker-env)
docker images

mvn clean


cd gateway-service
docker build -t vmware/gateway:1.1 .
cd ..

cd organization-service
docker build -t vmware/organization:1.1 .
cd ..
cd user-service
docker build -t vmware/user:1.1 .
cd ..

docker images

cd scripts