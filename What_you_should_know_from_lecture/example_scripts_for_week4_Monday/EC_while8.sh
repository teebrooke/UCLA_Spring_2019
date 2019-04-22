#!/bin/#!/usr/bin/env bash
# this is an while loop that echos the counter, starting at 5, while the value is not greater than 8
# example usage in sh EC_while8.sh
# I copied and pasted this from the lecture notes, and then changed the value of the counter and the value 8

counter=5
while [ $counter -le 8 ]
do
echo $counter
((counter++))
done
