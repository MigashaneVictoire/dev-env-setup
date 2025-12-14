#!/bin/bash

echo ""
echo "=========================================="
echo "Docker Desktop Installation"
echo "=========================================="
echo ""

echo "Installing docker desktop..."
brew install --cask docker-desktop
echo "✓ Docker desktop installed successfully"
echo "Docker version:"
docker --version