#!/bin/bash

sudo mkdir -p /etc/systemd/system/docker.service.d

myproxy_hostname="ip"
port="port"

content="\
[Service]\n\
Environment=\"HTTP_PROXY=http://${myproxy_hostname}:${port}\"\n\
Environment=\"HTTPS_PROXY=http://${myproxy_hostname}:${port}\"\n\
Environment=\"NO_PROXY=\"localhost,127.0.0.1,::1\"\n\
"

sudo echo $content > /etc/systemd/system/docker.service.d/proxy.conf
echo -e $content > proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker.service

