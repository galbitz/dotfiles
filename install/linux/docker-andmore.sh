#!/usr/bin/env bash

# Exit if wsl
if is_wsl; then return 0; fi

# Exit if mac os
if is_macos; then return 0; fi

# Exit if already installed
if [ -f /usr/share/keyrings/docker.gpg ]; then return 0; fi


echo "Installing docker"

sudo apt install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl is-active docker

docker --version

echo "Installing podman"
sudo apt install -y podman

echo "Installing distrobox"
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
