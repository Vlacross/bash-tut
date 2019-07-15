#!/bin/bash

total=0
args=0

while read -r line
do
	total=$[ $total+$line ]
	args=$[ $args+1 ]
done

average=$[ $total/$args ]

echo "total is $total"

echo "the average is $average with $args arguments"

printf %.3f $average
