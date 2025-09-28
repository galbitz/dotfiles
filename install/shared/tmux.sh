#!/usr/bin/env bash

echo "Installing tmux and plugins"
mkdir -p $HOME/.config/tmux
linkDotfile .config/tmux/tmux.conf

mkdir -p $HOME/.config/tmux_plugins
if [ ! -f $HOME/.config/tmux_plugins/tpm/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux_plugins/tpm
fi
