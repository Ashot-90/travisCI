FROM ubuntu:latest
MAINTAINER Ashot Avagyan

ARG TRAVIS_BUILD_DIR

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "AAAAAAAAAAAAAAA PWD is -- $PWD"
RUN echo "AAAAAAAAAAAAAAA TRAVIS_BUILD_DIR is -- $TRAVIS_BUILD_DIR"
RUN echo "AAAAAAAAAAAAAAA ls is -- $(ls)"
RUN apt-get update
RUN apt-get install npm -y
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
# cypress dependencies
RUN apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y

WORKDIR $TRAVIS_BUILD_DIR/ta_assignment
RUN echo "AAAAAAAAAAAAAAA ls is -- $(ls)"
RUN npm install
RUN npm audit fix
RUN pip install $(cat api/requirements.txt | grep -v sqlite3 | tr '\n' ' ')
ENV FLASK_APP=api/app

COPY bring_up_and_run_tests.sh bring_up_and_run_tests.sh
RUN chmod +x ./bring_up_and_run_tests.sh

CMD ./bring_up_and_run_tests.sh
