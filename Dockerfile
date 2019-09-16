FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip
RUN pip3 install pyqt5
WORKDIR /plover-pi
COPY ./plover /plover-pi
RUN pip3 install -r requirements.txt
RUN pip3 install -e . -r requirements_plugins.txt
CMD ./launch.sh