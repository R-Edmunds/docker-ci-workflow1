# build phase
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]
COPY . .
RUN ["npm", "run", "build"]

# run phase
FROM nginx:latest
# EXPOSE required for AWS build
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY --from=0 /app/build .
# nginx image executes process by default
