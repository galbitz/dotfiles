#!/usr/bin/env bash

# Install i3 (x11)

sudo DEBIAN_FRONTEND=noninteractive apt install -y keyboard-configuration
sudo apt install -y pulseaudio pulseaudio-utils pavucontrol alsa-utils
sudo apt install -y lightdm i3 kitty i3blocks alacritty scrot

# auto login and graphic detection disabled
sudo sed -i.bak '/#logind-check-graphical/c\logind-check-graphical=false' /etc/lightdm/lightdm.conf
sudo sed -i.bak "/#autologin-user=/c\autologin-user=$USER" /etc/lightdm/lightdm.conf


# install dwagent
wget https://www.dwservice.net/download/dwagent.sh
sudo chmod +x dwagent.sh
sudo ./dwagent.sh -console

# move dwagent under local user for audio to work

sudo systemctl stop dwagent.service
sudo systemctl disable dwagent.service

mkdir -p ~/.config/systemd/user
sudo mv /etc/systemd/system/dwagent.service ~/.config/systemd/user/
sudo chown $USER:$USER ~/.config/systemd/user/dwagent.service

sed -i 's/WantedBy=multi-user.target/WantedBy=default.target/' ~/.config/systemd/user/dwagent.service

sudo chown -R $USER:$USER /usr/share/dwagent

sudo loginctl enable-linger $USER

systemctl --user enable dwagent.service
systemctl --user start dwagent.service

