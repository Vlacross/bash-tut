#!/bin/bash

param=$1
param2=$2

while read line
do
	echo ${line[@]/*[$param$param2]*/} | sed '/^$/d'
done

