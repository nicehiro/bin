#!/usr/bin/bash
# Author: hiro
# Email: wfy11235813@gmail.com
# Required System: Arch-Based
# Description: Change Source Mirrors for Arch Linux.


## Print Func.
print() {
    echo "------------------------"
    printf $1
    echo "------------------------"
}

## Use tsinghua's mirror
print "Replace mirror to tsinghux"
sudo sed '1 Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' -i /etc/pacman.d/mirrorlist
## Update
sudo pacman -Syyu
if [ $? -ne 0 ]
then
    print "Replace Failed"
else
    print "Replace Success"
fi
