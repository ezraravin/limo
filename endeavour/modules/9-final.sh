# Final update
sudo pacman -Syu --noconfirm
sudo pacman -Sc --noconfirm
curl -fsSL "https://gitlab.com/ezraravinmateus/dotfiles/-/raw/HEAD/.zshrc" >~/.zshrc
fc-cache -fv

# Reboot prompt
echo "🎉 Setup complete! Rebooting in 5 seconds..."
sleep 5
sudo reboot
