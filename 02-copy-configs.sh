Red='\e[0;31m';
Gre='\e[0;32m';
Whi='\e[0;37m';

echo -e "[${Gre}*${Whi}] Setting up config files"

echo -e "➞ [${Red}*${Whi}] Removing ~/dotfiles-backup for backing up current configs"

rm -rf ~/dotfiles-backup

echo -e "➞ [${Gre}*${Whi}] Backing up existing directories"

mkdir -p ~/dotfiles-backup
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
