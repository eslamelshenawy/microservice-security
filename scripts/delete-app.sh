#!/bin/bash

set -x

. ./set-env.sh

kubectl config set-context $CLUSTER1_NAME
kubectl config use-context $CLUSTER1_NAME

kubectl delete -n $NAMESPACE_GATEWAY deployment gateway
kubectl delete -n $NAMESPACE_GATEWAY service gateway
kubectl delete -n $NAMESPACE_GATEWAY configmap gateway
kubectl delete -n $NAMESPACE_GATEWAY ingress gateway-ingress


kubectl delete -n $NAMESPACE_USER deployment user
kubectl delete -n $NAMESPACE_USER service user
kubectl delete -n $NAMESPACE_USER secret user
kubectl delete -n $NAMESPACE_USER configmap user







