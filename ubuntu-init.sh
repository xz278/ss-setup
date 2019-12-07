#!/bin/bash

# install docker
apt-get update
apt-get install -y docker.io

# start docker
systemctl start docker
systemctl enable docker

# set up config
mkdir /etc/ssr
cp config.json /etc/ssr/config.json

# pull image
docker pull teddysun/shadowsocks-r

# start container
docker run -d -p 443:443 -p 443:443/udp --name ssr --restart=always -v /etc/ssr:/etc/shadowsocks-r teddysun/shadowsocks-r

exit 0
