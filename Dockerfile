FROM node:6.9
# replace this with your application's default port
EXPOSE 3000

WORKDIR /opt/app/NodeNewRelicDemo

RUN npm install

CMD ['npm','run','start']