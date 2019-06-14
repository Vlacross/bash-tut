#!/bin/bash

user=$(whoami)
input=/home/$user/Documents
output=/tmp/${user}_docs_$(date +%Y-%m-%d+%H%M%S).tar.gz

function total_files {
	find $1 -type f | wc -l
}

function total_directories {
	find $1 -type d | wc -l
}

tar -czf $output $input 2> /dev/null

echo -n "Number of files to be included:"
total_files $input

echo -n "Number of directories to be included:"
total_directories $input


echo "Backup of $input completed!"
echo " Details about the output file:"
ls -l $output

