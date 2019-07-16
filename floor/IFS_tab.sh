#!/bin/bash

while read listing 
do
	echo $listing | cut -d'	' -c 2  
done

