#!/usr/bin/env bash

echo "Installing niri"

sudo pacman -S --noconfirm niri xdg-desktop-portal-gnome wtype waybar foot swaybg wl-clipboard grim slurp mako

echo "Deploying niri session launcher"

cp install/omarchy/niri-session.sh ~/niri.sh
chmod +x ~/niri.sh

echo "Disabling autologin in SDDM"

sudo sed -i '/^\[Autologin\]/,/^\[/ s/^\([^[]\)/#\1/' /etc/sddm.conf.d/autologin.conf
sudo sed -i '/^\[Theme\]/,/^\[/ s/^\(Current\)/#\1/' /etc/sddm.conf.d/autologin.conf

echo "Creating niri desktop session entry"

sudo tee /usr/share/wayland-sessions/niri.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Niri
Comment=A scrollable-tiling Wayland compositor
Exec=/home/gabor/niri.sh
Type=Application
DesktopNames=niri
EOF
