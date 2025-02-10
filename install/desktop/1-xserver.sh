#!/usr/bin/env bash

# This is to avoid some keyboard layout configuration prompt
sudo DEBIAN_FRONTEND=noninteractive apt install -y keyboard-configuration

# full desktop, comment out if gnome already installed
sudo apt install -y xserver-xorg-core xserver-xorg-video-all xinit xinput x11-xserver-utils x11-utils xrdp xorgxrdp

# shared packages
sudo apt install -y lightdm i3 kitty i3blocks alacritty scrot imagemagick pavucontrol

# TODO: alacritty is not yet the default as it's not part of brew and debian version is old to handle toml config
linkDotfile .config/alacritty
linkDotfile .config/kitty
