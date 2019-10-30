#!/bin/bash

if [ -z $1 ]; then
	dir="./"
else
	dir=$1
fi

IFS=$'\n'

for i in $(ls -al $1); do
	echo $i
done
