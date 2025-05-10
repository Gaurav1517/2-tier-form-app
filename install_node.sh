#!/bin/bash

# Step 1: Install FNM
echo "Installing FNM (Fast Node Manager)..."
curl -fsSL https://fnm.vercel.app/install | bash

# Step 2: Load FNM into current shell (adjust if using zsh/fish)
export PATH="$HOME/.fnm" && eval "$(fnm env)"

# Step 3: Install Node.js v22
echo "Installing Node.js v22..."
fnm install 22
fnm use 22
fnm default 22

# Step 4: Verify Node.js and npm
echo " Node version: $(node -v)"
echo "npm version: $(npm -v)"
