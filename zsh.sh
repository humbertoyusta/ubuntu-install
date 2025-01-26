#!/usr/bin/sh

sudo apt install zsh

chsh -s "$(which zsh)"

# may need to log out and log in again

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

nano ~/.zshrc # Change zsh theme to "josh"

