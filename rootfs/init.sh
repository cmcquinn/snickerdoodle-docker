#!/usr/bin/env bash

set -e # exit on error
set -x # echo commands

# install multistrap, qemu-user-static, and pyparted
apt update
apt install --no-install-recommends -y multistrap qemu-user-static python3-parted

# install Qt build dependencies
apt install --no-install-recommends -y perl

# cleanup temporary files to reduce image size
apt autoclean
rm -rf /var/lib/apt/lists/*

# mark image as prepared
touch /etc/system-prepared
