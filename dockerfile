# Example Dockerfile for a Node.js app
FROM node:16
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]  # <-- Ensure your app starts on PORT 8080
