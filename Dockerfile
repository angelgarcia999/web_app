FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json ./

COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app/server.js ./server.js

EXPOSE 80

CMD ["node", "server.js"]