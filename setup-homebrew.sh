#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Homebrew Installation"
echo "=========================================="
echo ""

# Check if Homebrew is already installed
if command -v brew &> /dev/null; then
    echo "✓ Homebrew is already installed!"
    brew --version
    echo ""
    echo "To update Homebrew, run: brew update"
    exit 0
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "✓ Homebrew installed successfully"

# Determine shell configuration file
if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
    SHELL_CONFIG="$HOME/.zprofile"
elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ]; then
    SHELL_CONFIG="$HOME/.bash_profile"
else
    # Default to zsh on modern macOS
    SHELL_CONFIG="$HOME/.zprofile"
fi
echo "Configuring Homebrew in shell ($SHELL_CONFIG)..."

# Add Homebrew to PATH (if not already present)
BREW_INIT='eval "$(/opt/homebrew/bin/brew shellenv)"'
if ! grep -q "/opt/homebrew/bin/brew shellenv" "$SHELL_CONFIG" 2>/dev/null; then
    echo "$BREW_INIT" >> "$SHELL_CONFIG"
    echo "✓ Added Homebrew to shell configuration"
else
    echo "✓ Homebrew already configured in shell"
fi

echo ""
echo "✓ Installation Complete!"
echo "Homebrew version:"
brew --version
