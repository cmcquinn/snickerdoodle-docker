#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install bison and flex, plus other kernel build dependencies
apt update
apt install --no-install-recommends -y bison flex libssl-dev ccache fakeroot

# install device tree compiler
cd /tmp
git clone https://git.kernel.org/pub/scm/utils/dtc/dtc.git
cd dtc
make -j`nproc`
make install

# clean up temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean

# mark image as prepared
touch /etc/system-prepared
