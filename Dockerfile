#
# docker build . -t espressif:1
# docker run --rm -i -t espressif:1 bash
# docker run -t --rm -v /Users/gsc/documents/github/espressif-lab:/opt/espressif-lab espressif:1 bash
# docker run -t --rm -v /Users/gsc/documents/github:/opt/github espressif:1 bash
# docker run -t --rm -v /Users/gsc/documents/github/espressif-lab:/espressif-lab espressif:1 bash
#
FROM ubuntu:22.10
#
LABEL build_date="2023-05-30"
LABEL description="espressif development environment"
LABEL maintainer="guycole@gmail.com"
#
RUN apt-get update && apt-get -y upgrade
RUN apt install build-essential -y
#
RUN apt-get install git wget flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 -y 
#
RUN git clone https://github.com/espressif/esp-idf.git
#
WORKDIR esp-idf 
RUN ./install.sh
#
RUN mkdir /espressif-lab
#