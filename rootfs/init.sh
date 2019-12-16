#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install multistrap and qemu-user-static
apt update
apt install -y multistrap qemu-user-static python3 libparted libparted-dev python3-pip curl rsync

# add Machinekit repo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 43DDF224
sh -c \
  "echo 'deb http://deb.machinekit.io/debian buster main' > \
  /etc/apt/sources.list.d/machinekit.list"
apt-get update

# download and install Linaro GCC
cd /tmp
curl -Lo linaro-gcc.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
tar xf linaro-gcc.tar.xz
rm linaro-gcc.tar.xz
cd $(find . -name gcc-linaro*)
rsync -az ./* /usr/local

# install QT build dependencies
apt install -y build-essential perl python3 git

# cleanup temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean

# mark image as prepared
touch /etc/system-prepared
