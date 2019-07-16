#!/bin/bash

while read line
do
	echo $line | cut -b -4
done
	
