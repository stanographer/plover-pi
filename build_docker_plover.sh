#!/bin/bash

# GitHub ssh keys
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
read -p "Enter github email : " email
echo "Using email $email"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add ~/.ssh/id_rsa
pub=`cat ~/.ssh/id_rsa.pub`
read -p "Enter GitHub username: " githubuser
echo "Using username $githubuser"
read -s -p "Enter github password for user $githubuser: " githubpass
curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys

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