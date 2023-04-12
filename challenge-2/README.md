# Challenge 2 - Troubleshooting and Deploying Objects on a 2-Node Kubernetes Cluster

This directory contains the solution to the Challenge 2 of the KodeKloud Kubernetes Challenges. The challenge consists of troubleshooting and fixing a broken 2-Node Kubernetes cluster and deploying objects based on the given architecture diagram.

find the lab [here](https://kodekloud.com/topic/lab-kubernetes-challenge-2/)

## Architecture Diagram

The architecture diagram for this challenge can be found in the `challenge2-arch.png` file.

![Challenge 2 Architecture Diagram](./challenge2-arch.png)

## Solution

To fix the issues with the controlplane node, I performed the following steps:

1. Replaced port number _6433_ with _6443_ in the kube config file by running this command:
    ```bash
    sed -i 's/6433/6443/' /root/.kube/config
    ```

2. Replaced `ca-authority.crt` with `ca.crt `in the `kube-apiserver` manifest file:
    ```bash
    sed -i 's/ca-authority.crt/ca.crt/' /etc/kubernetes/manifests/kube-apiserver.yaml
    ```
    as there is no ca-authority.crt file in /etc/kubernetes/pki directory

3. Restarted the kubelet service using this command:
    ```bash
    systemctl restart kubelet
    ```

Fix the image of the `coredns` deployment

```bash
kubectl set image deployment/coredns coredns=k8s.gcr.io/coredns/coredns:v1.8.6 -n kube-system
```

Fix `node01` node by Allowing scheduling of pods on it

```bash
kubectl uncordon node01
```

Finally, I copied all images from the `/media` directory on the `controlplane` node to the `/web` directory on `node01` 

```bash
scp /media/* node01:/web
```

The following files were used to deploy the Kubernetes objects:

- `data-pv.yml`: YAML file to define the Persistent Volumes for storing the image data.
- `data-pvc.yml`: YAML file to define the Persistent Volume Claims for the image data.
- `gop-fileserver-pod.yml`: YAML file to define the file server pod that serves the image data.
- `gop-fs-service.yml`: YAML file to define the service that exposes the file server pod.

## Automate the Deploying

The `deploy-objects.sh` file contains the necessary commands to fix nodes and deploy the Kubernetes objects to the cluster.

To automate the solution process, run the following command:

```
./deploy-objects.sh
```

This will deploy the Kubernetes objects and configure the image gallery system.