#!/usr/bin/env bash

# Exit if mac os
if is_macos; then return 0; fi

sudo apt install git curl wget -y