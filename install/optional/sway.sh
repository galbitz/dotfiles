#!/usr/bin/env bash

echo "Installing sway"

sudo apt install -y sway swaylock swayidle waybar

linkDotfile .config/sway
linkDotfile .config/waybar
