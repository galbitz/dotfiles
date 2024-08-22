#!/usr/bin/env bash

# Exit if mac os
if is_macos; then return 0; fi

# Exit if wsl
if is_wsl; then return 0; fi

for installer in install/desktop/*.sh
do
  echo "Running $installer" 
  source $installer
  read -p "Press key to continue.. " -n1 -s
done