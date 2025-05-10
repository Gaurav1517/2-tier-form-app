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
This fetches all documents in the `mycollection` collection and formats them for readability.

Let me know if you need further guidance! 🚀

