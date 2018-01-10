#! /bin/bash 

# $1 : github username
# $2 : image resize (x scale)
# $3 : geometry X
# $4 : geometry Y
# $5 : background image file name


#--------Permission Check-------------------

ROOT_UID=0
E_NOTROOT=67
 
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Script have to execute on ROOT mode"
	exit $E_NOTROOT
fi

#-------------------------------------------

#--------Argument Check---------------------

ARGUMENT_ERROR=68

if [ $# -ne 5 ]
then
	echo Cur input count : $#
	echo "Usage : ./script.sh [Github Username] [x-scale] [geo X] [geo Y] [Background Filename]"
	exit $ARGUMENT_ERROR
fi

#-------------------------------------------


#http://ghchart.rshah.org/2016rshah
#wget "http://ghchart.rshah.org/$1" -O download.png 

CMD_EXE_ROOR=69




wget "https://grass-graph.moshimo.works/images/$1.png?background=none" -O download.png 

if [ $? -ne 0 ]
then
	echo "GITHUB USER INFORMATION DOWNLOAD ERROR"
	exit $CMD_EXE_ERROR
fi




convert -resize "$2" download.png ./output.png

if [ $? -ne 0 ]
then
	echo "RESIZE ERROR"
	exit $CMD_EXE_ERROR
fi




composite -geometry +$3+$4 output.png $5 out.jpg

if [ $? -ne 0 ]
then
	echo "USER INFO - BACKGROUND IMAGE COMPOSITE ERROR"
	exit $CMD_EXE_ERROR
fi



gsettings set org.gnome.desktop.background picture-uri file://./out.jpg

if [ $? -ne 0 ]
then
	echo "BACKGROUND IMAGE SETTING ERROR"
	exit $CMD_EXE_ERROR
fi

