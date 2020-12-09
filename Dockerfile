FROM ubuntu:latest
MAINTAINER Ashot Avagyan

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install npm -y
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
# cypress dependencies
RUN apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y

COPY ta_assignment /tmp/ta_assignment
COPY bring_up_and_run_tests.sh /tmp/ta_assignment/bring_up_and_run_tests.sh
RUN chmod +x /tmp/ta_assignment/bring_up_and_run_tests.sh
WORKDIR /tmp/ta_assignment
RUN npm install
RUN npm audit fix
RUN npm start
RUN npm run -s start-api

CMD ./node_modules/cypress/bin/cypress run
