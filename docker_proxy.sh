#!/bin/bash

sudo mkdir -p /etc/systemd/system/docker.service.d

ip="$1"
port="$2"

content="\
[Service]\n\
Environment=\"HTTP_PROXY=http://${ip}:${port}\"\n\
Environment=\"HTTPS_PROXY=http://${ip}:${port}\"\n\
Environment=\"NO_PROXY=\"localhost,127.0.0.1,::1\"\n\
"

sudo echo -e $content > /etc/systemd/system/docker.service.d/proxy.conf
# echo -e $con::tent > proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker.service

