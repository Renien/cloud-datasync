#!/bin/bash

source "./authentication.sh"

# Authentication for cloud service

if [ $CLOUD_TYPE == "AWS" ]; then
	echo "It's for AWS S3 bucket.."

    source "${scripts_root}/authentication.sh"
    echo "AWS_CONF_FILE path :" $AWS_CONF_FILE 
    aws_authentication $AWS_CONF_FILE

    export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY
	export AWS_SECRET_ACCESS_KEY=S3_SECRET_ACCESS_KEY
  
elif [ $CLOUD_TYPE == "GCP" ]; then
	echo "It's for GCP Storage.."
fi

# Iterate through the vertical partioned data

for ((i = startOffSet; i <= endOffSet; i++)) do
	noDays=$i
	nextDay=$(stepForNextDay $noDays $DATESEPARATOR)

	if [ $CLOUD_TYPE == "AWS" ]; then

		# AWS incremental copy command
		echo "Source: " $SOURCE$PARTIONDIRECTORY$nextDay 
		echo "Target: " $TARGET$PARTIONDIRECTORY$nextDay 
		echo "Additional options: " $EXTRA_DISTCP_OPTIONS

		aws s3 cp $SOURCE$PARTIONDIRECTORY=$nextDay $TARGET$PARTIONDIRECTORY=$nextDay $EXTRA_DISTCP_OPTIONS
  
	elif [ $CLOUD_TYPE == "GCP" ]; then

		# GCP incremental copy command
		echo "Source: " $SOURCE$PARTIONDIRECTORY$nextDay 
		echo "Target: " $TARGET$PARTIONDIRECTORY$nextDay 
		echo "Additional options: " $EXTRA_DISTCP_OPTIONS

		gsutil cp $SOURCE$PARTIONDIRECTORY=$nextDay $TARGET$PARTIONDIRECTORY=$nextDay $EXTRA_DISTCP_OPTIONS
	fi

done
