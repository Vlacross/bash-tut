#!/bin/bash

function backup {

echo "in Backup Function!"
	if [ -z $1 ]; then
	  user=$(whoami)
	else
	  if [ ! -d "/home/$1" ]; then
		echo "Requested $1 user home directory doesn't exit."
		exit 1
	  fi
	  user=$1
	fi

	input=/home/$user/Documents
	output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

	function total_files {
	  find $1 -type f | wc -l
	}

	function total_directories {
	  find $1 -type f | wc -l
	}

	function total_archived_files {
	  tar -tzf $1 | grep -v /$ | wc -l
	}

	function total_archived_directories {
	  tar -tzf $1 | grep /$ | wc -l
	}

	tar -czf $output $input 2> /dev/null

	src_files=$( total_files $input )
	src_directories=$( total_directories $input )

	arch_files=$( total_archived_files $output )
	arch_directories=$( total_archived_directories $output )

	echo "######## $user ########"
	echo "Files to be included: $src_files"
	echo "Directories to be included: $src_directories"
	echo "Files archived: $arch_files"
	echo "Directories archived: $arch_directories"

	if [ $src_files -eq $arch_files ]; then
	  echo "Backup of $input completed!"
	  echo "details about output backup file:"
	  ls -l $output
	else
	  echo "Backup of $input failed!"
	fi
}

for directory in $*; do
	echo $directory
	backup $directory
	let all=$all+$arch_files+$arch_directories
done;
	echo "TOTAL FILES AND DIRECTORIES: $all"
