#!/usr/bin/env bash

echo "Installing i3"
sudo apt install -y i3 i3blocks fonts-noto rofi dunst

linkDotfile .config/i3
linkDotfile .config/rofi

echo "Installing fonts"

mkdir -p ~/.local/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaMono.zip
unzip CascadiaMono.zip -d ~/.local/share/fonts/CascadiaMono
rm CascadiaMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip-d ~/.local/share/fonts/FiraCode
rm FiraCode.zip

fc-cache -f -v
