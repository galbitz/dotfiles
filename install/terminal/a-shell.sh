#!/usr/bin/env bash
echo "Installing commonrc"
text_block_to_add=$(cat <<EOF
# dotfile block starts
source \$HOME/.commonrc
# dotfile block ends

EOF
)

add_textblock_to_file "$text_block_to_add", ".bashrc"
add_textblock_to_file "$text_block_to_add", ".zshrc"

linkDotfile .commonrc

source ~/.commonrc
