#!/bin/bash

echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo systemctl reboot

