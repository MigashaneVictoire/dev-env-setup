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

echo ""
echo "Installing python extension for VScode..."
code --install-extension ms-python.python
echo "VS Code version:"

# create the code settings.json file if not exits
# copy the vscode-settings.json to the s new location
echo "Setting Code setting..."
mkdir -p ~/Library/Application\ Support/Code/User/
cp vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "VS Code settings configured successfully!"

