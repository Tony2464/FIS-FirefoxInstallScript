#!/bin/bash
#Script to install the latest version of Firefox for Debian-based distros

#Adding debian unstable repo 
echo "deb http://ftp.us.debian.org/debian/ unstable main contrib non-free"  >> /etc/apt/sources.list

#Installing Firefox
sudo apt update && sudo apt install firefox -y

echo "Firefox is now installed"
