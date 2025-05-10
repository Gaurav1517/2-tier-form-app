#!/bin/bash

set -e  # Exit on any error

# Step 1: Install FNM (Fast Node Manager)
echo "Installing FNM (Fast Node Manager)..."
curl -fsSL https://fnm.vercel.app/install | bash

# Ensure FNM is available in the current session
export PATH="$HOME/.local/share/fnm/bin:$PATH"
eval "$(fnm env)"

# Step 2: Install core utilities
echo "Installing core utilities..."
sudo yum install -y grep coreutils

# Verify that essential tools exist
for cmd in grep cat tr curl; do
    if ! command -v $cmd &>/dev/null; then
        echo "Error: $cmd not found. Please install it manually."
        exit 1
    fi
done

# Step 3: Install Node.js v22
echo "Installing Node.js v22..."
fnm install 22
fnm use 22

# Step 4: Ensure Node.js was installed correctly
if ! command -v node &>/dev/null; then
    echo "Error: Node.js installation failed."
    exit 1
fi

# Step 5: Add FNM to bash profile
echo "Adding fnm setup to ~/.bashrc..."
echo -e "\n# FNM configuration\nexport PATH=\"$HOME/.local/share/fnm/bin:\$PATH\"\neval \"\$(fnm env)\"" >> ~/.bashrc

# Step 6: Reload shell environment
echo "Reloading shell environment..."
source ~/.bashrc

# Step 7: Verify Node.js and npm installation
echo "Verifying installation..."
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

if ! command -v npm &>/dev/null; then
    echo "Error: npm installation failed."
    exit 1
fi

echo "✅ Node.js and npm are installed successfully."
