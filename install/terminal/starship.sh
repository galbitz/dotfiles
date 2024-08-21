#!/usr/bin/env bash

brew install starships

mkdir -p $HOME/.config
linkDotfile .config/starship.toml
