Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Cya='\e[0;36m';
Whi='\e[0;37m';

# Synchronize package databases 

echo -e "[${Red}*${Whi}] Updating system.."
sudo pacman -Syu

# Install aura AUR helper
echo -e "[${Red}+${Whi}] Installing aura"
git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-git-cloned
cd /tmp/aura-git-cloned/
makepkg -sfci --noconfirm --needed

# Install pkgs
echo -e "[${Red}+${Whi}] Installing repo packages"
for repo_pkg in $(cat ~/.dotfiles/.assets/pkg_lists/pkg_list.txt)
do
	sudo pacman -S --noconfirm --needed $repo_pkg
done

# -----

echo -e "[${Yel}*${Whi}] Do you want to install DWM or BSPWM [Select (1) for DWM and (2) for BSPWM]?"
read -r -p "(1 / 2) -> " response
if [[ "$response" =~ ^([1])$ ]]
then
	mkdir dotfiles-build
	cd dotfiles-build
	git clone https://github.com/idlidev/dwm
	cd dwm
	make poly

	echo -e "${Whi}[${Gre}*${Whi}] Installed DWM"
else
	sudo pacman -S bspwm
	echo -e "${Whi}[${Gre}*${Whi}] Installed BSPWM"
fi

# Install ST terminal emulator
echo -e "[${Red}+${Whi}] Installing ST"
git clone https://github.com/idlidev/xelph-st-git
cd xelph-st-git/opt/xelph-st-git
sudo make clean install
cd ~/.dotfiles

# Install pkgs from the AUR
echo -e "[${Cya}+${Whi}] Installing AUR packages"
for aur_pkg in $(cat ~/.dotfiles/.assets/pkg_lists/pkg_list_aur.txt)
do
	sudo aura -Acax --noconfirm $aur_pkg
done

# Install vim-plug
echo -e "[${Gre}+${Whi}] Installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setup ZSH
echo -e "[${Gre}*${Whi}] Setting up ZSH plugins"
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# Change shell for root
echo -e "[${Red}*${Whi}] Changing shell for user"
sudo chsh -s /usr/bin/zsh

# Clone GTK theme(s) and icons
echo -e "[${Gre}*${Whi}] Cloning GTK theme and icons"

sudo git clone https://codeberg.org/tplasdio/numigsur-icon-theme.git /usr/share/icons/numigsur-icon-theme
sudo git clone https://github.com/EliverLara/Nordic /usr/share/themes/Nordic

# Install picom if user is not invoking the script in a vm
read -r -p "Are you installing this on a virtual machine? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo -e "[${Gre}*${Whi}] Installation has finished!"
else
	echo -e "[${Red}+${Whi}] Installing picom"
	sudo aura -Acax --noconfirm picom-ibhagwan-git
	echo -e "[${Gre}*${Whi}] Installation has finished!"
fi

chmod +x ./03-symlink-configs.sh
./03-symlink-configs.sh
