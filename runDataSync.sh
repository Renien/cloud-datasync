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

# Load the authendication based cloud service 
if [ $CLOUD_TYPE == "AWS" ]; then
	echo "It's for AWS S3 bucket.."
	
	source "${scripts_root}/authentication.sh"
	echo "AWS_CONF_FILE path :" $AWS_CONF_FILE 
	aws_authentication $AWS_CONF_FILE

elif [ $CLOUD_TYPE == "GCP" ]; then
	echo "It's for GCP Storage.."
fi

# Run the incremental copy/batch copy 


