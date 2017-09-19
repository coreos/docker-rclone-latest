FROM debian:9

MAINTAINER colhom@gmail.com

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -p /tmp/rclone && cd /tmp/rclone && \
    wget https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp ./rclone-v*-linux-amd64/rclone /usr/sbin && \
    chown root:root /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    cd / && \
    apt remove -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]
