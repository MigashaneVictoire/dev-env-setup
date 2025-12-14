#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Python & pip Installation"
echo "=========================================="
echo ""

echo "Installing Python 3..."
brew install python
echo "✓ Python 3 installed successfully"
echo ""

# Determine shell configuration file
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bash_profile"`
else
    SHELL_CONFIG="$HOME/.bash_profile"
fi
echo "🔧 Configuring shell ($SHELL_CONFIG)..."

# Add Python to PATH (if not already present)
if ! grep -q 'export PATH="/opt/homebrew/bin:$PATH"' "$SHELL_CONFIG"; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> "$SHELL_CONFIG"
    echo "✓ Added Homebrew to PATH"
fi

# Add Python aliases (if not already present)
if ! grep -q 'alias python=python3' "$SHELL_CONFIG"; then
    echo 'alias python=python3' >> "$SHELL_CONFIG"
    echo 'alias pip=pip3' >> "$SHELL_CONFIG"
    echo "✓ Added Python aliases"
fi

export PATH="/opt/homebrew/bin:$PATH"
alias python=python3
alias pip=pip3

echo ""
echo "✓ Installation Complete!"
echo "Installed versions:"
python3 --version
pip3 --version