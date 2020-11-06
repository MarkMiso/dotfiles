#!/bin/sh
#
# CleanFetch
# generalization of kiedtl-fetch1
#
# orignal creator: (c) Kiëd Llaentenn

#set folder for os name
. /etc/os-release

# color escapes
BLK="$(printf "\033[30m")"
RED="$(printf "\033[31m")"
GRN="$(printf "\033[32m")"
YLW="$(printf "\033[33m")"
BLU="$(printf "\033[34m")"
PUR="$(printf "\033[35m")"
CYN="$(printf "\033[36m")"
WHT="$(printf "\033[37m")"
RST="$(printf "\033[0m")"

# set os, editor and shell variables
os=${PRETTY_NAME:-?}
editor=${EDITOR:-?}
shell=${SHELL##*/}

#set pkg variable
case $os in
    "Arch Linux")
        pkgs=$(pacman -Q | wc -l)
        ;;

    "Gentoo")
        pkgs=$(ls -d /var/db/pkg/*/* | wc -l)
        ;;

    "void")
        pkgs=$(xbps-query -l | wc -l)
        ;;

    "Debian")
        pkgs=$(dpkg -l | tail -n+6 | wc -l)
        ;;

    "Ubuntu")
        pkgs=$(dpkg -l | tail -n+6 | wc -l)
        ;;

    *)
        pkgs=?
        ;;
esac

# build color bar
BASE="━━━━"
bar="$RED$BASE$GRN$BASE$YLW$BASE$BLU$BASE$PUR$BASE$CYN$BASE$RST"

# set line lenght
space="                        "

#set list of outputs
name=("$os" "$editor" "$pkgs" "$shell")

#print first color bar
printf '\n%s\n' ${bar}

#print text
i=0
for id in os editor pkgs shell
do
    line=$id${space:${#id}}
    printf '%s%s\n' "$BLU${line:0:-${#name[i]}}" "$RST${name[i]}"

    let "i++"
done

#print second color bar
printf '%s\n\n' ${bar}
