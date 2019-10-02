#!/bin/bash

for i in $(seq 1 2); 
do 
	echo $(curl -i -X GET --url https://boards-api.greenhouse.io/v1/boards/kivaorg/education/schools?page=${i}) | tr "},{" "\n" >> txt.txt; done
