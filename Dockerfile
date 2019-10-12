FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#need for elasticbeanstalk to map incoming traffic into contrainer
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
