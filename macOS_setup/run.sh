#!/bin/bash

# set -e

echo ""
echo "=========================================="
echo "Development Environment Setup"
echo "=========================================="
echo ""
echo "This script will install:"
echo "  1. Homebrew"
echo "  2. Visual Studio Code"
echo "  3. Python 3"
echo "  4. Git"
echo "  5. Docker"
echo "  6. Miniconda"
echo "  7. Pip Requirements"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

chmod +x \
    # setup-homebrew.sh \
    # setup-python.sh \
    # setup-anaconda.sh\
    # setup-vscode.sh
    # setup-git.sh \
    # setup-docker.sh

./setup-homebrew.sh
./setup-python.sh
./setup-anaconda.sh
pip3 install -r requirements.txt
./setup-vscode.sh
./setup-git.sh
./setup-docker.sh


echo ""
echo "=========================================="
echo "Development Environment Setup Complete!!!"
echo "=========================================="
