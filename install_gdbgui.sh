#!/bin/sh

GDBGUI_URL="https://gdbgui.com/downloads/linux/gdbgui_0.12.0.0"
GDBGUI_FILE="gdbgui"
GDBGUI_MD5="4433beb6d89b94345f6890d98d0b2de4"

wget -nv -O $GDBGUI_FILE $GDBGUI_URL

MD5=$(md5sum $GDBGUI_FILE | cut -d' ' -f1)
if [ $GDBGUI_MD5 != $MD5 ]
then
	echo "MD5 check error!"
	exit 1
fi
chmod +x $GDBGUI_FILE 
