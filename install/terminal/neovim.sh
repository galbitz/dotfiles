#!/usr/bin/env bash

if ! is_macos; then
    sudo apt install luarocks -y
fi

brew install fd ripgrep neovim

# install lazyvim
