Red='\e[0;31m';
Gre='\e[0;32m';
Whi='\e[0;37m';

echo -e "[${Red}*${Whi}] Removing existing directories"

cd ~/.dotfiles
for dir in $(find .config -maxdepth 1 -mindepth 1 | awk -F "/" '{print $NF}')
do
	rm -rf ~/.config/$dir
done

for dir in $(find .home -mindepth 1 -maxdepth 1 | awk -F "/" '{print $NF}')
do
	rm -rf ~/$dir
done

echo -e "[${Gre}*${Whi}] Copying directories in .config"

cd ~/.dotfiles/.config
cp -r * ~/.config

echo -e "[${Gre}*${Whi}] Copying directories in .home"

cd ~/.dotfiles/.home
cp -r .zshrc ~
cp -r .dwm ~

echo -e "[${Gre}*${Whi}] Finished setting up configs"
