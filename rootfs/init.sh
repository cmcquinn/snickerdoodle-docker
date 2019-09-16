#!/usr/bin/env bash

# install multistrap and qemu-user-static
apt update
apt install -y multistrap qemu-user-static

# mark image as prepared
touch /etc/system-prepared
