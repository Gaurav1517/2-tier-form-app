FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ENV MONGO_URL="mongodb://mongo:27017/mydatabase"
CMD ["node", "server.js"]
