FROM node:10 AS ui-build
WORKDIR /usr/src/app
COPY web-app/ ./web-app/

RUN cd web-app && npm install

CMD ["node", "app.js"]