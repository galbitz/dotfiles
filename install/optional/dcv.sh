#!/usr/bin/env bash

echo "Installing Amazon DCV"

# prereq
sudo apt install -y curl gpg
# force X11 instead of wayland
sudo sed -i.bak '/#WaylandEnable/c\WaylandEnable=false' /etc/gdm3/daemon.conf

curl -fsSL https://d1uj6qtbmh3dt5.cloudfront.net/NICE-GPG-KEY | sudo gpg --dearmor -o /usr/share/keyrings/amazon-dcv-archive-keyring.gpg
sudo apt install -y xserver-xorg-video-dummy
#wget https://d1uj6qtbmh3dt5.cloudfront.net/2024.0/Servers/nice-dcv-2024.0-19030-ubuntu2204-x86_64.tgz
wget https://d1uj6qtbmh3dt5.cloudfront.net/nice-dcv-ubuntu2404-x86_64.tgz
tar -xvzf nice-dcv-ubuntu2404-x86_64.tgz && cd nice-dcv-2024.0-19030-ubuntu2404-x86_64
sudo apt install -y ./nice-dcv-server_2024.0.19030-1_amd64.ubuntu2404.deb
sudo apt install -f
sudo apt install -y ./nice-dcv-web-viewer_2024.0.19030-1_amd64.ubuntu2404.deb

# configuration
sudo usermod -aG video dcv
sudo systemctl enable dcvserver.service
sudo sed -i.bak '/#create-session/c\create-session = true' /etc/dcv/dcv.conf
sudo sed -i.bak2 '/#owner/c\owner = gabor' /etc/dcv/dcv.conf

echo "DCV installation completed"