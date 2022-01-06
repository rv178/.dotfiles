Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Cya='\e[0;36m';
Whi='\e[0;37m';

# Synchronize package databases 

echo -e "[${Red}*${Whi}] Updating system.."
sudo pacman -Syu

# Install git
echo -e "[${Red}+${Whi}] Installing git"
sudo pacman -S --noconfirm --needed git 

# Install aura AUR helper
echo -e "[${Red}+${Whi}] Installing aura"
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

echo -e "[${Yel}*${Whi}] Do you want to install DWM or BSPWM [Select (1) for DWM and (2) for BSPWM]?"
read -r -p "(1 / 2) -> " response
if [[ "$response" =~ ^([1])$ ]]
then
	mkdir dotfiles-build
	cd dotfiles-build
	git clone https://github.com/idlidev/dwm
	cd dwm
	sudo pacman -S --noconfirm --needed yajl
	sudo make clean install

	echo -e "${Whi}[${Gre}*${Whi}] Installed DWM"
else
	sudo pacman -S bspwm
	echo -e "${Whi}[${Gre}*${Whi}] Installed BSPWM"
fi

echo -e "[${Red}+${Whi}] Installing ST"
# Install ST terminal emulator
git clone https://github.com/idlidev/xelph-st-git
cd xelph-st-git/opt/xelph-st-git
sudo make clean install
cd ~/.dotfiles

# Install pkgs
echo -e "[${Red}+${Whi}] Installing all other packages"

sudo pacman -S --noconfirm --needed neovim
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
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono
sudo pacman -S --noconfirm --needed yajl
sudo pacman -S --noconfirm --needed dunst
sudo pacman -S --noconfirm --needed nodejs

# Install pkgs from the AUR
echo -e "[${Cya}+${Whi}] Installing AUR packages"

sudo aura -Acax --noconfirm libxft-bgra
sudo aura -Acax --noconfirm betterlockscreen
sudo aura -Acax --noconfirm nerd-fonts-jetbrains-mono
sudo aura -Acax --noconfirm brave-bin
sudo aura -Acax --noconfirm montserrat-ttf
sudo aura -Acax --noconfirm polybar-dwm-module

echo -e "[${Gre}+${Whi}] Installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "[${Gre}*${Whi}] Setting up ZSH plugins"

mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting


# Change shell for root
echo -e "[${Red}*${Whi}] Changing shell for user"
sudo chsh -s /usr/bin/zsh

echo -e "[${Gre}*${Whi}] Cloning GTK theme and icons"

sudo git clone https://codeberg.org/tplasdio/numigsur-icon-theme.git /usr/share/icons/numigsur-icon-theme
sudo git clone https://github.com/EliverLara/Nordic /usr/share/themes/Nordic

read -r -p "Are you installing this on a virtual machine? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo -e "[${Gre}*${Whi}] Installation has finished!"
else
	echo -e "[${Red}+${Whi}] Installing picom"
	sudo aura -Acax --noconfirm picom-ibhagwan-git
	echo -e "[${Gre}*${Whi}] Installation has finished!"
fi

echo -e "[${Gre}*${Whi}] Setting up config files"

echo -e "➞ [${Red}*${Whi}] Removing ~/dotfiles-backup for backing up current configs"

rm -rf ~/dotfiles-backup

echo -e "➞ [${Gre}*${Whi}] Backing up existing directories"

mkdir -p ~/dotfilesq-backup
mkdir -p ~/dotfiles-backup/config
mkdir -p ~/dotfiles-backup/home

cd ~/.dotfiles
for dir in $(find .config -maxdepth 1 -mindepth 1 | awk -F "/" '{print $NF}')
do
	mv ~/.config/$dir ~/dotfiles-backup/config
done

for dir in $(find .home -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')
do
	mv ~/$dir ~/dotfiles-backup/home
done

echo -e "➞ [${Gre}*${Whi}] Backups saved in ~/dotfiles-backup"

echo -e "➞ [${Gre}*${Whi}] Copying directories in .config"

cd ~/.dotfiles/.config
cp -r * ~/.config

echo -e "➞ [${Gre}*${Whi}] Copying directories in .home"

cd ~/.dotfiles/.home
cp -r .zshrc ~
cp -r .dwm ~

echo -e "[${Gre}*${Whi}] Finished setting up configs"

