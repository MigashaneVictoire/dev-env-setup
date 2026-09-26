#!/bin/bash

# set -e

echo ""
echo "=========================================="
echo "Development Environment Setup (WSL Ubuntu)"
echo "=========================================="
echo ""
echo "This script will install:"
echo "  1. apt (update/upgrade)"
echo "  2. Visual Studio Code (+ Remote-WSL hookup)"
echo "  3. Python 3"
echo "  4. Git"
echo "  5. Docker"
echo "  6. Miniconda"
echo "  7. Pip Requirements"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

chmod +x setup-apt.sh setup-python.sh setup-anaconda.sh setup-vscode.sh setup-git.sh setup-docker.sh

./setup-apt.sh
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
echo ""
echo "Restart your terminal (or run: source ~/.bashrc) to pick up PATH changes."
