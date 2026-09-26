#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "APT Update"
echo "=========================================="
echo ""

# apt is WSL Ubuntu's package manager - the equivalent of Homebrew on macOS.
# It's already installed by default, so (like the Homebrew script) this just
# makes sure it's present and refreshes it before anything else installs.

if ! command -v apt &> /dev/null; then
    echo "✗ apt was not found. This script expects Ubuntu/Debian-based WSL."
    exit 1
fi

echo "✓ apt is already installed!"
echo "Updating package lists..."
sudo apt update

echo "Upgrading existing packages..."
sudo apt upgrade -y

echo ""
echo "✓ Update Complete!"
apt --version | head -n 1
