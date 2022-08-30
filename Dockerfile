FROM node:alpine as teamab7
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=teamab7 /var/app/build /var/share/nginx/html