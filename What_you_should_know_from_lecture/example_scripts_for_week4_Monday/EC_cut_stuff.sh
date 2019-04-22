#!/bin/bash

# this script take four comand line arguments $1 = input file, $2 = the dilimiter, $3 = the field to keep, $4 = the output text
# here is an example usage: sh EC_cut_stuff.sh : 1 EC_cut_stuff_out.text
# we are going to use cut the delimiter -d will take $2, the field -f that we want is indicated by $3, we are going to perform this command on $1, we are going to output the result to $4


cut -d$2 -f $3 $1 > $4
