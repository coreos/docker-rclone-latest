FROM debian:9

MAINTAINER colhom@gmail.com

ENV RCLONE_VERSION=v1.37

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -p /tmp/rclone && cd /tmp/rclone && \
    wget https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    unzip rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    cp ./rclone-v*-linux-amd64/rclone /usr/sbin && \
    chown root:root /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    cd / && \
    apt remove -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]
