#!/usr/bin/env bash

function add_textblock_to_file() {
    text_block="$1"
    rcfile="$HOME/$2"

    if ! grep -qF "$text_block" "$rcfile"; then
        echo "Adding bash extra to bashfile"
        echo "$text_block" >> "$rcfile"
    fi
}

text_block_to_add=$(cat <<EOF
# dotfile block starts
if [ -d "\$HOME/.config/rc" ]; then
    for config in "\$HOME/.config/rc"/*.sh; do
        [ -r "\$config" ] && source "\$config"
    done
fi
# dotfile block ends

EOF
)

echo "Linking config files"
stow -v -R -t ~ -d home .

echo "Setting up config files"
touch "$HOME/.bashrc"
touch "$HOME/.zshrc"
add_textblock_to_file "$text_block_to_add", ".bashrc"
add_textblock_to_file "$text_block_to_add", ".zshrc"

