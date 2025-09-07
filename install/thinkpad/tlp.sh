#!/usr/bin/env bash

# battery management

sudo apt install tlp -y

sudo cp etc/tlp.d/01-mytlp.conf /etc/tlp.d/01-mytlp.conf
sudo chown root:root /etc/tlp.d/01-mytlp.conf
sudo chmod 644 /etc/tlp.d/01-mytlp.conf
sudo systemctl start tlp
