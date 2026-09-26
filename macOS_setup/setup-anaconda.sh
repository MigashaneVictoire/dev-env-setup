#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Miniconda Installation"
echo "=========================================="
echo ""

echo "Installing Miniconda..."
brew install --cask miniconda
echo "✓ Miniconda installed successfully"
echo ""

# To install the fulllAnaconda
# echo "Installing Anaconda..."
# brew install --cask anaconda
# echo "✓ Anaconda installed successfully"
# echo ""

# # Determine shell configuration file
# if [ -n "$ZSH_VERSION" ]; then
#     SHELL_CONFIG="$HOME/.zshrc"
# elif [ -n "$BASH_VERSION" ]; then
#     SHELL_CONFIG="$HOME/.bash_profile"
# else
#     SHELL_CONFIG="$HOME/.bash_profile"
# fi
# echo "🔧 Configuring shell ($SHELL_CONFIG)..."

# Add anaconda to PATH (if not already present)
# if ! grep -q 'export PATH="/opt/homebrew/anaconda3/bin:$PATH"' "$SHELL_CONFIG"; then
#     echo 'export PATH="/opt/homebrew/anaconda3/bin:$PATH"' >> "$SHELL_CONFIG"
#     echo "✓ Added Homebrew to PATH"
# fi

echo ""
echo "✓ Installation Complete!"
echo "Installed versions:"
conda --version
