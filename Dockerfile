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

# Stage 2: Create a smaller production image
#FROM nginx:alpine

# Set the environment variable to production
ENV NODE_ENV=production

# Copy the built app from the previous stage
#COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 (default for HTTP)
EXPOSE 3000

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]

# Start the app
CMD ["npm", "start"]
