#!/usr/bin/env bash

brew install starship

mkdir -p $HOME/.config
linkDotfile .config/starship.toml
