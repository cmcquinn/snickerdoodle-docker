#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install multistrap, qemu-user-static, and other miscellaneous packages
apt update
apt install --no-install-recommends -y python3 python3-requests curl rsync gnupg xz-utils \
ca-certificates build-essential git-buildpackage git pkg-config

# download and install Linaro GCC
cd /tmp
curl -Lo linaro-gcc.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
tar xf linaro-gcc.tar.xz
rm linaro-gcc.tar.xz
cd $(find . -name gcc-linaro*)
rsync -az ./* /usr/local

# install python utils
cd /tmp
git clone https://github.com/cmcquinn/python-utils.git
cd python-utils
rsync -avz *.py /usr/local/bin

# cleanup temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean
