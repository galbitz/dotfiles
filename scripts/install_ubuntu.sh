#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

if sudo -n true 2>/dev/null; then
  sudo apt -qq update 
  install curl
  install git
  install htop
  install openssh-client
  install mc
  install tmux
  install wget
fi