FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip
WORKDIR /plover-pi
COPY ~/plover /plover-pi
RUN pip3 install -r requirements.txt
RUN pip3 install -e . -r requirements_plugins.txt
ADD launch.sh /
CMD ./launch.sh