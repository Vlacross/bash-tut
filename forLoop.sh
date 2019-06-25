#!/bin/bash

if [ -z $1 ]; then
	echo "Requires a file to read character count of each line!"
fi

for i in $( cat $1 ); do
	echo -n $i | wc -c
done
