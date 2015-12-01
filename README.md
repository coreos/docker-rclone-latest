docker-rclone-latest
===============

[![Docker Image on Quay.io](https://quay.io/repository/coreos/rclone/status "Docker Image on Quay.io")](https://quay.io/repository/coreos/rclone)

## Example
```sh
mkdir /tmp/rclone
docker run -it --rm -v /tmp/rclone:/rclone quay.io/coreos/rclone --config /rclone/rclone.conf config
mv /tmp/rclone/rclone.conf ~/.rclone.conf
docker run -it --rm -v ~/.rclone.conf:/etc/rclone.conf quay.io/coreos/rclone --config /etc/rclone.conf lsd example-remote:/
```