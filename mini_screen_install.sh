#!/bin/bash

# mini screen setup
echo "Setting up mini-screen drivers."
sudo rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git
sudo chmod -R 755 LCD-show
cd LCD-show/
sudo bash MHS35-show