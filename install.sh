#!/bin/bash

#####                                 #####
#### Installation script for Arch-Nord ####
#####                                 #####

#### OUTPUT STUFF ####

# print usage
function show_usage (){
    printf "Usage: $0 [device] [resolution]\n"
    printf "\n"
    printf "Device:\n"
    printf " -d|--desktop, set optimized settings for desktop devices\n"
    printf " -l|--laptop, set optimized settings for laptop devices\n"
    printf "\n"
    printf "Resolution:\n"
    printf " -fhd|--1080p, set optimized settings for 1080p screens\n"
    printf " -4k|--2160p, set optimized settings for 2160p screens\n\n"

    return 0;
}

# print info
show_info (){
    printf "This script will automatically set optimized settings for your system and create symlinks of files and folders to your home directoy.\n\n"
    printf '\e[31m%s\n%s\n\n\e[0m' "WARNING: already existing files and/or directories whith the same name and relative position will be replaced." "Do not run this script unless you are sure of what it does and have a backup of your dotfiles."
    
    return 0;
}

#### ARGUMENTS READING ####

# read arguments
if [ $# -ge 0 ]; then
    i=0
    j=0
    
    # loop all arguments
    while [ ! -z "$1" ]; do
        case $1 in
            '-d'|'--desktop')
                mode_on[i]='desktop'
                mode_off[j]='laptop'
                i+=1
                j+=1
                ;;

            '-l'|'--laptop')
                mode_on[i]='laptop'
                mode_off[j]='desktop'
                i+=1
                j+=1
                ;;

            '-fhd'|'--1080p')
                mode_on[i]='1080p'
                mode_off[j]='2160p'
                i+=1
                j+=1
                ;;

            '-4k'|'--2160p')
                mode_on[i]='2160p'
                mode_off[j]='1080p'
                i+=1
                j+=1
                ;;

            '-h'|'--help')
                show_usage
                exit 0;
                ;;

            *)
                printf '\e[31m%s\n\n\e[0m' "ERROR: incorrect input"
                show_usage
                exit 0
                ;;
        esac
    shift
    done
fi

#### CONFIRM TO INSTALL ####

show_info
read -p "Are you sure you want to continue the install? [y/N] " answer

case ${answer} in
    'Y'|'y')
        printf "installing...\n"
        ;;

    *)
        printf "installation canceled\n"
        exit 0;
        ;;
esac

#### SYMLINKS ####
## get directories ##

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


## create symlinks ##

# create necessary folders
for i in ${dir_list}; do
    mkdir -p ${HOME}/${i}
done

# create files symlinks
for i in ${file_list}; do
    ln -sfn ${dir}/${i} ${HOME}/${i}
done

# create extra symlinks
for i in ${extra_list[@]}; do
    rm -rf ${HOME}/${i}
    ln -sfn ${dir}/${i} ${HOME}/${i}
done

#### FILE CREATION/MODIFICATION ####

## font ##

# download and extract font
fonts=${dir}/".local/share/fonts"
if (test ! -d ${fonts}/Noto-nerd) then
    # dowload font if necessary
    if (test ! -f ${fonts}/Noto.zip) then 
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip -P ${fonts}
    fi

    # create font folder
    unzip -d ${fonts}/Noto-nerd ${fonts}/Noto.zip
fi 


## set optimized settings ##

for file in ${file_list}; do
    # uncomment ${mode_on} settings and comment ${mode_off} settings
    for j in ${mode_on[@]}; do
        # set comment type depending on file extension
        case ${file##*.} in
            'ini')
                comment=';'
                ;;
            *)
                comment='#'
                ;;
        esac

        # uncomment lines beween ${j} settings start and ${j} settings end
        sed -i '/^'${comment}${comment}' '${j}' settings start/,/^'${comment}${comment}' '${j}' settings end/s/^'${comment}'//' ${file}
    done
    for j in ${mode_off[@]}; do
        # set comment type depending on file extension
        case ${file##*.} in
            'ini')
                comment=';'
                ;;
            *)
                comment='#'
                ;;
        esac
        # comment lines beween ${j} settings start and ${j} settings end
        sed -i '/^'${comment}' '${j}' settings start/,/^'${comment}' '${j}' settings end/s/^/'${comment}'/' ${file}
        #sed -i '/^; '${j}' settings start/,/^; '${j}' settings end/s/^/;/' ${file}
    done
done
