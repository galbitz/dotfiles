#!/usr/bin/env bash

# https://c-nergy.be/blog/?p=17734

sudo apt install -y pulseaudio pavucontrol alsa-utils

sudo apt install -y build-essential git dpkg-dev libpulse-dev autoconf libtool automake

mkdir -p ~/build

sudo rm -rf /var/lib/pa-build/

PULSEBUILDDIR=~/build/pulseaudio-module-xrdps

sudo rm -rf $PULSEBUILDDIR

git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git "$PULSEBUILDDIR"

pushd "$PULSEBUILDDIR"

git checkout devel

scripts/install_pulseaudio_sources_apt.sh

./bootstrap && ./configure PULSE_DIR=~/pulseaudio.src

sudo make install

popd

