FROM node:17-alpine as builder
WORKDIR /app/frontend
COPY ./package.json ./
COPY package-lock.json ./ 
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000 
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/frontend/build  /usr/share/nginx/html