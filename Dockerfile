FROM debian:8

MAINTAINER colhom@gmail.com

RUN apt-get update
RUN apt-get -y install wget unzip

RUN wget http://downloads.rclone.org/rclone-current-linux-amd64.zip

RUN unzip rclone-current-linux-amd64.zip

RUN cp ./rclone-v*-linux-amd64/rclone /usr/sbin
RUN chown root:root /usr/sbin/rclone && chmod 755 /usr/sbin/rclone

ENTRYPOINT ["rclone"]