#!/usr/bin/env bash

# based on https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-debian-11

sudo swapon --show

sudo fallocate -l 20G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
