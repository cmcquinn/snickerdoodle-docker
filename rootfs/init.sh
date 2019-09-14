#!/usr/bin/env bash

# install debootstrap and qemu-user-static
apt update
apt install -y debootstrap qemu-user-static

# mark image as prepared
touch /etc/system-prepared
