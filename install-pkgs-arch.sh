sudo pacman -S --noconfirm --needed git 
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

# Install ST terminal emulator
git clone https://github.com/idlidev/xelph-st-git
cd xelph-st-git/opt/xelph-st-git
sudo aura -S --noconfirm --needed cmake
sudo make clean install

# Add chaotic AUR support (optional)

# pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
# pacman-key --lsign-key 3056513887B78AEB

# pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# echo '[chaotic-aur]' >> /etc/pacman.conf
# echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# Synchronize package databases 
sudo aura -Syu

# Install pkgs
sudo aura -S --noconfirm --needed neovim
sudo aura -S --noconfirm --needed bspwm
sudo aura -S --noconfirm --needed sxhkd
sudo aura -S --noconfirm --needed ranger

# sudo aura -S --noconfirm --needed discord
sudo aura -S --noconfirm --needed rofi
sudo aura -S --noconfirm --needed brightnessctl
sudo aura -S --noconfirm --needed redshift
sudo aura -S --noconfirm --needed zsh
sudo aura -S --noconfirm --needed polkit-kde-agent
sudo aura -S --noconfirm --needed feh

#Install pkgs from the AUR
sudo aura -A --noconfirm --needed brave-bin
sudo aura -A --noconfirm --needed polybar

read -r -p "Are you installing this on a virtual machine? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	sudo aura -A --noconfirm --needed nerd-fonts-jetbrains-mono
	sudo aura -A --noconfirm --needed montserrat-ttf
else
	sudo aura -A --noconfirm --needed nerd-fonts-jetbrains-mono
	sudo aura -A --noconfirm --needed montserrat-ttf
    sudo aura -A --noconfirm --needed picom-jonaburg-git
fi

echo "[#################[ Finished Installing Packages! ]###################]"
