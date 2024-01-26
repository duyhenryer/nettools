FROM alpine:3.19

LABEL org.opencontainers.image.authors="Duy Henry <duyhenry@protonmail.com>"
LABEL org.opencontainers.image.description DESCRIPTION="Useful network related tools"
LABEL version="1.0"

WORKDIR /workspace

RUN apk add --no-cache --update \
        bash \
        conntrack-tools \
        coreutils \
        curl \
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
        busybox-extras \
        lz4 zstd