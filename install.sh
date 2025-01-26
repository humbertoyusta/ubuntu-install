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

sudo apt install -y gh glab curl git ntfs-3g

# git config --global user.name $name
# git config --global user.email $email

gh auth login

glab auth login

# Messaging apps

# Telegram

sudo snap install telegram-desktop

# WhatsApp
# There is no official whatsapp client for linux, so to install web version in Chrome:
# Go to https://web.whatsapp.com/ then click on the three dots in the top right corner 
# and select "Cast, Save and Share", and Install

# Discord

sudo snap install discord

# Slack

sudo snap install slack