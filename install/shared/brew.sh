#!/usr/bin/env bash

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then return 0; fi

CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
