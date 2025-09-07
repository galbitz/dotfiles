#!/usr/bin/env bash

if ! command_exists "sudo"; then 
  echo "Must have sudo installed. Exiting."
  exit 1
fi