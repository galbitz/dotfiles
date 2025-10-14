#!/usr/bin/env bash

echo "Choose window manager"

VM=$(gum choose "sway" "i3" "none" )

source install/optional/$VM.sh
