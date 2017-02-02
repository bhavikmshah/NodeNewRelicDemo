FROM node:6.9
# replace this with your application's default port
EXPOSE 3000

RUN mkdir /opt/app
RUN mkdir /opt/app/NodeNewRelicDemo
WORKDIR /opt/app/NodeNewRelicDemo

COPY /opt/app/NodeNewRelicDemo /opt/app/NodeNewRelicDemo

CMD ['npm','run','start']