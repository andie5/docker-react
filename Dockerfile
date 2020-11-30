FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Communication to user his container needs a port mapped to 8-s
# This doesn't doo anything internally but is useful for elastic beanstalk
EXPOSE 80 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



