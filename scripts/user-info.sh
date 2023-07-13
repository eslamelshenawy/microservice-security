#!/bin/bash

set -x

. ./set-env.sh

http $(minikube service user --url -n $NAMESPACE_USER)/actuator/info