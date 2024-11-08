# nettools
Nettools to debugs. A container image with common networking and debugging tools for troubleshooting Kubernetes clusters.

### Available Tools
***Network Tools***

- `curl`, `wget`: HTTP clients
- `tcpdump`: Network packet analyzer
- `iptables`, `ip6tables`: Firewall management
- `iproute2`: Network configuration
- `nftables`: Next-generation firewall
- `mtr`, traceroute: Network route tracing
- `socat`: Multipurpose relay
- `iperf3`: Network performance testing
- `netcat-openbsd`: TCP/UDP connections
- `nmap`: Network scanner
- `drill`, `bind-tools`: DNS tools

***Debugging Tools***
- `strace`: System call tracer
- `grpcurl`: gRPC testing tool
- `htop`: Process monitor
- `conntrack-tools`: Connection tracking
- `ethtool`: Network interface tool

***Database Clients***
- `postgresql-client`: Connection PostgreSQL
- `mysql-client`: Connection Mysql

***Utility Tools***
- `jq`, `yq`: JSON/YAML processors
- `vim`: Text editors
- `bash`: Shell

### Quick Start
- Run as a Pod
```sh
kubectl run -it --image=ghcr.io/duyhenryer/nettools:2.0.1 nettools --restart=Never -n default
```
- Run as Docker container
```sh
docker run -it ghcr.io/duyhenryer/nettools:2.0.1 sh
```
- Pod Template
```yaml
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
```
- Deployment Template
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
### Common Use-Cases

`tcpdump`
- Packet analyzer for network debugging.

```sh
tcpdump -i eth0 port 9999 -c 1 -Xvv
```
More info on tcpdump can be found [here](http://www.tcpdump.org/tcpdump_man.html).

`netstat` is a useful tool for checking your network configuration and activity.
```sh
# List all TCP/UDP ports
netstat -tulpn

# Show routing table
netstat -r
```
### Version History
2.0.2: Current stable version
- Added `grpcurl`
- Base image updated to Alpine 3.19.1

### Contributing
Issues and pull requests are welcome!