#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Python & pip Installation"
echo "=========================================="
echo ""

echo "Installing Python 3..."
sudo apt install -y python3 python3-pip python3-venv
echo "✓ Python 3 installed successfully"
echo ""

# Determine shell configuration file
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.bashrc"
fi
echo "🔧 Configuring shell ($SHELL_CONFIG)..."

# Add ~/.local/bin to PATH (if not already present) - this is where
# `pip3 install --user` puts console scripts
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_CONFIG" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
    echo "✓ Added ~/.local/bin to PATH"
fi

# Add Python aliases (if not already present)
if ! grep -q 'alias python=python3' "$SHELL_CONFIG" 2>/dev/null; then
    echo 'alias python=python3' >> "$SHELL_CONFIG"
    echo 'alias pip=pip3' >> "$SHELL_CONFIG"
    echo "✓ Added Python aliases"
fi

export PATH="$HOME/.local/bin:$PATH"
alias python=python3
alias pip=pip3

echo ""
echo "✓ Installation Complete!"
echo "Installed versions:"
python3 --version
pip3 --version
