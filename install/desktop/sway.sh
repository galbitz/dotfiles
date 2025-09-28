#!/usr/bin/env bash

echo "Installing sway"

sudo apt install -y sway swaylock swayidle waybar

linkDotfile .config/sway
linkDotfile .config/waybar

# terminal
sudo apt install -y alacritty kitty
linkDotfile .config/alacritty
linkDotfile .config/kitty

# file manager
sudo apt install -y thunar