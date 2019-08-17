#!/bin/bash

# rand-string generatpr - code-along from tldp

if [ -n "$1" ] 		#if command line arg present
then			#then set start string to it
  str0="$1"
else			# else use the PID of script
  str0="$$"		
fi

POS=2 #starting point of string
LEN=8 #extract 8 characters

str1=$( echo "$str0" | md5sum | md5sum )
# double scramble by piping into md5sum twice

randstring="${str1:$POS:$LEN}"

echo "$randstring"

exit $?
