#!/bin/bash

user=$(whoami)
input=/home/$user/Documents
output=/tmp/${user}_docs_$(date +%Y-%m-%d+%H%M%S).tar.gz

tar -czf $output $input 2> /dev/null

echo "Backup of $input completed! Details about the output file:"
ls -l $output

