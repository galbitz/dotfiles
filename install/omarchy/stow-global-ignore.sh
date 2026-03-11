#!/usr/bin/env bash

echo "Niri local"
mkdir -p ~/.config/niri
[ -f ~/.config/niri/local.kdl ] || touch ~/.config/niri/local.kdl

echo "Installing stow"

omarchy-pkg-add stow

echo "Writing ~/.stow-global-ignore"

rm -f ~/.config/starship.toml

cat > ~/.stow-global-ignore <<EOF
kitty
alacritty
waybar
tmux
EOF
