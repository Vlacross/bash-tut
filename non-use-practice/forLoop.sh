#!/bin/bash

if [ -z $1 ]; then
	echo "Requires a file to read character count of each line!"
	exit
fi

IFS=$'\n'

for i in $( cat $1 ); do
	echo $i "has" $( echo $i | wc -c ) "letters."
done
