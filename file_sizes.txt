#!/bin/sh
#splits files into 3 categories small, medium-sized and large
# small < 10, medium < 100, large is rest 
#set -x

echo -n "Small files:"
for small_file in *
do
    file_lines=`wc -l < $small_file`
    if test "$file_lines" -lt "10"
    then
        echo -n -e " $small_file"
    fi
done

echo -n -e " \nMedium-sized files:"
for med_file in *
do
    file_lines=`wc -l < $med_file`
    if test "$file_lines" -ge "10" -a "$file_lines" -lt "100"
    then
        echo -n " $med_file"
    fi
done

echo -n -e "\nLarge files:"
for large_file in *
do
    #do something on file
    file_lines=`wc -l < $large_file`
    if test "$file_lines" -ge "100"
    then
        echo -n " $large_file"
    fi
done  
echo -n -e "\n"


