#!/usr/bin/env bash

#Script to install the latest version of Firefox for Debian-based distros
#AnthonyF 2020
#With the help of NicolasF

sourceFile="/etc/apt/sources.list"
source="deb http://ftp.us.debian.org/debian/ unstable main contrib non-free"
bye="Bye bye \( ^ -^)/"

#Commands
function installCommand() {
    apt update && apt install firefox -y
}

function removeCommand() {
    apt autoremove firefox-esr -y
}

#Asking with y/n answer
function question() {
    while read -r -p "${1}" answer; do
        case "$answer" in
        [yY][eE][sS] | [yY])
            return 0 #yes
            ;;
        [nN][oO] | [nN])
            return 1 #no
            ;;
        *)
            echo 'Type "Yes" or "No"'
            ;;
        esac
    done
}

#Installing Firefox
function install() {
    #Check the presence of the repo
    if ! grep -q "$source" $sourceFile; then
        #Install the repo
        echo $source >>$sourceFile
    fi

    #Install Firefox (the real one my man !)
    installCommand
    #Delete the repo
    head -n -1 $sourceFile >${sourceFile}.back
    mv ${sourceFile}.back $sourceFile
}

#Script
if question "Do you want to install the latest version of Firefox? [Y/n] "; then
    echo "Nice \( ^ -^)/"
    install
    echo "Firefox is now installed!"
    if question "Do you want to remove Firefox-ESR? [Y/n] "; then
        removeCommand
        echo "Firefox-ESR is now uninstalled!"
        echo $bye
    else
        echo $bye
    fi
else
    echo $bye
    exit
fi
