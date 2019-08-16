#!/bin/bash

rowList=''

while read line
do
	rowList="$rowList $line"
done


double=("${rowList}""${rowList}")

echo $double
