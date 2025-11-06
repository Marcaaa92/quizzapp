FROM node AS build
WORKDIR /app
COPY package*.json .

RUN npm cache clean --force && npm ci --legacy-peer-deps
RUN npm i yargs --legacy-peer-deps

COPY . .

RUN chmod +x ./node_modules/.bin/ng


RUN npm run build -- --configuration=production-server

FROM nginx:alpine
COPY --from=build app/nginx.frontend.conf /etc/nginx/conf.d/default.conf
COPY --from=build app/dist/quizzapp usr/share/nginx/html
