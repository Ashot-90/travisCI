FROM cypress/browsers:node12.16.2-chrome81-ff75
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

CMD ./bring_up_and_run_tests.sh
