#! /bin/sh

. /etc/os-release
if [ "$NAME" == "Arch Linux" ]; then
  sudo pacman -S go gtk-layer-shell xdg-utils python-i3ipc
else
  sudo nala install golang libgtk-layer-shell-dev libgtk-3-dev xdg-utils python3-i3ipc
fi

mkdir nwg_components
cd nwg_components

echo # installing nwg-bar
git clone https://github.com/nwg-piotr/nwg-bar
cd nwg-bar
make get
make build
sudo make install
cd ..

echo # installing nwg-drawer
git clone https://github.com/nwg-piotr/nwg-drawer
cd nwg-drawer
make get
make build
sudo make install
cd ..

echo # installing nwg-look
git clone https://github.com/nwg-piotr/nwg-look
cd nwg-look
make get
make build
sudo make install
cd ..

echo # installing nwg-displays
git clone https://github.com/nwg-piotr/nwg-displays
cd nwg-displays
sudo ./install.sh
cd ..

sudo rm -rf nwg_components
