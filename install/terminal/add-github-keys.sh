#!/usr/bin/env bash

USERNAME=galbitz

mkdir -p ~/.ssh

if ! [[ -f ~/.ssh/authorized_keys ]]; then
  echo "Creating new ~/.ssh/authorized_keys"
  touch ~/.ssh/authorized_keys
fi

keys=`curl https://api.github.com/users/$USERNAME/keys | grep -o -E "ssh-\w+\s+[^\"]+"`

for key in $keys; do
  echo $key
  grep -q "$key" ~/.ssh/authorized_keys || echo "$key" >> ~/.ssh/authorized_keys
done