FROM node:10 AS ui-build
WORKDIR /usr/src/app
COPY web-app/ ./web-app/
RUN cd web-app && npm install


FROM nginx:alpine

#!/bin/sh

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
#RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
#COPY --from=ui-build /usr/src/app/my-app/build/ /usr/share/nginx/html

EXPOSE 3500 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["node", "app.js"]