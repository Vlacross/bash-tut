#!/bin/bash

len=0 			#length of int list
arr_len=0		#set array length for loop
line_num=0		#track line number - since we know line holds length and 2 holds list
unique=''		#spot for first found unique element

while IFS='\n' read line
  do
  
  if [[ len -ne 0 ]]	#if the length isn't 0, we know the lengths were set but we haven't 
    then		#built our array from out list yet

      while [[ len -gt 0 ]]
	do

	  			#grabbing items seperated by spaces
	  IFS=' '		

	  for word in $line	#add each item to an array and subtract from our length
	    do			#variable to kill our while loop when we've used all the items
	      arr+=("$word")
	      len=$[ $len-1 ]
	    done

	done

	declare -a arr		#officiall declare array - may not be necessary
	
	i=0
					#set outter loop starting counter
	while (( i<$arr_len ))		#outter loop range is length of array
	
 	  do
	    occurance=0			#track occurances per iteration
					#will reset for each element
	j=0				#set inner loop starting counter
	while (( j<$arr_len ))		#outter loop range set to length of array
	      do

		if [ "${arr[j]}" == "${arr[i]}" ]	#check for match
		  then

		  occurance=$[ $occurance+1 ]		#tally occurances
		fi
		if [ "$occurance" -ge 2 ] && [ "${arr[j]}" == "${arr[i]}" ]	
							#if two or more occurances are found
		  then					#remove from array to single
		    unset arr[j] 			#out unique elements
		fi
		j=$[ $j+1 ]				#increment inner loop 
	      done

	    if [ $occurance -eq 1 ]	#if only single occurance found, assign value
	      then			#to variable to pass back at end of script
		unique=${arr[i]}	#and break outter loop (assuming only finding a
		break			#a single unique item-if not, remove break)
	    else
						#when occurance isn't one, we assume 2 or more 
						#matches found, so we remove the control element
		unset arr[i]			#we matched this loop around and increment our
	        i=$[ $i+1 ]			#outter loop to continue our search
	    fi
	  done

	if [ -n $unique ] 
	  then
	    echo ${unique}
	fi

  elif [[ line_num -eq 0 ]]		#set our original lengths and line number variables
    then
      len=$[ $line ]
      arr_len=$[ $line ]
     line_num=$[ $line_num+1 ]
  fi
  done




