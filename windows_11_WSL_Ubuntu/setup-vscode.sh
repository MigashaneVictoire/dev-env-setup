#!/bin/bash

set -e

echo ""
echo "=========================================="
echo "Visual Studio Code Setup (WSL)"
echo "=========================================="
echo ""

# On WSL, VS Code itself is NOT installed inside Linux - it stays a normal
# Windows app, and the "Remote - WSL" extension is what lets it edit files
# that live inside Ubuntu. Once that extension is installed, VS Code
# automatically adds a `code` shim to your WSL PATH.

if command -v code &> /dev/null; then
    echo "✓ 'code' command is already available in WSL."
else
    echo "'code' was not found in this WSL session."
    echo ""
    echo "To fix that:"
    echo "  1. On Windows, install VS Code: https://code.visualstudio.com/"
    echo "  2. Open VS Code and install the 'Remote - WSL' extension"
    echo "     (Extensions panel -> search 'WSL' -> ms-vscode-remote.remote-wsl)"
    echo "  3. Close and reopen this WSL terminal"
    echo ""
    read -p "Press Enter once you've done this to continue, or Ctrl+C to skip for now..."

    if ! command -v code &> /dev/null; then
        echo "✗ 'code' still isn't available. Skipping the extension/settings steps."
        echo "  Re-run this script after installing VS Code + Remote-WSL."
        exit 0
    fi
fi

echo ""
echo "VS Code version:"
code --version

echo ""
echo "Installing python extension for VS Code..."
code --install-extension ms-python.python

# VS Code's User settings.json lives on the Windows side (it's a Windows
# app), even when you're editing WSL files through it. Find the Windows
# user profile so we can drop settings.json in the right place.
echo "Locating your Windows user profile..."
WIN_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r\n')

if [ -z "$WIN_USER" ]; then
    echo "✗ Could not determine your Windows username automatically."
    echo "  Copy vscode-settings.json to your VS Code User folder manually:"
    echo "  %APPDATA%\\Code\\User\\settings.json"
    exit 0
fi

VSCODE_USER_DIR="/mnt/c/Users/$WIN_USER/AppData/Roaming/Code/User"
echo "Setting VS Code settings for Windows user '$WIN_USER'..."
mkdir -p "$VSCODE_USER_DIR"
cp vscode-settings.json "$VSCODE_USER_DIR/settings.json"
echo "✓ VS Code settings configured successfully!"
