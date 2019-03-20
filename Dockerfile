#Use a Debian Sid to have the python3.7 package
FROM debian:sid-20190228-slim

LABEL maintainer="vahempio@gmail.com" \
	description="Gdbgui with gcc-arm-none-eabi included"

RUN apt-get update && apt-get install -y \
	libncurses5 \
	python3.7-minimal \
	python3-pip \
	wget \
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade setuptools \
    && pip3 install eventlet gevent gevent-websocket \
    && pip3 install 'gdbgui==0.13.1.1'

ADD install_toolchain.sh /tmp/
RUN /tmp/install_toolchain.sh
