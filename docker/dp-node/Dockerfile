FROM node:lts-alpine

# settings for container startup
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./src/package.json ./src/package-lock.json /app/
RUN npm install
