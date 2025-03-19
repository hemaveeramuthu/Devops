# Use lightweight Node.js Alpine image
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy remaining application files
COPY . .

# Set permissions (if needed)
RUN chmod -R 777 /app

# Expose application port
EXPOSE 3000

# Start application
CMD ["npm", "start"]
