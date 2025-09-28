#!/usr/bin/env bash

if [ -f /usr/share/keyrings/1password-archive-keyring.gpg ]; then return 0; fi

curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

sudo apt update

sudo apt install -y 1password  1password-cli

# additional notes: open seahorse, add password keyring (name default), set as default (right click men)

