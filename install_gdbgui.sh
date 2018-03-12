#!/bin/sh

GDBGUI_URL="https://gdbgui.com/downloads/linux/gdbgui_0.11.1.2"
GDBGUI_FILE="gdbgui"
GDBGUI_MD5="13eb2ccdbadd637c8d7f4bbbaa263047"

wget -nv -O $GDBGUI_FILE $GDBGUI_URL

MD5=$(md5sum $GDBGUI_FILE | cut -d' ' -f1)
if [ $GDBGUI_MD5 != $MD5 ]
then
	echo "MD5 check error!"
	exit 1
fi
chmod +x $GDBGUI_FILE 
