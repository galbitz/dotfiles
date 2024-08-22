#!/usr/bin/env bash

for installer in install/terminal/*.sh
do
  echo "Running $installer" 
  source $installer
  read -p "Press key to continue.. " -n1 -s
done