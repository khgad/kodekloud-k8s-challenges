# Challenge 2

## Step: 1

1. run this command to change port _6433_ to _6443_

    ``` bash
    sed -i 's/6433/6443/' /root/.kube/config
    ```

2. edit `/etc/kubernetes/manifests/kube-apiserver.yaml` file and change the value of `--client-ca-file` 

    from `/etc/kubernetes/pki/ca-authority.crt`

    to `/etc/kubernetes/pki/ca.crt`

    as there is no _ca-authority.crt_ in _/pki_ and the correct file is _ca.crt_

    run this command to do this
    ``` bash
    sed -i 's/ca-authority.crt/ca.crt/' /etc/kubernetes/manifests/kube-apiserver.yaml
    ```

    then run this command to restart the kubelet service
    
    ```bash
    systemctl restart kubelet
    ```

3. Run this command to correct the image name of coredns deployment

    ``` bash
    kubectl set image deployment/coredns coredns=k8s.gcr.io/coredns/coredns:v1.8.6 -n kube-system
    ```

## Step: 2

run this command to mark node as schedulable

``` bash
kubectl uncordon node01
```

## Step: 3

scp /media/* node01:/web
