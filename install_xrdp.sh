#!/bin/bash

sudo apt update
sudo apt install xrdp xfce4 xfce4-goodies -y

sudo usermod -a -G ssl-cert $USER

cd ~
echo "xfce4-session" | tee .xsession
sudo systemctl restart xrdp

sudo ufw allow 3389
sudo ufw reload


