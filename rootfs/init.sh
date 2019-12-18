#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install multistrap, qemu-user-static, and other miscellaneous packages
apt update
apt install --no-install-recommends -y multistrap qemu-user-static python3 libparted libparted-dev python3-pip curl rsync gnupg xz-utils

# # download and install Linaro GCC
# cd /tmp
# curl -Lo linaro-gcc.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
# tar xf linaro-gcc.tar.xz
# rm linaro-gcc.tar.xz
# cd $(find . -name gcc-linaro*)
# rsync -az ./* /usr/local
apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf gcc-multilib

# install Qt build dependencies
apt install --no-install-recommends -y build-essential perl python3 git pkg-config

# cleanup temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean

# mark image as prepared
touch /etc/system-prepared
