#!/bin/sh
# digits - read from std input then write to std output wit all digit characters of 5 to < and all digit characters greater than 5 to > 

while read x
do
    echo $x | tr '0-4' '<' | tr '6-9' '>'
done

