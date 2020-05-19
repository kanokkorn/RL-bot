#!/bin/bash

# Update & Upgrade existig packages
sudo apt-get update && sudo apt-get upgrade -y

# Install docker packages 
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

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
