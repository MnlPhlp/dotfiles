#! /bin/sh

# config files
ln -s /home/manuel/dotfiles/.config/helix ~/.config
ln -s /home/manuel/dotfiles/.config/kitty ~/.config
ln -s /home/manuel/dotfiles/.config/sway ~/.config
ln -s /home/manuel/dotfiles/.config/walls ~/.config
ln -s /home/manuel/dotfiles/.config/waybar ~/.config
ln -s /home/manuel/dotfiles/.config/wspick ~/.config
ln -s /home/manuel/dotfiles/.config/starship.toml ~/.config

# bin
ln -s /home/manuel/dotfiles/.bin ~/.local/bin

# other
ln -s /home/manuel/dotfiles/.zshrc ~/
ln -s /home/manuel/dotfiles/.commonrc ~/
ln -s /home/manuel/dotfiles/.gitconfig ~/

# system files
sudo rm /usr/share/wayland-sessions/sway.desktop
sudo ln -s /home/manuel/dotfiles/usr/share/wayland-sessions/sway.desktop /usr/share/wayland-sessions/sway.desktop
