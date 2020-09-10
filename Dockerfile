# build phase
FROM node:alpine AS build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]
COPY . .
CMD ["npm", "build"]

# run phase
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .
# nginx image executes process by default
