#!/usr/bin/env bash

echo "Choose vindow manager"

VM=$(gum choose "sway" "i3" "none" )

source install/optional/$VM.sh

