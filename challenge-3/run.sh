#!/bin/bash

kubectl apply -f manifests/vote-namespace.yml

sleep 2

kubectl apply -f manifests/vote-deployment.yml
kubectl apply -f manifests/vote-service.yml

sleep 2

kubectl apply -f manifests/redis-deployment.yml
kubectl apply -f manifests/redis-service.yml

sleep 2

kubectl apply -f manifests/worker-deployment.yml

sleep 2

kubectl apply -f manifests/db-deployment.yml
kubectl apply -f manifests/db-service.yml

sleep 2

kubectl apply -f manifests/result-deployment.yml
kubectl apply -f manifests/result-service.yml