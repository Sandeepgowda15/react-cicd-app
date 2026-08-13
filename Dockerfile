FROM node:20 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

<<<<<<< HEAD

FROM nginx:alpine
=======
FROM nginx:latest
>>>>>>> e7cd0ea (Test AWS CI/CD deployment)

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

<<<<<<< HEAD
CMD ["nginx", "-g", "daemon off;"]
=======
CMD ["nginx","-g","daemon off;"]
>>>>>>> e7cd0ea (Test AWS CI/CD deployment)
