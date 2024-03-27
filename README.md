# nettools
Nettools to debugs. Container image with network tools for troubleshooting Kubernetes clusters

- To check some networking issues in a cluster:

```sh
kubectl run -it --image=ghcr.io/duyhenryer/nettools:2.0.1 nettools --restart=Never -n default
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
    image: ghcr.io/duyhenryer/nettools:2.0.1
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
        image: ghcr.io/duyhenryer/nettools:2.0.1
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
docker run -it ghcr.io/duyhenryer/nettools:2.0.1 sh
```

#### Sample Use-cases

`tcpdump` is a powerful and common packet analyzer that runs under the command line. 
It allows the user to display TCP/IP and other packets being transmitted or received over an attached network interface.

```sh
tcpdump -i eth0 port 9999 -c 1 -Xvv
```
More info on tcpdump can be found [here](http://www.tcpdump.org/tcpdump_man.html).

`netstat` is a useful tool for checking your network configuration and activity.
```sh
netstat -tulpn
```