FROM debian:9.3-slim

LABEL maintainer="vahempio@gmail.com" \
	description="Gdbgui with gcc-arm-none-eabi included"

RUN apt-get update && apt-get install -y \
	python3.5-minimal \
	wget \
	&& rm -rf /var/lib/apt/lists/*

ADD install_toolchain.sh install_gdbgui.sh /tmp/
RUN /tmp/install_toolchain.sh
RUN /tmp/install_gdbgui.sh
