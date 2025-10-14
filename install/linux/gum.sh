#!/usr/bin/env bash

# Exit if already installed
if [ -f /usr/share/keyrings/charm.gpg ]; then return 0; fi

curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/charm.gpg
echo "deb [signed-by=/usr/share/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
