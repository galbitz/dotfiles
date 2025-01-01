#!/usr/bin/env bash
set -e

source functions.sh

if is_macos; then
    echo "macos"
fi

if is_ubuntu; then
    echo "ubuntu"
fi

if is_wsl; then
    echo "wsl"
fi

if is_debian; then
    echo "debian"
fi