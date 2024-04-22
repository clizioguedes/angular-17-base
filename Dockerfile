FROM node:20.12.2-alpine as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install --silent
COPY . .
RUN npm run build

FROM nginx:stable-alpine3.17-slim
COPY ./load_environment_variables.sh /docker-entrypoint.d/load_environment_variables.sh
RUN chmod +x /docker-entrypoint.d/load_environment_variables.sh
COPY --from=build /usr/src/app/dist/angular-base/browser /usr/share/nginx/html
COPY /nginx/default.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80