#!/usr/bin/env bash
dotfilesDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source functions.sh

mkdir -p $HOME/.config
linkDotfile .commonrc
linkDotfile .config/starship.toml

mkdir -p $HOME/.config/tmux
linkDotfile .config/tmux/tmux.conf
linkDotfile .config/tmux/plugins

linkDotfile .config/alacritty
linkDotfile .config/kitty

linkDotfile .config/i3
linkDotfile .config/rofi

linkDotfile .config/k9s

linkDotfile .config/sway