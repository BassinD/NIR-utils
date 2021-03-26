FROM node:lts-alpine3.13

# создание директории приложения
WORKDIR /usr/src/app

# установка зависимостей
# символ астериск ("*") используется для того чтобы по возможности 
# скопировать оба файла: package.json и package-lock.json
COPY ./nodejs_game/package*.json ./

# RUN npm install
# Если вы создаете сборку для продакшн
RUN npm ci --only=production

# Установка curl для healthcheck
RUN apt-get update && apt-get install -y ca-certificates curl

# копируем исходный код
COPY ./nodejs_game .

EXPOSE 8080
CMD [ "npm", "run", "start" ]
