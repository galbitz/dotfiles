#!/usr/bin/env bash
set -e

dotfilesDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Dotfile install started."

source functions.sh

# if ! test_requirements; then 
#     echo "Requirements failed. Exiting."
#     exit 1
# fi

#echo "Running installers"
#source install/terminal.sh
#source ~/.commonrc
#source install/desktop.sh

source install/preflight/guard.sh
source install/preflight/pwdless-sudo.sh
source install/preflight/core-linux-utils.sh
source install/terminal/git.sh


echo "Dotfile install completed."
echo "Reboot"
