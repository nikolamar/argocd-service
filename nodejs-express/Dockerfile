# syntax=docker/dockerfile:1

# Dependencies
FROM node:18-alpine AS deps
LABEL "maintainer"="Nikola Marjanovic  <nikolamar@gmail.com>"

WORKDIR /app

COPY package.json package-lock.json ./
RUN  npm install --production

# Builder
FROM node:18-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

# Runner
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 express

COPY --from=builder --chown=express:nodejs /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

USER express

EXPOSE 3000

ENV PORT 3000

CMD ["npm", "run", "start:prod"]
