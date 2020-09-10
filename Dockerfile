# builder phase
FROM node:alpine AS builder
WORKDIR /app/
COPY package.json .
RUN ["npm", "install"]
COPY . .
CMD ["npm", "run", "build"]

# run phase
FROM nginx:latest
WORKDIR /usr/share/nginx/html/
COPY --from=builder /app/build/ .
# nginx image executes process by default
