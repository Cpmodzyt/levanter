# Use the official Node.js image as a base
FROM node:20.18.0

# Set the working directory inside the container
WORKDIR /usr/src/app

# Clone the GitHub repository
RUN git clone https://github.com/cpmodzyt/levanter.git .

# Specify the platform as VPS
ENV PLATFORM VPS

# Copy package.json and yarn.lock from the repository
COPY package*.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install

# Expose the port your app listens on (optional)
EXPOSE 3000

# Command to start the application
CMD ["npm", "start"]
