#!/bin/bash
set -e

echo "🌙 Configuration de l'environnement Nour al-Islam..."

# 1. Mise à jour des paquets
sudo apt-get update
sudo apt-get install -y \
  curl git unzip xz-utils zip \
  libglu1-mesa wget \
  chromium-browser

# 2. Installation de Flutter 3.27.1
if [ ! -d "/opt/flutter" ]; then
  echo "📦 Téléchargement de Flutter 3.27.1..."
  cd /tmp
  wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz
  sudo mkdir -p /opt
  sudo tar xf flutter_linux_3.27.1-stable.tar.xz -C /opt
  sudo chown -R $(whoami):$(whoami) /opt/flutter
fi

# 3. Configuration PATH pour Flutter
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc
export PATH="$PATH:/opt/flutter/bin"

# 4. Configuration Git safe.directory
git config --global --add safe.directory /opt/flutter
git config --global --add safe.directory /workspaces/nour-al-islam

# 5. Configuration Flutter
flutter config --no-analytics
flutter config --enable-web

# 6. Récupération des dépendances
cd /workspaces/nour-al-islam
flutter pub get

echo "✅ Environnement prêt !"
echo "🌙 Pour lancer l'app : flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0"
