#!/bin/sh

TOOLCHAIN_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2"
TOOLCHAIN_FILE="gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2"
TOOLCHAIN_MD5="f55f90d483ddb3bcf4dae5882c2094cd"

wget -nv -O $TOOLCHAIN_FILE $TOOLCHAIN_URL

MD5=$(md5sum $TOOLCHAIN_FILE | cut -d' ' -f1)
if [ $TOOLCHAIN_MD5 != $MD5 ]
then
	echo "MD5 check error!"
	exit 1
fi

tar -xf $TOOLCHAIN_FILE -C /opt/
ln -s /opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gdb /opt/arm-gdb

rm $TOOLCHAIN_FILE
