# Use the official Node.js image as a base
FROM node:20.18.0

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and yarn.lock
COPY package*.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install

# Copy the rest of the application code
COPY . .

# Expose the port your app listens on (optional)
EXPOSE 3000

# Command to start the application
CMD ["npm", "start"]

