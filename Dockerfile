FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# folder: /app/build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#copy only from the builder phase, folder is the /app/build



