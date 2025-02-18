# Use an official Node.js image as the base image.
FROM node:18-alpine

# Set the working directory in the container.
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker caching.
COPY package*.json ./

# Install dependencies.
RUN npm ci --only=production

# Copy the rest of your application files.
COPY . .

# Expose the port your application listens on.
EXPOSE 3000

# Set the default environment variable.
ENV NODE_ENV=production

# Start the application.
CMD ["node", "index.js"]

