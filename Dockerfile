# Use an official Node.js runtime as a parent image
FROM node:20.15.0-alpine

# Create the application directory
RUN mkdir -p /home/node/app

# Set the working directory
WORKDIR /home/node/app

# Copy package.json and package-lock.json (if available)
COPY package.json ./

# Install app dependencies
# Ensures that native modules are built inside the container
RUN npm install --production

# Copy the application code
COPY --chown=node:node . .

# Set user to avoid running as root
USER node

# Expose the application port
EXPOSE 1200

# Command to run the application
CMD ["npm", "start"]

