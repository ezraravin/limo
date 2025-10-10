#!/bin/bash

export MODULES_INSTALL="$HOME/.limo/mac/modules"

git clone https://github.com/ezraravin/limo

# Extend sudo timeout for the entire script
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" 2>/dev/null || exit
done &

# Git protocol selection
read -rp "Use SSH for Git? [y/N] " git_response
if [[ "$git_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  GIT_URL="git@gitlab.com:"
else
  GIT_URL="https://gitlab.com/"
fi

source "$MODULES_INSTALL/001-brew.sh"
source "$MODULES_INSTALL/002-mac.sh"
source "$MODULES_INSTALL/003-dev.sh"

##############################################
### Git & Dotfiles
##############################################

git config --global user.email "ezraravin@proton.me"
git config --global user.name "MacBook Air M1"
git config --global init.defaultBranch main

if [ ! -d "$HOME/dotfiles" ]; then
  git clone "${GIT_URL}ezraravinmateus/dotfiles.git" "$HOME/dotfiles"
  rsync -a "$HOME/dotfiles/." "$HOME/"
  rm -rf "$HOME/dotfiles"
fi

echo "✅ Setup complete"
