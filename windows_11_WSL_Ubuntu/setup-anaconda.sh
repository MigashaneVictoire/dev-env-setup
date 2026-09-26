#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Miniconda Installation"
echo "=========================================="
echo ""

if command -v conda &> /dev/null; then
    echo "✓ Miniconda/conda is already installed!"
    conda --version
    exit 0
fi

echo "Installing Miniconda..."
MINICONDA_INSTALLER="$HOME/miniconda_installer.sh"
curl -fsSL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -o "$MINICONDA_INSTALLER"
bash "$MINICONDA_INSTALLER" -b -p "$HOME/miniconda3"
rm -f "$MINICONDA_INSTALLER"
echo "✓ Miniconda installed successfully"
echo ""

# To install the full Anaconda distribution instead of Miniconda:
# curl -fsSL "https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh" -o anaconda_installer.sh
# bash anaconda_installer.sh -b -p "$HOME/anaconda3"

echo "🔧 Initializing conda for bash..."
"$HOME/miniconda3/bin/conda" init bash

# Make conda available in this session too
export PATH="$HOME/miniconda3/bin:$PATH"

echo ""
echo "✓ Installation Complete!"
echo "Installed versions:"
conda --version
echo ""
echo "Note: open a new terminal (or run: source ~/.bashrc) for the 'conda' command to be picked up everywhere."
