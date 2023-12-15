FROM node:18-alpine

WORKDIR /app
EXPOSE 3001

COPY package*.json ./

# make node modules folder
RUN mkdir -p /app/node_modules

# recursive ownership for user node on all files in app
RUN chown -R node:node /app

# install node modules
RUN npm install

COPY . .

CMD [ "npm", "start"]

# run as user node
USER node