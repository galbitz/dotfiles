#!/usr/bin/env bash

# Exit if wsl
if is_wsl; then return 0; fi

# Exit if mac os
if is_macos; then return 0; fi

# Exit if already installed
if [ -f /etc/apt/keyrings/docker.asc ]; then return 0; fi


echo "Installing docker"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Installing podman"
sudo apt-get -y install podman

echo "Installing distrobox"
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
