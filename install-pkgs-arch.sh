#!/bin/bash

# Install aura
sudo pacman -S --noconfirm --needed git 
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

# Install pkgs
sudo aura -S --noconfirm --needed neovim
sudo aura -S --noconfirm --needed bspwm
sudo aura -S --noconfirm --needed sxhkd
sudo aura -S --noconfirm --needed ranger
sudo aura -S --noconfirm --needed discord
sudo aura -S --noconfirm --needed rofi
sudo aura -S --noconfirm --needed brightnessctl
sudo aura -S --noconfirm --needed redshift

#Install pkgs from the AUR
sudo aura -A --noconfirm --needed alacritty
sudo aura -A --noconfirm --needed polybar
sudo aura -A --noconfirm --needed nerd-fonts-jetbrains-mono
