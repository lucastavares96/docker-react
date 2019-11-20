FROM node:alpine AS builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/app
COPY --from=builder /usr/app/build /usr/share/nginx/html