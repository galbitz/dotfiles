#!/usr/bin/env bash

# Add ~/.local/bin to path if it hasn't been added
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && PATH="$HOME/.local/bin:${PATH}"

[[ ":$PATH:" != *":$HOME/.local/share/flatpak/exports/bin:"* ]] && PATH="$HOME/.local/share/flatpak/exports/bin:${PATH}"
[[ ":$PATH:" != *":/var/lib/flatpak/exports/bin:"* ]] && PATH="/var/lib/flatpak/exports/bin:${PATH}"


shell="$SHELL"
if [ -n "$shell" ]; then
    shell_name=$(basename "$shell")
fi

export XDG_CONFIG_HOME="$HOME/.config"

set -o vi