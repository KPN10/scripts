#!/bin/bash

echo "options hid_apple fnmode=1" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
# sudo systemctl reboot

