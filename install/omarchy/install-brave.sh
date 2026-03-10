#!/usr/bin/env bash

echo "Installing Brave and setting as default browser"

omarchy-pkg-aur-add brave-bin
xdg-settings set default-web-browser brave-browser.desktop

sudo mkdir -p /etc/brave/policies/managed
sudo tee /etc/brave/policies/managed/extensions.json > /dev/null <<EOF
{
  "ExtensionInstallForcelist": [
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa;https://clients2.google.com/service/update2/crx",
    "pobnnokcfhideimoiejhkkbdmbgfjpbk;https://clients2.google.com/service/update2/crx"
  ]
}
EOF
