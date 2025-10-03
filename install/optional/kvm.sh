#!/usr/bin/env bash

echo "Installing kvm"

sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager

# start default network
sudo virsh net-start default
sudo virsh net-autostart default

# add current user to groups
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

echo "kvm install completed."
