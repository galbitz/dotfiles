#!/usr/bin/env bash

if command -v fzf &> /dev/null; then
    eval "$(fzf --$shell_name)"
fi
