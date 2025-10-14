#!/usr/bin/env bash
echo "Installing i3"

# force X11 instead of wayland
sudo sed -i.bak '/#WaylandEnable/c\WaylandEnable=false' /etc/gdm3/daemon.conf

sudo apt install -y i3 i3blocks fonts-noto rofi dunst
