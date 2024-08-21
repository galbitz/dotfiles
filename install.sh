#!/usr/bin/env bash
dotfilesDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Dotfile install started."

source functions.sh

if ! test_requirements; then 
    echo "Requirements failed. Exiting."
    exit 1
fi

echo "Running installers"
source install/terminal.sh
source ~/.commonrc
source install/desktop.sh

echo "Dotfile install completed."
echo "Reboot"
