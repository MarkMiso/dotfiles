#!/bin/bash

#
# "installation" script for arch-nord
#

# get script directory
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# get list of files and folders to symlink/create
file_list="$(find ${dir} \
    -type d -name ".git" -prune -o \
    -type f -name ".gitignore" -o \
    -type f -name ".gitkeep" -o \
    -type f -name "install.sh" -o \
    -type d -path "${dir}/.local/share/fonts" -prune -o \
    -type d -path "${dir}/.local/share/icons" -prune -o \
    -type d -path "${dir}/.local/share/themes" -prune -o \
    -type f -printf "%P\n")"

folder_list="$(find ${dir} \
    -type d -name ".git" -prune -o \
    -type d -path "${dir}/.local/share/fonts" -prune -o \
    -type d -path "${dir}/.local/share/icons" -prune -o \
    -type d -path "${dir}/.local/share/themes" -prune -o \
    -type d -printf "%P\n")"

extra_list=(".local/share/fonts" ".local/share/icons" ".local/share/themes")

# download and extract font
fonts=${dir}/".local/share/fonts"
if (test ! -d ${fonts}/Noto-nerd) then
    if (test ! -f ${fonts}/Noto.zip) then 
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip -P ${fonts}
    fi
    unzip -d ${fonts}/Noto-nerd ${fonts}/Noto.zip
fi 

# create necessary folders
for i in ${folder_list}; do
    mkdir -p ${HOME}/${i}
done

# create file symlinks
for i in ${file_list}; do
    ln -sfn ${dir}/${i} ${HOME}/${i}
done

# create extra symlinks
for i in ${extra_list[@]}; do
    rm -rf ${HOME}/${i}
    ln -sfn ${dir}/${i} ${HOME}/${i}
done
