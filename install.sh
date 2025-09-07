#!/usr/bin/env bash
set -e

dotfilesDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Dotfile install started."

source install/preflight/functions.sh
source install/preflight/guard.sh

source install/shared/git.sh
source install/shared/shell.sh
source ~/.commonrc

if is_debian || is_wsl; then
  source install/linux/pwdless-sudo.sh
  source install/linux/core-linux-utils.sh
  source install/linux/basic-tools.sh
fi

source install/shared/brew.sh
source install/shared/lazygit.sh

if is_laptop; then
  source install/thinkpad/tlp.sh
  source install/thinkpad/brightness.sh
fi

echo "Dotfile install completed."
echo "Reboot"
