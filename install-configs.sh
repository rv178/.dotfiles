#!/usr/bin/env bash
cd ~/.dotfiles
for dir in $( find .config -maxdepth 2 -mindepth 2 | awk -F "/" '{print $NF}')
do
    rm -rf ~/$dir
done

for dir in $(find .home -mindepth 2 -maxdepth 2 | awk -F "/" '{print $NF}')
do
    rm -rf ~/$dir
done

dots=$(ls -d ~/.dotfiles/.config/*)
for dot in $dots
do
    cp -r "$dot" ~/.config
done

mkdir ~/Pictures/wallpapers
wp-folder=$(ls -d ~/.dotfiles/.assets/wallpapers/*)
for wallpaper in $wp-folder
do
    cp -r "wallpaper" ~/Pictures/wallpapers
done

cp -r ~/.dotfiles/.home/.local/share/rofi ~/.local/share
cp -r ~/.dotfiles/.home/.zshrc ~
