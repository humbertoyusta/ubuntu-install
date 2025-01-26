#!/usr/bin/sh

# Chrome

wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub

gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub

echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt update 
sudo apt install google-chrome-stable

# VS Code

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Other command line tools

sudo apt install -y gh glab curl git ntfs-3g python3-pip openssh-server libssl-dev pkg-config

sudo systemctl start ssh
sudo systemctl enable ssh

## git config --global user.name $name
## git config --global user.email $email

gh auth login

glab auth login

# Messaging apps

## Telegram

sudo snap install telegram-desktop

## WhatsApp

### There is no official whatsapp client for linux, so to install web version in Chrome:
### Go to https://web.whatsapp.com/ then click on the three dots in the top right corner 
### and select "Cast, Save and Share", and Install

## Discord

sudo snap install discord

## Slack

sudo snap install slack

# Photos

## Install google photos as a web app like WhatsApp

# Notes (Joplin)

sudo snap install joplin-desktop

# Rust

sudo apt install rustup
rustup install stable
rustup update

sudo apt install protobuf-compiler

# For Asus Vivobook/Zenbook with AMD Ryzen AI 9 365-370

curl -L -o fan_state https://github.com/ThatOneCalculator/asus-5606-fan-state/raw/main/fan_state
sudo cp fan_state /usr/local/bin/
sudo chmod +x /usr/local/bin/fan_state
rm fan_state

fan_state set high


# Docker (https://docs.docker.com/engine/install/ubuntu/)

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

## May need to log out, and log in back or restart for user groups to apply

# NVM (https://github.com/nvm-sh/nvm)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash