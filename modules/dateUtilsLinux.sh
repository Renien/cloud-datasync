#!/bin/bash

#########################
#	Date Utils for Linux
#########################

SECS_PER_DAY=86400

stepForNextDay () {
	local offSet=$1
	printf %s $(date -u +%Y$2%m$2%d -d "$DATE + $1 day")
}
