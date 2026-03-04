#!/usr/bin/env bash

echo "Instalando fastfetch-snt..."

mkdir -p ~/.config/fastfetch/logos
mkdir -p ~/.local/bin

cp config.jsonc ~/.config/fastfetch/
cp logos/*.png ~/.config/fastfetch/logos/
cp ff-random.sh ~/.local/bin/
chmod +x ~/.local/bin/ff-random.sh

# Agrega PATH si no está
if ! grep -q '.local/bin' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

# Agrega alias y autorun si no existen
if ! grep -q "fastsnt" ~/.zshrc 2>/dev/null; then
    echo "alias fastsnt='ff-random.sh'" >> ~/.zshrc
    echo "fastsnt" >> ~/.zshrc
fi

echo "Listo! Ejecuta: source ~/.zshrc"
