#!/bin/bash

# set -e

echo ""
echo "=========================================="
echo "Git Installation & Github SSH Setup"
echo "=========================================="
echo ""

echo "Installing Git..."
sudo apt install -y git

echo "Configuring Git..."
git config --global user.name "MigashaneVictoire"
git config --global user.email "migashanevictoire@gmail.com"

echo "Setting up GitHub SSH..."
echo "----> Press ENTER to accept the default location and optionally set a passphrase."
ssh-keygen -t ed25519 -C "migashanevictoire@gmail.com"

echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

echo "Adding SSH key to agent..."
ssh-add ~/.ssh/id_ed25519

echo ""
echo "====================================="
echo "Your PUBLIC SSH key (copy this):"
echo "====================================="
cat ~/.ssh/id_ed25519.pub
echo ""
echo "====================================="
echo "Next steps:"
echo "1. Copy the key above"
echo "2. Go to https://github.com/settings/ssh/new"
echo "3. Paste the key and give it a title"
echo "4. Click 'Add SSH key'"
echo "====================================="
echo ""

echo "Git installation complete."
git --version
echo ""
echo "Git configuration:"
git config --list
echo ""

read -p "----> Press ENTER after you've added the key to GitHub to test the connection..."

echo "Testing GitHub connection..."
ssh -T git@github.com
