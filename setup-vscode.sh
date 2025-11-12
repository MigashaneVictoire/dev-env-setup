#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Visual Studio Code Installation"
echo "=========================================="
echo ""

echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code
echo "✓ VS Code installed successfully"
echo ""

# Determine shell configuration file
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bash_profile"
else
    SHELL_CONFIG="$HOME/.bash_profile"
fi
echo "🔧 Configuring shell ($SHELL_CONFIG)..."

CODE_PATH='export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"'
if ! grep -q "Visual Studio Code.app/Contents/Resources/app/bin" "$SHELL_CONFIG"; then
    echo "$CODE_PATH" >> "$SHELL_CONFIG"
    echo "✓ Added 'code' command to PATH"
else
    echo "✓ 'code' command already in PATH"
fi

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

echo ""
echo "✓ Installation Complete!"
echo "VS Code version:"
code --version
