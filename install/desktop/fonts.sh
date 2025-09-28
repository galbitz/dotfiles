#!/usr/bin/env bash

echo "Installing fonts"

mkdir -p ~/.local/share/fonts/

if ! fc-list -q "CaskaydiaMonoNerdFont"; then
	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
	unzip -o CascadiaMono.zip -d ~/.local/share/fonts/CascadiaMono
	rm CascadiaMono.zip
fi

if ! fc-list -q "FiraCodeNerdFontMono"; then
	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
	unzip -o FiraCode.zip -d ~/.local/share/fonts/FiraCode
	rm FiraCode.zip
fi

if ! fc-list -q "Font Awesome 7 Free"; then
	wget -O fontawesome.zip https://github.com/FortAwesome/Font-Awesome/releases/download/7.0.1/fontawesome-free-7.0.1-desktop.zip
	unzip -o fontawesome.zip -d ~/.local/share/fonts/fontawesome 
	rm fontawesome.zip
fi

echo "Refreshing font cache"
fc-cache -f

