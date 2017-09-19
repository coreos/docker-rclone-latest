FROM debian:9

MAINTAINER colhom@gmail.com

ENV RCLONE_VERSION=v1.37
ENV RCLONE_LINUX_SHASUM=e55aac6349f883c15834df63a7c77bee2af2834d43e15b52b3470aadfa1b631ef1ab684307b2375a593d4c34c04318a27a579c35b154cc1798c9d6247a321f2e

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -p /tmp/rclone && cd /tmp/rclone && \
    wget https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    echo "${RCLONE_LINUX_SHASUM}  rclone-${RCLONE_VERSION}-linux-amd64.zip" | sha512sum -c && \
    unzip rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    cp ./rclone-v*-linux-amd64/rclone /usr/sbin && \
    chown root:root /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    cd / && \
    apt remove -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]
