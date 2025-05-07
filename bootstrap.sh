#!/usr/bin/env bash
set -e

echo "[*] Cloning bare dotfiles repo..."
git clone --bare git@github.com:nitondev/termux.git $HOME/.dotfiles

echo "[*] Creating alias..."
echo "alias dotfiles='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> $HOME/.bashrc

echo "[*] Checking out files..."
mkdir -p .backup
dotfiles checkout || {
  echo "[*] Backing up pre-existing dotfiles..."
  for file in $(dotfiles checkout 2>&1 | grep -oP '\s+\.\S+' | tr -d ' '); do
    mv "$file" .backup/
  done
  dotfiles checkout
}

dotfiles config --local status.showUntrackedFiles no
echo "[*] Done!"
