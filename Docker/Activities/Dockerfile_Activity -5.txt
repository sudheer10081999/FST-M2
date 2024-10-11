# Specify Base Image
FROM docker.io/node:18-alpine

# Work Directory
WORKDIR /usr/app

#copying the dev files into container
COPY ./ /usr/app

# Install Dependencies
RUN npm install

# Startup Command
CMD ["npm", "start"]