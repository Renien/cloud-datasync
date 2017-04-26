#!/bin/bash

echo "Parsing args..."

for item in $@; do
	case $item in
		(*=*) eval $item;
	esac
done

echo "Done parsing args..."

# Default values
scripts_root="../modules"

# Check the OS type and load the date utils
OS_TYPE=$(uname -s)

if [ $OS_TYPE == "Linux" ]; then
	echo "It's a linux machine.."

elif [ $OS_TYPE == "Darwin" ]; then
	echo "It's a Mac.."
	source scripts_root/dateUtilsMac.sh
fi

