#! /bin/bash 

# $1 : github username
# $2 : image resize (x scale)
# $3 : geometry X
# $4 : geometry Y
# $5 : background image file name

#http://ghchart.rshah.org/2016rshah
#wget "http://ghchart.rshah.org/$1" -O download.png 

wget "https://grass-graph.moshimo.works/images/$1.png?background=none" -O download.png 

convert -resize "$2" download.png ./output.png

composite -geometry +$3+$4 output.png $5 out.jpg

gsettings set org.gnome.desktop.background picture-uri file:///home/pjs/wallpaper_test/out.jpg

