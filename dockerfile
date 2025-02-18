FROM node:18-bookworm

WORKDIR /app

# Install dependencies first for caching
COPY package.json package-lock.json ./
RUN npm ci --only=production --no-audit --no-fund

# Copy app files
COPY . .

# Create non-root user and set permissions
RUN chown -R node:node /app
USER node

EXPOSE 8080
CMD ["npm", "start"]
