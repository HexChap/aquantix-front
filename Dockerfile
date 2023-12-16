FROM node:21.0.0 as build
WORKDIR /aquantix-front

COPY package*.json .
RUN npm install
COPY . .

RUN npm run build
FROM nginx:latest
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /aquantix-front/build /usr/share/nginx/html
