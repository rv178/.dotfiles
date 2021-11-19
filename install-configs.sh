rm -rf ~/.config/rofi ~/.local/share/rofi ~/.config/ranger ~/.config/dunst ~/.zprofile ~/.xinitrc ~/.config/sxhkd ~/.config/betterlockscreenrc ~/.config/bspwm ~/.config/nvim ~/.config/polybar ~/.config/zathura ~/.zshrc

cd ~/.dotfiles/.home/
homefiles=$(ls -d */)
for home in $homefiles
do 
	stow -D $home -t ~/
	stow $home -t ~/
done

cd ~/.dotfiles/.config/
dots=$(ls -d */)
for dot in $dots
do
	stow -D $dot -t ~/.config
	stow $dot -t ~/.config
done

mkdir -p ~/Pictures/wallpapers
sudo cp ~/.dotfiles/.assets/wallpapers/* ~/Pictures/wallpapers

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
