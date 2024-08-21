#!/usr/bin/env bash

sudo apt install -y pulseaudio pavucontrol alsa-utils

sudo apt install -y build-essential git dpkg-dev libpulse-dev autoconf libtool

mkdir -p ~/build

sudo rm -rf /var/lib/pa-build/

PULSEBUILDDIR=~/build/pulseaudio-module-xrdps

git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git "$PULSEBUILDDIR"

pushd "$PULSEBUILDDIR"

git checkout devel

scripts/install_pulseaudio_sources_apt.sh

./bootstrap && ./configure PULSE_DIR=~/pulseaudio.src

sudo make install

popd

