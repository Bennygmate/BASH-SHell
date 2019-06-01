#!/bin/sh
# Takes in 2 inputs, a string and an integer 'n'
#prints out the string 'n' number of times 
start=0

if [[ $# -ne 2 ]]
then
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit 1
elif [[ $1 < 0 || $1 != [0-9]* ]] 
then
	echo './echon.sh: argument 1 must be a non-negative integer'
	exit 1
else
while [[ $start != $1 ]]; 
do
	echo $2
	start=$((start+1))
done
fi




