#!/bin/bash

set -x

. ./set-env.sh



# add organization
curl -X POST "$(minikube service organization --url -n $NAMESPACE_ORGANIZATION)/" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"address\": \"Main Street\", \"departments\": [ { \"employees\": [ { \"age\": 25, \"id\": 1, \"name\": \"Smith\", \"position\": \"engineer\" } ], \"id\": 1, \"name\": \"Smith\" } ], \"employees\": [ { \"age\": 25, \"id\": 1, \"name\": \"Smith\", \"position\": \"engineer\" } ], \"id\": \"1\", \"name\": \"MegaCorp\"}"

# get organization
http $(minikube service organization --url -n $NAMESPACE_ORGANIZATION)/1/with-employees

# add user
curl -X POST "$(minikube service user --url -n $NAMESPACE_USER)/" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"name\": \"test\", \"id\": \"1\", \"email\": \"test@gmail.com\", \"phone\": \"01009739491\"}"

# get user
http $(minikube service user --url -n $NAMESPACE_USER)/1

# get via gatway:nodeport
#GATEWAY_NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services gateway -n $NAMESPACE_GATEWAY)
#http http://microservices-cluster.info:${GATEWAY_NODEPORT}/employee/

# via ingress
#http http://microservices-cluster.info/employee/
#APP_URL=http://localhost:8080/
#curl -X POST "$APP_URL" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"age\": 25, \"departmentId\": 1, \"id\": \"1\", \"name\": \"Smith\", \"organizationId\": 1, \"position\": \"engineer\"}"
#curl -X GET "$APP_URL" -H "accept: */*" -H "Content-Type: application/json"