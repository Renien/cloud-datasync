#!/bin/bash

scripts_root="../modules"

AWS_CONF_FILE="$scripts_root/conf/aws-conf.properties"
source "$scripts_root/authentication.sh"

aws_authentication

