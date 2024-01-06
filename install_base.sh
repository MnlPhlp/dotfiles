#! /bin/sh

echo #######################
echo # installing packages #
echo #######################
. /etc/os-release
if [ "$NAME" == "Arch Linux" ]; then
  sudo pacman -S zsh helix gopass swaylock swayidle wofi waybar kitty fzf pavucontrol powerline-fonts ttf-fira-code blueman light baobab gnome-calendar texlive-latexextra texlive-binextra wget network-manager-applet swaybg wl-clipboard mako
  pamac build seafile-client clipman grimshot
else
  echo "unsuported distribution"
fi


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
