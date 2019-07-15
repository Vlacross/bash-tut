#!/bin/bash

total=0

for i in $@
do
	echo $i
	let total=$total+$i
done

avg=$[ $total/$# ]

echo $avg
