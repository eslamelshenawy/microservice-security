#!/bin/bash

set -x

. ./set-env.sh

. ./delete-all.sh

kubectl config set-context $CLUSTER1_NAME
kubectl config use-context $CLUSTER1_NAME

kubectl delete clusterrolebinding service-pod-reader-gateway
kubectl delete clusterrolebinding service-pod-reader-organization
kubectl delete clusterrolebinding service-pod-reader-user
kubectl delete clusterrolebinding service-pod-reader-mongo

kubectl delete serviceaccount $SA_NAME -n $NAMESPACE_GATEWAY
kubectl delete serviceaccount $SA_NAME -n $NAMESPACE_ORGANIZATION
kubectl delete serviceaccount $SA_NAME -n $NAMESPACE_USER
kubectl delete serviceaccount $SA_NAME -n $NAMESPACE_MONGO

kubectl delete clusterrole microservices-kubernetes-namespace-reader

kubectl delete namespace $NAMESPACE_GATEWAY
kubectl delete namespace $NAMESPACE_ORGANIZATION
kubectl delete namespace $NAMESPACE_USER
kubectl delete namespace $NAMESPACE_MONGO
