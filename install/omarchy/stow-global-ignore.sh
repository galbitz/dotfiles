#!/usr/bin/env bash

echo "Installing stow"

omarchy-pkg-add stow

echo "Writing ~/.stow-global-ignore"

rm ~/.config/starship.toml

cat > ~/.stow-global-ignore <<EOF
kitty
alacritty
waybar
EOF
