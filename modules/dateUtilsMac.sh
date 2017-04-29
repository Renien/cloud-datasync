#!/bin/bash

#########################
#	Date Utils for Mac
#########################

SECS_PER_DAY=86400

daysOffset () {	
	startDate=$1	
	today=$(date "+%Y-%m-%d")
    echo $(((`date -jf %Y-%m-%d $startDate +%s` - `date -jf %Y-%m-%d $today +%s`) / $SECS_PER_DAY))
}

stepForNextDay () {
	local offSet=$1
	echo $(date -v+"${offSet}d" "+%Y%m%d")
}

