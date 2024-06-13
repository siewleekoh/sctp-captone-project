FROM --platform=linux/amd64 node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN --mount=type=secret,id=NODE_ENV \
   --mount=type=secret,id=MYSQL_HOST \
   --mount=type=secret,id=MYSQL_USERNAME \
   --mount=type=secret,id=MYSQL_PASSWORD \
   --mount=type=secret,id=MYSQL_DATABASE \
   --mount=type=secret,id=MYSQL_PORT \
   --mount=type=secret,id=BACKEND_PORT \
   export API_ENDPOINT=$(cat /run/secrets/NODE_ENV) && \
   export API_PASSWORD=$(cat /run/secrets/MYSQL_HOST) && \
   export API_PASSWORD=$(cat /run/secrets/MYSQL_USERNAME) && \
   export API_PASSWORD=$(cat /run/secrets/MYSQL_PASSWORD) && \
   export API_PASSWORD=$(cat /run/secrets/MYSQL_DATABASE) && \
   export API_PASSWORD=$(cat /run/secrets/MYSQL_PORT) && \
   export API_PASSWORD=$(cat /run/secrets/BACKEND_PORT) && \
   yarn gen

RUN npm install

# If you are building your code for production
# RUN npm ci --omit=dev

COPY . .

EXPOSE 8888
CMD [ "node", "index.js" ]