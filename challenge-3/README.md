# Challenge 3 - Deploying the Voting App in Kubernetes

This challenge involves deploying the Voting App on a Kubernetes cluster using the YAML files provided in the `manifests` directory. 

## Architecture Diagram

The architecture diagram for the Voting App can be found in the `challenge3-arch.png` file. The app components are deployed in the `vote` namespace.

![Challenge 3 Architecture Diagram](./challenge3-arch.png)

## Solution

To deploy the Voting App, follow these steps:

1. Create the `vote` namespace by running the following command:
   
   ```bash
   kubectl apply -f manifests/vote-namespace.yml
   ```
2. Deploy the `vote` application by running the following command:
   
   ```bash
   kubectl apply -f manifests/vote-deployment.yml
   ```
   This will create a deployment for the `vote` application.

3. Expose the `vote` deployment by running the following command:
   
   ```bash
   kubectl apply -f manifests/vote-service.yml
   ```
   This will create a service that exposes the `vote` deployment.

4. Deploy the `redis` application by running the following command:
   
   ```bash
   kubectl apply -f manifests/redis-deployment.yml
   ```
   This will create a deployment for the `redis` application.

5. Expose the `redis` deployment by running the following command:
   
   ```bash
   kubectl apply -f manifests/redis-service.yml
   ```
   This will create a service that exposes the `redis` deployment.

6. Deploy the `worker` application by running the following command:
   
   ```bash
   kubectl apply -f manifests/worker-deployment.yml
   ```
   This will create a deployment for the `worker` application.

7. Deploy the `db` application by running the following command:
   
   ```bash
   kubectl apply -f manifests/db-deployment.yml
   ```
   This will create a deployment for the `db` application.

8. Expose the `db` deployment by running the following command:
   
   ```bash
   kubectl apply -f manifests/db-service.yml
   ```
   This will create a service that exposes the `db` deployment.

9. Deploy the `result` application by running the following command:
   
   ```bash
   kubectl apply -f manifests/result-deployment.yml
   ```
   This will create a deployment for the `result` application.

10. Expose the `result` deployment by running the following command:
    
    ```bash
    kubectl apply -f manifests/result-service.yml
    ```
    This will create a service that exposes the `result` deployment.

## Deploying the Solution

To deploy the Voting App, you can use the provided `deploy-vote-app.sh` script. The script automates the deployment process by applying all the YAML files in the `manifests` directory. 

To run the script, navigate to the root directory of the project and execute the following command:

```bash
./deploy-vote-app.sh
```

This will deploy the Voting App on the Kubernetes cluster.