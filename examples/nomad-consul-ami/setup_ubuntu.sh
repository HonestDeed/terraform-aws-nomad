#!/bin/sh
set -e

SCRIPT=`basename "$0"`

# NOTE: git is required, but it should already be preinstalled on Ubuntu 16.0
#echo "[INFO] [${SCRIPT}] Setup git"
#sudo apt install -y git

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Using Docker CE directly provided by Docker
echo "[INFO] [${SCRIPT}] Setup docker"
cd /tmp/
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
apt-cache policy docker-ce

sudo apt-get install -y docker-ce
sudo usermod -a -G docker ubuntu
