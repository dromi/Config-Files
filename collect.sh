#!/bin/zsh

a="$(pwd)"
b=$HOME"/Config-Files"

echo $a
echo $b

if [ $a != $b ]
then 
echo "Launch script from ~/Config-Files folder"
else 

echo "Collecting files"
cp -r ~/.i3/ .
cp -r ~/.emacs.d/ .
cp ~/.emacs .
cp ~/.zshrc .

# remove auto saves from emacs.d
rm -rf .emacs.d/auto-save-list

# remove wallpapers from i3 folder
rm -rf .i3/wallpapers

echo "pushing to the hub"
git commit -a
git push
fi
