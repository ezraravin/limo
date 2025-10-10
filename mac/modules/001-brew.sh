##############################################
### Package Management
##############################################

# Install Homebrew if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configure Homebrew
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Brew autoupdate
brew install pinentry-mac
brew tap domt4/autoupdate
if ! brew autoupdate status | grep -q "running"; then
  brew autoupdate start 43200 --cleanup --upgrade --immediate --sudo
fi