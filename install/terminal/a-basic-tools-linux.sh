#!/usr/bin/env bash

# Exit if mac os
if is_macos; then return 0; fi

sudo apt update -y
sudo apt upgrade -y
sudo apt install htop openssh-client mc tmux wget tldr unzip
