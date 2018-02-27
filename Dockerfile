FROM debian:9

MAINTAINER colhom@gmail.com

ENV RCLONE_VERSION=v1.39
ENV RCLONE_LINUX_SHASUM=962cf9bd99ec96e82f3ef99ebfdcb9189bb3469ff817e4c2648b023b1d39f618198a50b55452d73c57c9c0efcf8d4782eeb87d4c30091dd81188724a765179ac

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -p /tmp/rclone && cd /tmp/rclone && \
    wget --quiet https://github.com/ncw/rclone/releases/download/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    echo "${RCLONE_LINUX_SHASUM}  rclone-${RCLONE_VERSION}-linux-amd64.zip" | sha512sum -c && \
    unzip rclone-${RCLONE_VERSION}-linux-amd64.zip && \
    cp ./rclone-v*-linux-amd64/rclone /usr/sbin && \
    chown root:root /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    cd / && \
    apt remove -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["rclone"]
