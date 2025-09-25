# Git SSH Setup
echo "🔐 Git SSH Setup"
read -p "Use SSH for Git? [y/N]: " ssh_choice
if [[ "$ssh_choice" =~ ^[Yy]$ ]]; then
  read -p "Name for SSH key: " key_name
  ssh-keygen -t ed25519 -C "$key_name" -N "" -f ~/.ssh/id_ed25519
  echo "📋 Public key (add to Git account):"
  cat ~/.ssh/id_ed25519.pub
  echo "🔗 Paste this in your Git account settings!"
  read -p "Press Enter after adding key to Git account..."
  GIT_CLONE_PREFIX="git@github.com:"
else
  GIT_CLONE_PREFIX="https://github.com/"
fi

# Dotfiles
[ ! -d ~/dotfiles ] && git clone $GIT_CLONE_PREFIX/ezraravin/dotfiles.git ~/dotfiles &&
  cp -r ~/dotfiles/. ~/ && rm -rf ~/dotfiles

# Git Config
if ! git config --global user.email &>/dev/null; then
  git config --global user.email "ezraravin@proton.me"
  git config --global user.name "Rave"
  git config --global init.defaultBranch main
fi
