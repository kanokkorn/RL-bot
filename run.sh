#!/bin/bash

# Test internet connection
ping -q -w1 -c1 google.com &>/dev/null && echo "Connected" || echo "Offline"

# Update & Upgrade existig packages
sudo apt-get update
sudo apt-get upgrade -y

# Install docker packages 
sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

# Get and check official docker PGP key 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

# Check CPU architecture and add repository 
arch=$(dpkg --print-architecture)
if [[ $arch == armhf* ]]; then
    echo "ARM x32 Architecture"
    sudo add-apt-repository \
        "deb [arch=armhf] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
elif  [[ $arch == arm64* ]]; then
    echo "ARM x64 Architecture"
    sudo add-apt-repository \
        "deb [arch=arm64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
fi

# update and install docker ce
sudo apt-get update -y && sudo apt-get install -y docker-ce docker-ce-cli containerd.io 

# Ask if user want to run dockerfile
PS3="Do you want to build dockerfile now?"
options = ("Yes", "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
            sudo docker build .
            ;;
        "No")
            break
            ;;
        *) echo "invalid input";;
    esac
done  
