#!/bin/bash

# Apply the developer role YAML file
kubectl apply -f manifests/developer-role.yml

# Apply the developer role binding YAML file
kubectl apply -f manifests/developer-rolebinding.yml

# Apply the Jekyll PVC YAML file
kubectl apply -f manifests/jekyll-pvc.yml

# Apply the Jekyll Pod YAML file
kubectl apply -f manifests/jekyll-pod.yml

# Apply the Jekyll NodePort Service YAML file
kubectl apply -f manifests/jekyll-node-service.yml

# Set the credentials for user 'martin' with their client certificate and private key
kubectl config set-credentials martin --client-key=martin.key --client-certificate=martin.crt

# Set the context for the Kubernetes cluster with user 'martin' and cluster 'kubernetes' as the current context
kubectl config set-context developer --user=martin --cluster kubernetes

# Set the current context to 'developer'
kubectl config use-context developer


