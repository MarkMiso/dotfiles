#!/bin/bash

#
# "installation" script for arch-nord
#

# get script directory
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# list of folders to symlync
# NOTE: all paths here should be complete and relative to the script folder
extra_list=(".local/share/fonts" ".local/share/icons" ".local/share/themes")

# build list of files symlink
find_file='find ${dir} 
    -type d -name ".git" -prune -o 
    -type f -name ".gitignore" -o 
    -type f -name ".gitkeep" -o 
    -type f -name "install.sh" -o '

for i in ${extra_list[@]}; do
    find_file=$find_file'-type d -path "${dir}/'${i}'" -prune -o '
done

find_file+='-type f -printf "%P\n"'
file_list=$(eval $find_file)

# build list of folders to create
find_die='find ${dir} 
    -type d -name ".git" -prune -o ' 

for i in ${extra_list[@]}; do
    find_dir=$find_die'-type d -path "${dir}/'${i}'" -prune -o '
done

find_dir+='-type d -printf "%P\n"'
dir_list=$(eval $find_dir)

# download and extract font
fonts=${dir}/".local/share/fonts"
if (test ! -d ${fonts}/Noto-nerd) then
    if (test ! -f ${fonts}/Noto.zip) then 
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip -P ${fonts}
    fi
    unzip -d ${fonts}/Noto-nerd ${fonts}/Noto.zip
fi 

# create necessary folders
for i in ${dir_list}; do
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
