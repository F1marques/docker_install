#! /usr/bin/bash

# REMOVE OLDER VERSIONS
sudo apt-get remove docker docker-engine docker.io

# INSTALL NEW
sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce

# INSTALL DOCKER-MACHINE
base=https://github.com/docker/machine/releases/download/v0.14.0 && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && sudo install /tmp/docker-machine /usr/local/bin/docker-machine

# CHECK INSTALLATION
docker-machine version

# USE DOCKER WITHOUT SUDO
sudo groupadd docker

sudo gpasswd -a $USER docker

newgrp docker
