#!/bin/bash

#avoid name collision- 
# for example, will only hanld up to 9-
# same name creations.
#
#EDIT: turned this into a self destructing child script

cc=0

filename=${1:-Default}

avoid_collision () {

if [ $(ls -l | grep $filename | wc -l) -ne 0 ]; then
echo ${filename:(-3)}
	if [ ${filename:(-3)} == "($cc)" ]; then
echo $filename 1AND $cc
		cc=$[ $cc+1 ]
		filename=${filename::-3}'('$cc')'
		avoid_collision
	else
echo $filename 2AND $cc
		filename=$filename'('$cc')'
		avoid_collision
	fi
else
	unique_name=$filename	
fi
}

avoid_collision

cat > $unique_name <<dojo

echo GoodBye

rm "$unique_name" 2>/dev/null
echo sone
echo bainer
dojo

chmod +x $unique_name


#was playing around with the idea of putting current dir in PATH
# + which works well, though sourcing still needs some troubleshooting 
#echo 'export PATH="$PATH'":$(pwd)\"" >> ~/.bashrc
#$(source ~/.bashrc)
#sed -i '' -e '$ d' ~/.bashrc

./$unique_name

