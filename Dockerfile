FROM ubuntu:latest
RUN sudo apt-get update
RUN sudo apt-get install -y python3 python3-dev python3-pip nginx
WORKDIR /plover-pi
COPY ./plover /plover-pi
RUN sudo pip3 install --user -r requirements.txt
RUN sudo pip3 install --user -e . -r requirements_plugins.txt
CMD sudo ./launch.sh