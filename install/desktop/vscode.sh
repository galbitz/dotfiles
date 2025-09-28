#!/usr/bin/env bash

if [ -f /usr/share/keyrings/packages.microsoft.gpg ]; then return 0; fi

echo "Installing vscode"

sudo apt install -y apt-transport-https wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update
sudo apt install -y code
