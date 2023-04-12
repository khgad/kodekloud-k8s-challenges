# Kodekloud K8s Challenge 1 Solution

This is my solution for the first challenge of the Kodekloud Kubernetes (K8s) challenges. The goal was to deploy the given architecture diagram for implementing a Jekyll Static Site Generator (SSG).

## Architecture Diagram

The architecture diagram for this challenge can be found in the `challenge1-arch.png` file.

![Challenge 1 Architecture Diagram](./challenge1-arch.png)

## Solution

To deploy the Jekyll SSG, I created the following Kubernetes manifest files:

- `deploy-jekyll-app.sh`: A shell script to deploy all the Kubernetes manifest files and complete the challenge.

- `/manifests/developer-role.yml`: A Kubernetes Role manifest file that defines the permissions for the `developer` user.

- `/manifests/developer-rolebinding.yml`: A Kubernetes RoleBinding manifest file that binds the `developer` user to the `developer` Role.

- `/manifests/jekyll-node-service.yml`: A Kubernetes Service manifest file that exposes the Jekyll node app on a NodePort.

- `/manifests/jekyll-pvc.yml`: A Kubernetes PersistentVolumeClaim manifest file that defines the persistent storage for the Jekyll app.

- `/manifests/jekyll-pod.yml`: A Kubernetes Pod manifest file that defines the Jekyll app container.

Then, I ran the following commands to accomplish the following:

- Set the credentials for user `martin`
    ```bash
    kubectl config set-credentials martin --client-key=martin.key --client-certificate=martin.crt
    ```
- Create context for the Kubernetes cluster with user `martin` and cluster `kubernetes`
    ```bash
    kubectl config set-context developer --user=martin --cluster kubernetes
    ```
- Set the current context to `developer`
    ```bash
    kubectl config use-context developer
    ```
## Deploying the Solution

To deploy the solution, run the `deploy-jekyll-app.sh` script:

```bash
./deploy-jekyll-app.sh
```

This will create all the necessary Kubernetes objects and deploy the Jekyll SSG app.