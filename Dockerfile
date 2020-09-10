# builder phase
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]
COPY . .
CMD ["npm", "run", "build"]

# run phase
FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
# nginx image executes process by default
