#!/bin/bash

#########################
#	Date Utils for Mac
#########################

SECS_PER_DAY=86400

stepForNextDay () {
	local offSet=$1
	printf %s $(date -v+"${offSet}d" "+%Y%m%d")
}
