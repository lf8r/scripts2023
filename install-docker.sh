#!/bin/bash
set -e
ARCH=$(dpkg --print-architecture)
echo "Installing Docker required packages"
DOCKER_PACKAGES="apt-transport-https ca-certificates curl software-properties-common"
sudo apt install -yqqq ${DOCKER_PACKAGES}

echo "Adding Docker key and repository"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=${ARCH}] https://download.docker.com/linux/ubuntu bionic stable"

echo "Installing Docker"
sudo apt install -yqqq docker-ce

echo "Adding ${SUDO_USER} to docker group"
sudo usermod -aG docker ${USER}

su - ${USER}
