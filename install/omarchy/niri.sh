#!/usr/bin/env bash

echo "Installing niri"

sudo pacman -S --noconfirm niri xdg-desktop-portal-gnome wtype waybar foot swaybg wl-clipboard grim slurp mako swayidle swaylock

echo "Deploying niri session launcher"

cp install/omarchy/niri-session.sh ~/niri.sh
chmod +x ~/niri.sh

echo "Disabling autologin in SDDM"

sudo sed -i '/^\[Autologin\]/,/^\[/ s/^\([^[#]\)/#\1/' /etc/sddm.conf.d/autologin.conf
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

echo "Configuring niri services"
systemctl --user add-wants niri.service mako.service
systemctl --user add-wants niri.service waybar.service

tee ~/.config/systemd/user/swayidle.service > /dev/null <<EOF
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 'swaylock -f' before-sleep 'swaylock -f'
Restart=on-failure
EOF

systemctl --user daemon-reload
systemctl --user add-wants niri.service swayidle.service
