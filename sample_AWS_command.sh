#!/bin/bash

./runDataSync.sh OS_TYPE=Mac \
	CLOUD_TYPE=AWS \
	AWS_CONF_FILE=/Users/renienj/open-source-projects/cloud-datasync/modules/conf/aws-conf.properties \
	scripts_root=/Users/renienj/open-source-projects/cloud-datasync/modules \
	IS_INCREMENTAL=true \
	startDate=2017-01-01 \
	endDate=2017-04-28
