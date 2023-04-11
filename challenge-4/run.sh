#!/bin/bash

kubectl apply -f manifests/PVs.yml

kubectl apply -f manifests/redis-cluster-service.yml

kubectl apply -f manifests/redis-cluster-statefulset.yml

sleep 5

kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')a