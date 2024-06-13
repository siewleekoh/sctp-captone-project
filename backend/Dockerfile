FROM --platform=linux/amd64 node:18-alpine

ARG NODE_ENV
ARG MYSQL_HOST
ARG MYSQL_USERNAME
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_PORT
ARG BACKEND_PORT

WORKDIR /app

COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

COPY . .

EXPOSE 8888
CMD [ "node", "index.js" ]