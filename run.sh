#!/bin/bash

# set -e

echo ""
echo "=========================================="
echo "Development Environment Setup"
echo "=========================================="
echo ""
echo "This script will install:"
echo "  1. Homebrew (package manager)"
echo "  2. Visual Studio Code (code editor)"
echo "  3. Python 3 (programming language)"
echo "  4. Git (version control)"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

chmod +x \
    setup-homebrew.sh \
    setup-vscode.sh \
    setup-python.sh \
    setup-git.sh

./setup-homebrew.sh
./setup-vscode.sh
./setup-python.sh
./setup-git.sh

echo ""
echo "=========================================="
echo "Development Environment Setup Complete!!!"
echo "=========================================="
