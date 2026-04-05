#!/bin/bash

# Atualiza os repositórios e o sistema
sudo apt update && sudo apt upgrade -y

# Instala o dpkg, necessário para algumas dependências
sudo apt install dpkg -y

# Instala Flatpak
sudo apt install flatpak -y

# Instala Gnome Tweaks e Extension Manager
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extension-manager

# Adiciona o repositório Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instala o Gnome Sushi
sudo apt install gnome-sushi -y

# Instala aplicativos via Flatpak
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.github.simplenote.Simplenote -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.simplenote.Simplenote -y
flatpak install flathub com.todoist.Todoist -y
flatpak install flathub org.localsend.localsend_app -y

# Instalar GitHub CLI
sudo apt install gh -y

###############################################
# Instalar Google Chrome e aplicar correção
###############################################

# Baixa o pacote oficial
wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Instala o pacote
sudo apt install /tmp/google-chrome.deb -y

# Ajusta o launcher para corrigir problemas no Wayland/WebRTC
CHROME_DESKTOP="/usr/share/applications/google-chrome.desktop"

sudo sed -i 's|Exec=/usr/bin/google-chrome-stable|Exec=/usr/bin/google-chrome-stable --ozone-platform=x11 --disable-features=WebRtcAllowDmabuf|g' "$CHROME_DESKTOP"

###############################################

# Limpeza de pacotes não necessários
sudo apt autoremove -y

# Mensagem final
echo "Instalação concluída"
