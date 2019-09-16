#!/bin/bash

echo "apt update and patch."
sudo apt-get update
sudo apt-get upgrade

echo "Installing Vim."
sudo apt-get install vim

echo "Give docker permission to run Docker."
sudo usermod -aG docker pi

echo "Drop the repository config"
sudo rm /etc/apt/sources.list.d/docker.list;

echo "Installing Docker."
curl -sL get.docker.com | sed 's/9)/10)/' | sh

# check docker is running successfully.
docker info

echo "Finished Docker installation. Launching service."

sudo systemctl start docker

# remove unused stuff.
sudo apt autoremove

echo "Pulling latest Plover repo."
cd ~
git pull git@github.com:openstenoproject/plover.git

echo "Building Plover Docker image."

docker build --tag plover-pi .