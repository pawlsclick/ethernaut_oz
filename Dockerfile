FROM node:20

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY client/package.json client/yarn.lock ./client/
RUN yarn install --cwd ./client

COPY . .

EXPOSE 3000
EXPOSE 8545

CMD ["yarn", "start"]

