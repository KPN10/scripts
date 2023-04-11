sudo apt install libncurses-dev libncurses dwarves build-essential gcc bc bison flex libssl-dev libelf-dev zstd
make -j8
make -j8 bzImage
sudo make -j8 modules_install
sudo cp .config /boot/config-x.x.x
sudo make install
sudo reboot
