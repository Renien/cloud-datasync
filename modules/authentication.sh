#!/bin/bash

# aws authentication function
aws_authentication() {

if [ -f "$AWS_CONF_FILE" ]; then
  
	echo "$AWS_CONF_FILE found.."
	
	while IFS='=' read -r key value
	do
		key=$(echo $key | tr '.' '_')
		eval "${key}='${value}'"
	done < "$AWS_CONF_FILE"

	echo "S3_ACCESS_KEY       = " $S3_ACCESS_KEY
	echo "S3_SECRET_ACCESS_KEY = " $S3_SECRET_ACCESS_KEY

else
	echo "$AWS_CONF_FILE not found.."
fi
	
}
