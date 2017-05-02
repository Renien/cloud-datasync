#!/bin/bash

echo "Parsing args..."

for item in $@; do
	case $item in
		(*=*) eval $item;
	esac
done

echo "Done parsing args..."

# Check the OS type and load the date utils
OS_TYPE=$(uname -s)

if [ $OS_TYPE == "Linux" ]; then
	echo "It's a linux machine.."
	source "$scripts_root/dateUtilsLinux.sh"
elif [ $OS_TYPE == "Darwin" ]; then
	echo "It's a Mac.."
	source "${scripts_root}/dateUtilsMac.sh"
fi

# Run the incremental copy/batch copy 
if [ $IS_INCREMENTAL == "true" ]; then
	echo "Incremental copy started for partitioned data.."
	
	# Consider the vertical partioned data
	if [ -z "$period" ]; then
		echo "Period arg not found.. So consider date range [" $startDate "-" $endDate "]"
		startOffSet=$(daysOffset $startDate)
		endOffSet=$(daysOffset $endDate)
	else
		echo "Period arg found [" $period "days ago]"
		startOffSet=$((-1 * ${period}))
    	endOffSet=-1
	fi

	echo "startOffset=" $startOffSet
  	echo "endOffset=" $endOffSet

	source "${scripts_root}/processPartitioned.sh"
else
	echo "Copy folder started.."

	source "${scripts_root}/processBulk.sh"
fi
