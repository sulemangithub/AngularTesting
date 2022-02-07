#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#stage 2
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=node /app/dist/angular-testing /usr/share/nginx/html

ENTRYPOINT ["nginx","-g","daemon off;"]

#stage 1
#FROM node:latest as node
#WORKDIR /app
#COPY . .
#RUN npm install
#RUN npm run build --prod
#stage 2
#FROM nginx:alpine
#COPY --from=node /app/dist/ /usr/share/nginx/html