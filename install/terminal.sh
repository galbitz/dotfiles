#!/usr/bin/env bash

for installer in install/terminal/*.sh
do
  echo "Running $installer" 
  source $installer
done