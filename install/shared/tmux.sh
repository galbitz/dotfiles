#!/usr/bin/env bash

mkdir -p $HOME/.config/tmux
linkDotfile .config/tmux/tmux.conf

mkdir -p $HOME/.config/tmux_plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux_plugins/tpm
