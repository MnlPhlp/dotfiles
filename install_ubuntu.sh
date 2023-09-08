#! /bin/bash

echo ###########################
echo # installing apt packages #
echo ###########################
sudo apt update
sudo apt upgrade
sudo apt install nala
sudo nala install zsh wofi waybar kitty fonts-firacode fonts-powerline fzf pavucontrol seafile-gui blueman light clipman baobab gnome-calendar sway pinentry-qt texlive-latex-extra latexmk biber swaylock swayidle grimshot
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo nala install helix

echo ########################
echo # installing oh-my-zsh #
echo ########################
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

echo ###########################
echo # settings zsh as default #
echo ###########################
chsh -s /bin/zsh

echo ##############################
echo # installing starship prompt #
echo ##############################
curl -sS https://starship.rs/install.sh | sudo sh

echo #####################
echo # installing gopass #
echo #####################
curl https://packages.gopass.pw/repos/gopass/gopass-archive-keyring.gpg | sudo tee /usr/share/keyrings/gopass-archive-keyring.gpg >/dev/null
cat << EOF | sudo tee /etc/apt/sources.list.d/gopass.sources
Types: deb
URIs: https://packages.gopass.pw/repos/gopass
Suites: stable
Architectures: all amd64 arm64 armhf
Components: main
Signed-By: /usr/share/keyrings/gopass-archive-keyring.gpg
EOF
sudo apt update
sudo nala install gopass gopass-archive-keyring

