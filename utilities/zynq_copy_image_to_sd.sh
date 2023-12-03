#!/bin/bash

target_boot="/media/user/BOOT/"
target_rootfs="/media/user/rootfs/"
sd_boot="/dev/sdc1"
sd_rootfs="/dev/sdc2"

sudo mkdir -p $target_boot
sudo mkdir -p $target_rootfs
sudo mount $sd_boot $target_boot
sudo mount $sd_rootfs $target_rootfs

sudo rm -f $target_boot/BOOT.BIN
sudo rm -f $target_boot/boot.scr
sudo rm -f $target_boot/image.ub
sudo cp BOOT.BIN $target_boot
sudo cp boot.scr $target_boot
sudo cp image.ub $target_boot

sudo rm -dR $target_rootfs/*
sudo tar -xf rootfs.tar.gz -C $target_rootfs

sudo umount $sd_boot
sudo umount $sd_rootfs

sudo rm -d $target_boot
sudo rm -d $target_rootfs

