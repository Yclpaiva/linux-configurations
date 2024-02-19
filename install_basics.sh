#!/bin/bash

# Função para verificar se um programa está instalado
is_installed() {
    command -v "$1" > /dev/null 2>&1
}

# Verificar se o Rofi está instalado
if ! is_installed rofi; then
    echo "Instalando Rofi..."
    sudo apt-get update
    sudo apt-get install -y rofi
else
    echo "Rofi já está instalado."
fi

# Verificar se o i3 está instalado
if ! is_installed i3; then
    echo "Instalando i3..."
    sudo apt-get update
    sudo apt-get install -y i3
else
    echo "i3 já está instalado."
fi

echo "Concluído."

