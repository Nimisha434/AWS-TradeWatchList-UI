FROM node:18-alpine

WORKDIR /app
EXPOSE 3001

COPY package*.json ./

# make node modules folder
RUN mkdir -p /app/node_modules

# recursive ownership for user node on all files in app
RUN chown -R node:node /app

# install node modules
RUN rm -Rf node_modules && rm package-lock.json
RUN npm cache clean --force
RUN npm install --force
RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache

COPY . .

CMD [ "npm", "start"]

# run as user node
USER node
