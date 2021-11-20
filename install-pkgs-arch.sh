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

# sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
# sudo pacman-key --lsign-key 3056513887B78AEB

# sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# sudo echo '[chaotic-aur]' >> /etc/pacman.conf
# sudo echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# Synchronize package databases 
sudo aura -Syu

# Install pkgs
sudo aura -S --noconfirm --needed neovim
sudo aura -S --noconfirm --needed bspwm
sudo aura -S --noconfirm --needed sxhkd
sudo aura -S --noconfirm --needed ranger
sudo aura -S --noconfirm --needed neofetch

# sudo aura -S --noconfirm --needed discord
sudo aura -S --noconfirm --needed rofi
sudo aura -S --noconfirm --needed brightnessctl
sudo aura -S --noconfirm --needed redshift
sudo aura -S --noconfirm --needed zsh
sudo aura -S --noconfirm --needed polkit-kde-agent
sudo aura -S --noconfirm --needed feh

# Install pkgs from the AUR
sudo aura -A --noconfirm --needed brave-bin
sudo aura -A --noconfirm --needed nerd-fonts-jetbrains-mono
sudo aura -A --noconfirm --needed montserrat-ttf
sudo aura -A --noconfirm --needed polybar

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

read -r -p "Are you installing this on a virtual machine? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "[#################[ Finished Installing Packages! ]###################]"
else
	sudo aura -A --noconfirm --needed picom-jonaburg-git
	echo "[#################[ Finished Installing Packages! ]###################]"
fi

