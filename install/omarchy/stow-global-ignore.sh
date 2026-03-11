#!/usr/bin/env bash

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
