FROM node:alpine AS Build

WORKDIR /app
COPY package.json /app
RUN npm install 

FROM node:alpine 
WORKDIR /app
COPY --from=Build /app/node_modules /app/node_modules
COPY . /app
EXPOSE 3000
CMD ["node","index.js"]
