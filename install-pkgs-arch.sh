sudo pacman -S --noconfirm --needed git 
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

# Install ST terminal emulator
git clone https://github.com/idlidev/xelph-st-git
cd xelph-st-git/opt/xelph-st-git
sudo aura -S --noconfirm --needed cmake
sudo make clean install

# Install my DWM fork
# git clone https://github.com/idlidev/dwm
# cd dwm
# sudo make clean install

# Add chaotic AUR support (optional)

# sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
# sudo pacman-key --lsign-key 3056513887B78AEB

# sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# sudo echo '[chaotic-aur]' >> /etc/pacman.conf
# sudo echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# Synchronize package databases 
sudo pacman -Syu

# Install pkgs
sudo pacman -S --noconfirm --needed neovim
sudo pacman -S --noconfirm --needed bspwm
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed neofetch

# sudo aura -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed rofi
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed redshift
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed polkit-kde-agent
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed exa

sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -S ttf-jetbrains-mono

# Install pkgs from the AUR
sudo aura -Acax --noconfirm --needed brave-bin
sudo aura -Acax --noconfirm --needed montserrat-ttf
sudo aura -Acax --noconfirm --needed polybar-dwm-module

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

read -r -p "Are you installing this on a virtual machine? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "[#################[ Finished Installing Packages! ]###################]"
else
	sudo aura -Acax --noconfirm --needed picom-jonaburg-git
	echo "[#################[ Finished Installing Packages! ]###################]"
fi

