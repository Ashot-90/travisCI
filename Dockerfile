FROM cypress/browsers:node14.15.0-chrome86-ff82
MAINTAINER Ashot Avagyan

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 install flask

COPY ta_assignment /tmp/ta_assignment
WORKDIR /tmp/ta_assignment
COPY bring_up_and_run_tests.sh bring_up_and_run_tests.sh
RUN chmod +x ./bring_up_and_run_tests.sh

cd /tmp/ta_assignment
RUN npm install
RUN npm audit fix
RUN npm run -s start-api &
RUN npm start &

CMD $(npm bin)/cypress run
