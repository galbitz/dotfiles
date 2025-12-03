#!/usr/bin/env bash

echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold

echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold

powerprofilesctl set power-saver
