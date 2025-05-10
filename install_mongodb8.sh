#!/bin/bash

set -e  # Exit on any error

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Try using sudo."
    exit 1
fi

# Check if yum is available
if ! command -v yum &> /dev/null; then
    echo "Error: yum package manager not found."
    exit 1
fi

# Step 1: Create the MongoDB 8.0 repository file
echo "Creating MongoDB YUM repo at /etc/yum.repos.d/mongodb-org-8.0.repo..."
sudo tee /etc/yum.repos.d/mongodb-org-8.0.repo > /dev/null <<EOF
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
EOF

# Step 2: Install MongoDB
echo "Installing MongoDB 8.0..."
sudo yum install -y mongodb-org

# Verify MongoDB installation
if ! rpm -q mongodb-org &> /dev/null; then
    echo "Error: MongoDB installation failed."
    exit 1
fi

# Step 3: Enable and start MongoDB
echo "Enabling and starting MongoDB..."
sudo systemctl enable mongod
sudo systemctl start mongod

# Verify MongoDB startup
if ! systemctl is-active --quiet mongod; then
    echo "Error: MongoDB failed to start."
    exit 1
fi

# Step 4: Check MongoDB status
echo "MongoDB service status:"
sudo systemctl status mongod --no-pager

echo "✅ MongoDB 8.0 installation completed successfully!"
