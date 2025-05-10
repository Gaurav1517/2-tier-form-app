# 2-tier-form-app
2 tier form application

To run your application after installation, you typically follow these steps:

### 1️⃣ Install dependencies:
Since you have `package.json` and `package-lock.json`, your project likely uses Node.js. Run:
```bash
npm install
```
This will install all required dependencies.

### 2️⃣ Ensure MongoDB is running:
```bash
sudo systemctl start mongod
```
Verify it’s active:
```bash
sudo systemctl status mongod
```

### 3️⃣ Run the Node.js application:
If your entry point is `server.js`, use:
```bash
node server.js
```
OR, if using `npm start` (check `package.json` for a `"start"` script):
```bash
npm start
```

### 4️⃣ Verify the application:
Once running, check its output and try accessing it via its expected port (e.g., `http://localhost:3000`).

To use MongoDB with `mongosh`, follow these steps:

### 1️⃣ Start MongoDB Shell (`mongosh`)
```bash
mongosh
```
If you installed MongoDB correctly, this should start the MongoDB shell.

### 2️⃣ Show available databases
```bash
show databases;
```
This will list all databases in your MongoDB instance.

### 3️⃣ Select (or create) a database
```bash
use mydatabase;
```
If `mydatabase` doesn't exist, MongoDB will create it once you insert data.

### 4️⃣ Show collections inside the selected database
```bash
show collections;
```
Lists all collections (tables) inside the database.

### 5️⃣ Query data in a collection
```bash
db.mycollection.find().pretty();
```

## Dockerfile to containerize your Node.js application with MongoDB:

```dockerfile
# Use official Node.js image 
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Expose the port the application runs on
EXPOSE 3000

# Set environment variables for MongoDB
ENV MONGO_URL="mongodb://mongo:27017/mydatabase"

# Start the application
CMD ["node", "server.js"]
```

### **Docker Compose (optional)**
If your app depends on MongoDB, consider using `docker-compose.yml` to manage services:

```yaml
version: "3"
services:
  app:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - mongo
    environment:
      MONGO_URL: "mongodb://mongo:27017/mydatabase"

  mongo:
    image: mongo:8.0
    restart: always
    ports:
      - "27017:27017"
```

### **Steps to Build & Run**
1️⃣ Build the image:
```bash
docker build -t my-node-app .
```

2️⃣ Run the container:
```bash
docker run -p 3000:3000 --name myapp my-node-app
```

OR use **Docker Compose**:
```bash
docker-compose up -d
```

This setup ensures your Node.js app connects to MongoDB inside a Docker network. Let me know if you need tweaks! 🚀

