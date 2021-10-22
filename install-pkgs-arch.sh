#!/bin/bash

##################################################################################################################
# Installing aura (package manager)
##################################################################################################################
sudo pacman -S --noconfirm --needed git 
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

##################################################################################################################
# Basic needs for a functional setup (specific to my setup)
##################################################################################################################
sudo aura -S --noconfirm --needed xorg-xev
sudo aura -S --noconfirm --needed xorg-xinit
sudo aura -S --noconfirm --needed xorg-xprop
sudo aura -S --noconfirm --needed xorg-xkill
sudo aura -S --noconfirm --needed xorg-server
sudo aura -S --noconfirm --needed xorg-xinput
sudo aura -S --noconfirm --needed xorg-xmodmap
sudo aura -S --noconfirm --needed xorg-xsetroot
sudo aura -S --noconfirm --needed xorg-xclipboard

sudo aura -S --noconfirm --needed bat
sudo aura -S --noconfirm --needed exa
sudo aura -S --noconfirm --needed git
sudo aura -S --noconfirm --needed zsh
sudo aura -S --noconfirm --needed vlc
sudo aura -S --noconfirm --needed mpv
sudo aura -S --noconfirm --needed maim
sudo aura -S --noconfirm --needed meld
sudo aura -S --noconfirm --needed btop
sudo aura -S --noconfirm --needed wget
sudo aura -S --noconfirm --needed sxiv
sudo aura -S --noconfirm --needed tmux
sudo aura -S --noconfirm --needed tldr
sudo aura -S --noconfirm --needed stow
sudo aura -S --noconfirm --needed gvfs
sudo aura -S --noconfirm --needed unzip
sudo aura -S --noconfirm --needed p7zip
sudo aura -S --noconfirm --needed bspwm
sudo aura -S --noconfirm --needed expac
sudo aura -S --noconfirm --needed qt5ct
sudo aura -S --noconfirm --needed xclip
sudo aura -S --noconfirm --needed sxhkd
sudo aura -S --noconfirm --needed dunst
sudo aura -S --noconfirm --needed zenity
sudo aura -S --noconfirm --needed man-db
sudo aura -S --noconfirm --needed wmname
sudo aura -S --noconfirm --needed polkit
sudo aura -S --noconfirm --needed ranger
sudo aura -S --noconfirm --needed openssh
sudo aura -S --noconfirm --needed ntfs-3g
sudo aura -S --noconfirm --needed mlocate
sudo aura -S --noconfirm --needed xdotool
sudo aura -S --noconfirm --needed zathura
sudo aura -S --noconfirm --needed pcmanfm
sudo aura -S --noconfirm --needed nitrogen
sudo aura -S --noconfirm --needed ueberzug
sudo aura -S --noconfirm --needed polybar
sudo aura -S --noconfirm --needed bbswitch
sudo aura -S --noconfirm --needed starship
sudo aura -S --noconfirm --needed numlockx
sudo aura -S --noconfirm --needed reflector
sudo aura -S --noconfirm --needed bitwarden
sudo aura -S --noconfirm --needed xarchiver
sudo aura -S --noconfirm --needed blueberry
sudo aura -S --noconfirm --needed bluez bluez-utils
sudo aura -S --noconfirm --needed playerctl
sudo aura -S --noconfirm --needed pulsemixer
sudo aura -S --noconfirm --needed noto-fonts
sudo aura -S --noconfirm --needed youtube-dl
sudo aura -S --noconfirm --needed dosfstools
sudo aura -S --noconfirm --needed intel-ucode
sudo aura -S --noconfirm --needed kvantum-qt5
sudo aura -S --noconfirm --needed polkit-gnome
sudo aura -S --noconfirm --needed brightnessctl
sudo aura -S --noconfirm --needed speedtest-cli
sudo aura -S --noconfirm --needed networkmanager
sudo aura -S --noconfirm --needed discord
sudo aura -S --noconfirm --needed pulseaudio-alsa
sudo aura -S --noconfirm --needed noto-fonts-emoji
sudo aura -S --noconfirm --needed archlinux-keyring
sudo aura -S --noconfirm --needed picom-jonaburg-git
sudo aura -S --noconfirm --needed papirus-icon-theme
sudo aura -S --noconfirm --needed network-manager-applet

##################################################################################################################
# Asian font support
##################################################################################################################
sudo aura -S --noconfirm --needed adobe-source-han-serif-cn-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-jp-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-kr-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-otc-fonts 
sudo aura -S --noconfirm --needed adobe-source-han-serif-tw-fonts

##################################################################################################################
# Nvidia packages
##################################################################################################################
sudo aura -S --noconfirm --needed nvidia
sudo aura -S --noconfirm --needed nvidia-prime
sudo aura -S --noconfirm --needed nvidia-utils
sudo aura -S --noconfirm --needed nvidia-settings
#sudo aura -S --noconfirm --needed xf86-video-nouveau

##################################################################################################################
# Development tools
##################################################################################################################
sudo aura -S --noconfirm --needed npm
sudo aura -S --noconfirm --needed neovim
sudo aura -S --noconfirm --needed nodejs
sudo aura -S --noconfirm --needed python3
sudo aura -S --noconfirm --needed ripgrep
sudo aura -S --noconfirm --needed python-pip

##################################################################################################################
# Extra programs
##################################################################################################################
sudo aura -S --noconfirm --needed neofetch
sudo aura -S --noconfirm --needed zathura-ps
sudo aura -S --noconfirm --needed imagemagick

##################################################################################################################
# Printer support (uncomment if needed)
##################################################################################################################
#sudo aura -S --noconfirm --needed cups
#sudo aura -S --noconfirm --needed cups-pdf
#sudo aura -S --noconfirm --needed gutenprint
#sudo systemctl enable cups
#sudo systemctl start cups

sudo systemctl enable sshd
sudo systemctl enable docker
sudo systemctl enable NetworkManager
sudo systemctl enable systemd-timesyncd

sudo systemctl start sshd
sudo systemctl start docker
sudo systemctl start NetworkManager
sudo systemctl start systemd-timesyncd

##################################################################################################################
# AUR packages
##################################################################################################################


##################################################################################################################
# Installing AUR packages
##################################################################################################################
sudo aura -Aca --noconfirm --needed alacritty
sudo aura -Aca --noconfirm --needed betterlockscreen
sudo aura -Aca --noconfirm --needed brave-bin
sudo aura -Aca --noconfirm --needed cava
sudo aura -Aca --noconfirm --needed cursor-theme-macos-big-sur
sudo aura -Aca --noconfirm --needed devour
sudo aura -Aca --noconfirm --needed discord-ptb
sudo aura -Aca --noconfirm --needed freetube-bin
sudo aura -Aca --noconfirm --needed gotop-bin
sudo aura -Aca --noconfirm --needed moc-pulse
sudo aura -Aca --noconfirm --needed nerd-fonts-jetbrains-mono
sudo aura -Aca --noconfirm --needed nordic-darker-theme
sudo aura -Aca --noconfirm --needed oh-my-zsh-git
sudo aura -Aca --noconfirm --needed optimus-manager
sudo aura -Aca --noconfirm --needed otf-san-francisco
sudo aura -Aca --noconfirm --needed spotify
sudo aura -Aca --noconfirm --needed timeshift-bin
sudo aura -Aca --noconfirm --needed tmux-plugin-manager
sudo aura -Aca --noconfirm --needed zsh-autosuggestions-git
sudo aura -Aca --noconfirm --needed zsh-syntax-highlighting-git
echo "################################################################"
echo "################### Core Software Installed"
echo "################################################################"
