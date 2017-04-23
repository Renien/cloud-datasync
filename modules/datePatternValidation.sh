#!/bin/bash

##########################
# Date Pattern Validate 
##########################

pattern="^[0-9]{8}$"

isDate(){  
	
	local date=$1

	if [[ $date =~ $pattern ]]; then
		echo "$date is valid"
		return 1 
	else
		echo "$date not valid"
		return 0
	fi

}
