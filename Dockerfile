FROM node:6.9
# replace this with your application's default port
EXPOSE 3000

RUN mkdir /opt/app
RUN mkdir /opt/app/NodeNewRelicDemo
WORKDIR /opt/app/NodeNewRelicDemo


COPY . /opt/app/NodeNewRelicDemo

WORKDIR /opt/app/DropWizardExample
RUN apt-get -qq update
RUN apt-get -qq -y  install curl
RUN curl -s https://download.dataloop.io/pubkey.gpg | apt-key add -
#RUN apt-get -y  install ca-certificates
#RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates -y
RUN echo 'deb https://download.dataloop.io/deb/ stable main' > /etc/apt/sources.list.d/dataloop.list

RUN apt-get update && apt-get install dataloop-agent -y
RUN npm install
COPY agent.yaml /etc/dataloop/agent.yaml
CMD service dataloop-agent start && npm run start