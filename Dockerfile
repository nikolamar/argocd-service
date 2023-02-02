# Build
FROM node:alpine AS build

RUN apk update && apk add libstdc++ && apk add build-base && apk add python3 && apk add bash

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Production
FROM node:alpine AS production

ARG NODE_ENV=production

ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY . .

COPY --from=build /usr/src/app/dist ./dist

CMD ["npm", "run", "start:prod"]
