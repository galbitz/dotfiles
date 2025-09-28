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
fi

source install/shared/brew.sh
source ~/.commonrc
source install/shared/more-basic-tools.sh
source install/shared/lazygit.sh
source install/shared/add-github-keys.sh
source install/shared/starship.sh
source install/shared/tmux.sh
source install/shared/neovim.sh

if is_laptop; then
  source install/thinkpad/tlp.sh
  source install/thinkpad/brightness.sh
fi

if is_desktop; then
  source install/desktop/fonts.sh
  source install/desktop/sway.sh
fi

source ~/.commonrc
echo "Dotfile install completed."
echo "Reboot"
