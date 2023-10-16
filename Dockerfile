# Stage 1: Build the app
FROM node:18 AS builder

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the app (adjust your build command accordingly)
RUN npm run build

# Set the environment variable to production
ENV NODE_ENV=production

# Expose port 80 (default for HTTP)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
