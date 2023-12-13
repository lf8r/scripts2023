#!/bin/bash
set -e
VER=1.21.5
ARCH=$(dpkg --print-architecture)
cd ~/Downloads
rm -f go${VER}.linux-${ARCH}.tar.gz
wget https://go.dev/dl/go${VER}.linux-${ARCH}.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -zxvf go${VER}.linux-${ARCH}.tar.gz
go version