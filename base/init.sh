#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install multistrap, qemu-user-static, and other miscellaneous packages
apt update
apt install --no-install-recommends -y python3 python3-requests curl rsync gnupg xz-utils \
ca-certificates build-essential git-buildpackage git pkg-config

# install arm cross compiler
apt install -y gcc-arm-linux-gnueabihf

# install python utils
cd /tmp
git clone https://github.com/cmcquinn/python-utils.git
cd python-utils
rsync -avz *.py /usr/local/bin

# cleanup temporary files to reduce image size
cd /tmp
rm -rf ./*
apt autoclean
rm -rf /var/lib/apt/lists/*