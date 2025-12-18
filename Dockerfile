FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build:production

FROM node:20-alpine

WORKDIR /app
COPY --from=builder /app/_site .

RUN npm install -g http-server

EXPOSE 3000

CMD ["http-server", "-p", "3000", "-c-1"]
