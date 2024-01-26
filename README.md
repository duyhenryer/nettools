# nettools
Nettools to debugs. Container image with network tools for troubleshooting Kubernetes clusters

- To check some networking issues in a cluster:

```sh
kubectl run -it --image=ghcr.io/duyhenryer/nettools:1.0.0 nettools --restart=Never -n default
```

- Pod template example:
````yaml
apiVersion: v1
kind: Pod
metadata:
  name: nettools
  namespace: default
spec:
  containers:
  - name: nettools
    image: ghcr.io/duyhenryer/nettools:1.0.0
    command: ["/bin/sleep", "infinity"]
    imagePullPolicy: IfNotPresent
  restartPolicy: Never
````
- Deplyment template example:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nettools
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nettools
  template:
    metadata:
      labels:
        app: nettools
    spec:
      containers:
      - name: nettools
        image: ghcr.io/duyhenryer/nettools:1.0.0
        command: ["/bin/sleep", "infinity"]
        imagePullPolicy: IfNotPresent
```

You can keep the following yaml file handy and run it in a pod

```sh 
kubectl apply -f nettools.yaml
```
and login to the container
```sh 
kubectl exec -it nettools -n default bash
```
- If you just want to use the network tools on a docker host:

```sh
docker run -it ghcr.io/duyhenryer/nettools:1.0.0
```