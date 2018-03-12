#!/bin/sh

TOOLCHAIN_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2"
TOOLCHAIN_FILE="gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2"
TOOLCHAIN_MD5="d3b00ae09e847747ef11316a8b04989a"

wget -nv -O $TOOLCHAIN_FILE $TOOLCHAIN_URL

MD5=$(md5sum $TOOLCHAIN_FILE | cut -d' ' -f1)
if [ $TOOLCHAIN_MD5 != $MD5 ]
then
	echo "MD5 check error!"
	exit 1
fi

tar -xf $TOOLCHAIN_FILE -C /opt/
ln -s /opt/gcc-arm-none-eabi-7-2017-q4-major/bin/arm-none-eabi-gdb /opt/arm-gdb

rm $TOOLCHAIN_FILE
