#!/usr/bin/env bash
set -e

source install/preflight/functions.sh

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

if is_desktop; then
    echo "desktop"
fi
