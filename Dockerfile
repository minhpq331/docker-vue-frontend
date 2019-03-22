##### DOCKERFILE FOR SSR ######

# FROM node:alpine

# EXPOSE 3000
# WORKDIR /app

# ADD src/package.json src/yarn.lock /app/
# RUN yarn --pure-lockfile

# ADD ./src /app

# RUN yarn build

# CMD ["yarn", "start"]

##### END DOCKERFILE FOR SSR #####

##### DOCKERFILE FOR SPA ######

##### builder image #####
FROM node:alpine AS builder

EXPOSE 3000
WORKDIR /app

ADD src/package.json src/yarn.lock /app/
RUN yarn --pure-lockfile

ADD ./src /app

RUN yarn build
##### end builder image #####

##### runtime image #####
FROM nginx:stable-alpine

COPY ./start.sh /
COPY config/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist /usr/share/nginx/html

CMD ["/start.sh"]
##### end runtime image #####

##### END DOCKERFILE FOR SPA #####
