#!/bin/bash

is_installed() {
    command -v "$1" > /dev/null 2>&1
}

install_package() {
    if ! is_installed "$1"; then
        echo "Installing $1..."
        sudo apt-get update
        sudo apt-get install -y "$1"
    else
        echo "$1 already installed"
    fi
}


#Hithub Desktop Linux
echo "Adding Shiftkey repository..."
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

#Google Chrome
echo "Adding Google Chrome repository..."
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

#Balena Etcher
echo "Adding Balena Etcher repository..."
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61


sudo apt-get update

install_package rofi
install_package i3
install_package tmux
install_package lxqt-policykit
install_package github-desktop
install_package google-chrome-stable
install_package balena-etcher-electron
