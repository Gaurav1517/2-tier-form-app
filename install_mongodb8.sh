#!/bin/bash

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

# Step 3: Enable and start MongoDB
echo "Enabling and starting MongoDB..."
sudo systemctl enable mongod
sudo systemctl start mongod

# Step 4: Check MongoDB status
echo "MongoDB service status:"
sudo systemctl status mongod --no-pager
