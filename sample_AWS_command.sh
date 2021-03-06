#!/bin/bash

# Parameter with startDate and endDate
# ./runDataSync.sh OS_TYPE=Mac \
# 	CLOUD_TYPE=AWS \
# 	AWS_CONF_FILE=/Users/renienj/open-source-projects/cloud-datasync/modules/conf/aws-conf.properties \
# 	scripts_root=/Users/renienj/open-source-projects/cloud-datasync/modules \
# 	IS_INCREMENTAL=true \
# 	startDate=2017-01-01 \
# 	endDate=2017-04-28 \
# 	SOURCE=/your-source-dir/ \
# 	TARGET=s3://aws-s3-bucket-dir \
#   PARTIONDIRECTORY= \
#	DATESEPARATOR=/

# Parameter with period
./runDataSync.sh OS_TYPE=Mac \
	CLOUD_TYPE=AWS \
	AWS_CONF_FILE=/Users/renienj/open-source-projects/cloud-datasync/modules/conf/aws-conf.properties \
	scripts_root=/Users/renienj/open-source-projects/cloud-datasync/modules \
	IS_INCREMENTAL=true \
	period=90 \
	SOURCE=/your-source-dir/ \
	TARGET=s3://aws-s3-bucket-dir/ \
	PARTIONDIRECTORY=date= \
	DATESEPARATOR=-

# Parameter for bulk upload
# ./runDataSync.sh OS_TYPE=Mac \
# 	CLOUD_TYPE=AWS \
# 	AWS_CONF_FILE=/Users/renienj/open-source-projects/cloud-datasync/modules/conf/aws-conf.properties \
# 	scripts_root=/Users/renienj/open-source-projects/cloud-datasync/modules \
# 	IS_INCREMENTAL=false \
#   	SOURCE=/your-source-dir/ \
#   	TARGET=s3://aws-s3-bucket-dir/ \
#   	PARTIONDIRECTORY=date