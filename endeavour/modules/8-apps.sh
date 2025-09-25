# Applications
echo "🖥️ App Setup"
echo "🌐 Browsers"
curl -fsS https://dl.brave.com/install.sh | sh
echo "🎵 Spotify"
yay -S --noconfirm spotify
bash <(curl -sSL https://spotx-official.github.io/run.sh)
echo "🎬 Media"
sudo pacman -S --noconfirm vlc obs-studio kdenlive blender xdg-desktop-portal-gnome xdg-desktop-portal xdg-desktop-portal-wlr
echo "💾 Ventoy"
yay -S --noconfirm ventoy-bin
echo "✅ Apps installed"
