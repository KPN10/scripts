sudo apt install ninja-build libgtk2.0-dev libpixman-1-dev meson
wget https://download.qemu.org/qemu-6.2.0.tar.xz
tar xvJf qemu-6.2.0.tar.xz
cd qemu-6.2.0
./configure
make -j$(nproc)
