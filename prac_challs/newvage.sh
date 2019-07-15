#!/bin/bash

total=0
args=0
first='true'

while read -r line
  do
    if [ $first = "true" ]; then
	echo "first is true"
	first='false'
	args=$line
    else
	total=$[ $total+$line ]
    fi
  done

#avg=$[ $total/$args ]
avg=$(bc <<< "scale=6; $total/$args")

echo "total is $total | args is $args"

printf %.3f $avg
