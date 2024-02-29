FROM alpine:3.19

LABEL org.opencontainers.image.authors="Duy Henry <duyhenry@protonmail.me>"
LABEL org.opencontainers.image.description="Useful network related tools"
LABEL version="1.0"

WORKDIR /workspace

# timezone support
ENV TZ=UTC
RUN apk add --update tzdata --no-cache &&\
    cp /usr/share/zoneinfo/${TZ} /etc/localtime &&\
    echo $TZ > /etc/timezone

RUN apk add --no-cache --update \
    bash \
    conntrack-tools \
    coreutils \
    curl \
    jq \
    yq \
    nano \
    drill \
    iperf3 \
    iproute2 \
    iptables \
    iputils \
    ip6tables \
    keepalived \
    net-tools \
    nftables \
    socat \
    mtr \
    ethtool \
    wget \
    tcpdump \
    tcptraceroute \
    traceroute \
    bind-tools \
    busybox-extras \
    lz4 zstd \
    vim
