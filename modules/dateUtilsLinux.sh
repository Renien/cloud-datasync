#!/bin/bash

#########################
#	Date Utils for Linux
#########################

SECS_PER_DAY=86400

daysOffset () {		
	today=$(date -u +%Y-%m-%d)
        printf %s $((($(date -u -d $1 +%s) -
                        $(date -u -d "$today" +%s)) / $SECS_PER_DAY))
}

stepForNextDay () {
	local offSet=$1
	local dateSeparator=$2
	printf %s $(date -u +%Y$dateSeparator%m$dateSeparator%d -d "$DATE + $1 day")
}
