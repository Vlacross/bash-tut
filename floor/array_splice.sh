#!/bin/bash

while read -r line
do
	arr+=("$line ")  
done

declare -a arr

echo ${#arr[@]}

echo ${arr[@]:3:5}


