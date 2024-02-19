#!/bin/bash

is_installed() {
    command -v "$1" > /dev/null 2>&1
}
if ! is_installed rofi; then
    echo "Installing Rofi..."
    sudo apt-get update
    sudo apt-get install -y rofi
else
    echo "Rofi already installed"
fi

if ! is_installed i3; then
    echo "Installing i3..."
    sudo apt-get update
    sudo apt-get install -y i3
else
    echo "i3 already installed"
fi

if ! is_installed tmux; then
    echo "Installing tmux..."
    sudo apt-get update
    sudo apt-get install -y tmux
else
    echo "tmux already installed."
fi


echo "Concluído."

