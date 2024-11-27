FROM node:19-bullseye-slim
# Add a new user "john" with user id 8877
RUN useradd -u 8877 demo
# Change to non-root privilege
USER demo
WORKDIR /app

COPY package*.json ./
USER root
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
USER demo

COPY . .


EXPOSE 3000

CMD ["node", "server.js"]