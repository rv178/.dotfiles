# DO NOT RUN THIS SCRIPT, IT'S A WIP


Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Cya='\e[0;36m';
Whi='\e[0;37m';

echo -e "[${Gre}*${Whi}] Removing existing directories"

cd ~/.dotfiles
for dir in $(find .config -maxdepth 1 -mindepth 1 | awk -F "/" '{print $NF}')
do
	rm -rf ~/.config/$dir
done

for dir in $(find .home -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')
do
	rm -rf ~/$dir
done

echo -e "[${Gre}*${Whi}] Symlinking directories in .config"

cd ~/.dotfiles/.config
dots=$(ls -d */)
for dot in $dots
do
	mkdir -p ~/.config/$dot
	stow -t ~/.config $dot
done

echo -e "[${Gre}*${Whi}] Symlinking directories in .home"

cd ~/.dotfiles/.home
dots=$(ls -d */)
for dot in $dots
do
	stow -t ~/ $dot
done
