#!/usr/bin/bash
# Author: hiro
# Email: wfy11235813@gmail.com
# Required System: Arch-Based
# Description: When I install a new OS, run this file to Config & install basic software.


num_col=`tput cols`
int_1=1
comment_line=`while (( $int_1 <= $num_col)); do printf "#"; let "int_1++"; done`


# Print Comment and Matter words.
print() {
    echo comment_line
    if [ $1 -eq 0 ]
    then
        echo -e "\033[32m $2 \033[0m"
    else
        echo -e "\033[31m $2 \033[0m"
    fi
    echo comment_line
}

## Generate ssh public key.
ssh-keygen
cat ~/.ssh/id_rsa.pub
print 0 "Copy this and Paste to GitHub Account SSH Key."

## Check if Copy finished.
read -n 1 -p "Have you finished Last Action? [Y/N]" answer
case $answer in
    Y | y)
        echo "Continue"
        ;;
    N | n)
        print 1 "Please Copy ssh-key to Github Account at first."
        exit 1
        ;;
esac


## Download STKaiti.TTF
curl -o stkaiti.ttf https://github.com/dolbydu/font/raw/master/unicode/STKaiti.TTF
cp stkaiti.ttf /usr/share/fonts
fc-cache -vf


## Use tsinghua's mirror
print 0 "Replace mirror to tsinghux"
sudo sed '1 Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' -i /etc/pacman.d/mirrorlist
## Update
sudo pacman -Syyu
if [ $? -ne 0 ]
then
    print 1 "Replace Failed"
else
    print 0 "Replace Success"
fi


## install git
sudo pacman -S yay
yay -S git


## Install Emacs & Vim.
yay -S vim
yay -S emacs
## Clone own emacs configration.
git clone git@github.com:nicehiro/emacs.d.git


## fcitx
yay -S fcitx fcitx-libpinyin
git clone git@github.com:hrko99/fcitx-skin-material.git
cd fcitx-skin-material
cp -r material ~/.config/fcitx/skin/
print 0 "Fcitx Install Finished! You need to config current method in fcitx config tools."


## get my projects
git clone git@github.com:nicehiro/bin.git ~/bin
git clone git@github.com:nicehiro/org-files.git ~/Documents/org-files/
git clone git@github.com:nicehiro/nicehiro.github.io.git ~/Documents/nicehiro.me


## Chromium gimp inkscape spotify
yay -S google-chromium gimp inkscape spotify
if [ $0 -eq 0 ]
then
    print 0 "Chromium GIMP InkScape Spotify Install finished!"
else
    print 1 "Something went wrong when install Software"
fi
