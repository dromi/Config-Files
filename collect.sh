#!/bin/zsh

a="$(pwd)"
b=$HOME"/Config-Files"

if [ $a != $b ]
then 
echo "Launch script from ~/Config-Files folder"
else 

echo "Collecting files"
sudo cp -r ~/.i3/ i3/
sudo cp -r ~/.emacs.d/ emacs/
sudo cp ~/.zshrc zsh/
sudo cp ~/.gitconfig git/

# remove auto saves from emacs.d
sudo rm -rf emacs/.emacs.d/auto-save-list

# remove wallpapers from i3 folder
rm -rf i3/.i3/wallpapers/*

# echo "Pushing to the hub"
git commit -a
git push
fi
