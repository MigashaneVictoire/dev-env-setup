#!/bin/bash

echo ""
echo "=========================================="
echo "Docker Setup (WSL)"
echo "=========================================="
echo ""

# The recommended way to get Docker in WSL is Docker Desktop for Windows,
# with WSL integration turned on for this distro - it runs the daemon on
# the Windows side and exposes `docker` inside Ubuntu for free. Running
# Docker Engine natively inside WSL is possible but fights WSL's lack of
# systemd by default, so this mirrors the Mac script's simplicity instead.

if command -v docker &> /dev/null; then
    echo "✓ Docker is already available in WSL!"
    docker --version
    exit 0
fi

echo "Docker was not found in this WSL session."
echo ""
echo "To fix that:"
echo "  1. On Windows, install Docker Desktop: https://www.docker.com/products/docker-desktop/"
echo "  2. Open Docker Desktop -> Settings -> Resources -> WSL Integration"
echo "  3. Enable integration for this distro (Ubuntu)"
echo "  4. Apply & Restart"
echo ""
read -p "Press Enter once you've done this to continue, or Ctrl+C to skip for now..."

if ! command -v docker &> /dev/null; then
    echo "✗ Docker still isn't available. Re-run this script after enabling WSL integration."
    exit 0
fi

echo "✓ Docker Desktop installed successfully"
echo "Docker version:"
docker --version

# --- Alternative: native Docker Engine inside WSL (no Docker Desktop) ---
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER
# (then start the daemon manually each session, since WSL has no systemd
#  by default: sudo service docker start)
