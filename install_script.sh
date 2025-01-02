#!/bin/bash

# Atualiza os repositórios e o sistema
sudo apt update && sudo apt upgrade -y

# Instala o dpkg, necessário para algumas dependências
sudo apt install dpkg -y

# Instala Flatpak se não estiver instalado
sudo apt install flatpak -y

# Adiciona o repositório Flathub para Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instala o Gnome Sushi
sudo apt install gnome-sushi

# Instala aplicativos via Flatpak
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.github.simplenote.Simplenote -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.simplenote.Simplenote -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.localsend.localsend_app -y

# Instalar GitHub CLI
sudo apt install gh -y

# Instalar o tema Catppuccin do GitHub
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
cd Catppuccin-GTK-Theme
sudo ./install.sh
cd ..

# Limpeza de pacotes não necessários
sudo apt autoremove -y

# Mensagem final
echo "Instalação concluída! Por favor, configure manualmente o login no Firefox."

