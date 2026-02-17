#!/usr/bin/env bash

# Init starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init $shell_name)"
fi
