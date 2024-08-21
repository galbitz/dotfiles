#!/usr/bin/env bash

sudo apt install flatpak -y

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub io.gitlab.librewolf-community

sudo flatpak install com.discordapp.Discord

