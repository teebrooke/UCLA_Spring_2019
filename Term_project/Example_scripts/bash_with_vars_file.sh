#!/bin/bash

# this is an example of how you could associate a vars file with your script

# ~/bash_with_vars_file.sh

# if the vars file is not in your working directory you need to specify where it is located
source vars.sh

echo "\n"

echo "The first varaible \$ONE is ${ONE}"
echo "The second varaible \$TWO is ${TWO}"

echo "\n"
