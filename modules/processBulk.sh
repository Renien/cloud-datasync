#!/bin/bash

source "./authentication.sh"

# Authentication for cloud service

if [ $CLOUD_TYPE == "AWS" ]; then
	echo "It's for AWS S3 bucket.."

    source "${scripts_root}/authentication.sh"
    echo "AWS_CONF_FILE path :" $AWS_CONF_FILE 
    aws_authentication $AWS_CONF_FILE

    # AWS bulk copy command
	echo $SOURCE $TARGET $EXTRA_DISTCP_OPTIONS

elif [ $CLOUD_TYPE == "GCP" ]; then
	echo "It's for GCP Storage.."

	# GCP bulk copy command
	echo $SOURCE $TARGET $EXTRA_DISTCP_OPTIONS
fi

