#!/usr/bin/env bash

# This is to avoid some keyboard layout configuration prompt
sudo DEBIAN_FRONTEND=noninteractive apt install -y keyboard-configuration
sudo apt install -y xserver-xorg-core xserver-xorg-video-all xinit xinput x11-xserver-utils x11-utils xrdp lightdm kitty i3 i3blocks alacritty
