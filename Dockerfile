FROM ubuntu:latest
MAINTAINER Ashot Avagyan

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install git -y
RUN apt-get install npm -y
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
# cypress dependencies
RUN apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y

WORKDIR /tmp
RUN git clone https://github.com/busy-fox/ta_assignment.git
WORKDIR /tmp/ta_assignment
RUN npm install
RUN npm audit fix
RUN pip install $(cat api/requirements.txt | grep -v sqlite3 | tr '\n' ' ')
ENV FLASK_APP=api/app

COPY bring_up_and_run_tests.sh bring_up_and_run_tests.sh
RUN chmod +x ./bring_up_and_run_tests.sh

CMD ./bring_up_and_run_tests.sh
