#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install curl, rsync, xz-utils, gnupg, and ca-certificates
apt update
apt install --no-install-recommends -y curl rsync xz-utils gnupg ca-certificates git build-essential pkg-config bison flex

# download and install Linaro GCC
cd /tmp
curl -Lo linaro-gcc.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
tar xf linaro-gcc.tar.xz
rm linaro-gcc.tar.xz
cd $(find . -name gcc-linaro*)
rsync -az ./* /usr/local

# install device tree compiler
cd /tmp
git clone https://git.kernel.org/pub/scm/utils/dtc/dtc.git
cd dtc
make -j`nproc`
make install

# install python utils
cd /tmp
git clone https://github.com/cmcquinn/python-utils.git
cd python-utils
rsync -avz *.py /usr/local/bin

# clean up temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean

# mark image as prepared
touch /etc/system-prepared
