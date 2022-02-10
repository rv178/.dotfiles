#!/usr/bin/env bash
# this script is from shinyzenith's dotfiles repo (https://github.com/shinyzenith/.dotfiles)
# script to run as root before running setup.sh
# setting doas to work without password.
pacman -S opendoas --noconfirm --needed
pacman -Rdd sudo --noconfirm
echo "permit nopass :wheel" | tee -a /etc/doas.conf
echo "permit nopass :root" | tee -a /etc/doas.conf
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf
ln -s $(which doas) /usr/bin/sudo
echo "/bin/rm -fr /tmp/{.*,*} &> /dev/null" > /etc/rc.local
