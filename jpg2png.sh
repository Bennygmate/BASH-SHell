#!/bin/sh
#set -x

for jpg_filename in *.jpg
do
    sed 's/.png//' $jpg_filename
    echo "$jpg_filename"
done
