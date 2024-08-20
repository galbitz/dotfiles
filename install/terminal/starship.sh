#!/usr/bin/env bash

curl -sS https://starship.rs/install.sh | sh -s -- --force

mkdir -p $HOME/.config
linkDotfile .config/starship.toml
