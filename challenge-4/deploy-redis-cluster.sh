#!/bin/bash

# Apply the Persistent Volumes configuration.
kubectl apply -f manifests/PVs.yml

# Apply the Redis cluster service configuration.
kubectl apply -f manifests/redis-cluster-service.yml

# Apply the Redis cluster statefulset configuration.
kubectl apply -f manifests/redis-cluster-statefulset.yml

# Sleep for 5 seconds to allow time for the statefulset to be created.
sleep 5

# Execute the redis-cli command to create a Redis cluster with 3 masters and 3 replicas.
kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')a
