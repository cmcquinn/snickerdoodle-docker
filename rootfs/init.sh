#!/usr/bin/env bash

# install multistrap and qemu-user-static
apt update
apt install -y multistrap qemu-user-static

# download and install Linaro GCC
cd /tmp
curl -Lo linaro-gcc.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz
cd gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf
rsync -avz ./* /usr/local

# mark image as prepared
touch /etc/system-prepared
