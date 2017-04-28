#!/bin/bash

scripts_root="../modules"

source "${scripts_root}/datePatternValidation.sh"

# correct pattern
isDate 12345678

# in-correct pattern
isDate 123
