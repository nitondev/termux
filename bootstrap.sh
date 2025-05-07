#!/usr/bin/env bash
set -euo pipefail

REPO="git@github.com:nitondev/termux.git"
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.backup"

echo "[*] Cloning bare dotfiles repo..."
git clone --bare "$REPO" "$DOTFILES_DIR"

dotfiles() {
  git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
}

echo "[*] Checking out files..."
mkdir -p "$BACKUP_DIR"
if ! dotfiles checkout; then
  echo "[*] Backing up pre-existing dotfiles..."
  dotfiles checkout 2>&1 | grep -oP '\s+\.\S+' | tr -d ' ' | while read -r file; do
    mkdir -p "$BACKUP_DIR/$(dirname "$file")"
    mv "$file" "$BACKUP_DIR/$file"
  done
  dotfiles checkout
fi

dotfiles config --local status.showUntrackedFiles no

echo "[*] Done!"
