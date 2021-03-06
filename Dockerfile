`FROM node:14

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app```

COPY package.json ./

USER node

RUN yarn

COPY --chown=node:node . .

COPY . ./

RUN yarn build

EXPOSE 3000

CMD [ "cd", "build/src", "&&", "node", "app.js" ]
