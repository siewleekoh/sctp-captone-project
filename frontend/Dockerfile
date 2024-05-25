#FROM --platform=linux/amd64 node:18-alpine
#
## Set the working directory
#WORKDIR /app
#
## Copy package.json and package-lock.json
#COPY package*.json ./
#
## Install dependencies
#RUN npm install
#
## Copy the rest of the application
#COPY . .
#
## Expose the port
#EXPOSE 8080
#
## Define the command to run the application
#CMD [ "npm", "run", "serve" ]

#
###############################
# ### STAGE 1: Build ###
# FROM --platform=linux/amd64 node:18 as build
#
# # Create app directory
# WORKDIR /app
#
# # Install app dependencies
# # A wildcard is used to ensure both package.json AND package-lock.json are copied
# # where available (npm@5+)
# COPY package*.json ./
# RUN npm install
#
# # Bundle app source
# COPY . .
#
#
# RUN npm run build
#
# ###STAGE 2: Run ###
# FROM --platform=linux/amd64 nginx:alpine
# RUN rm -rf /usr/share/nginx/html/* && rm -rf /etc/nginx/conf.d/default.conf && rm -rf /etc/nginx/nginx.conf
# COPY nginx.conf /etc/nginx
# COPY --from=build /app/dist/angular-frontend /usr/share/nginx/html
#
# #Optional to mention expose as it will be taken by nginx sever , port 80 wil be taken from nginx server
# EXPOSE 80
#
# ##############################
#


FROM --platform=linux/amd64 node:18 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM --platform=linux/amd64 nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /usr/share/nginx/html
RUN chmod 0755 /usr/share/nginx/html && chmod 0644 -R /usr/share/nginx/html/*
RUN find /usr/share/nginx/html -type d -exec chmod 0755 {} \;
# COPY nginx.conf /etc/nginx/nginx.conf

COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf

#EXPOSE 8080
#ENTRYPOINT ["nginx", "-g", "daemon off;"]