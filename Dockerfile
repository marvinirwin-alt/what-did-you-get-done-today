FROM node:18

RUN apt-get update
RUN apt-get install -y git

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

RUN npm install pm2 -g
RUN npm install --production


COPY .env.example /starter/.env.example
COPY . /starter

# RUN rm -r node_modules/pug-runtime

# RUN git clone https://github.com/marvinirwin/pug-debug-wrap node_modules/pug-runtime

# WORKDIR /starter/node_modules/pug-runtime

RUN npm install

# WORKDIR /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080


