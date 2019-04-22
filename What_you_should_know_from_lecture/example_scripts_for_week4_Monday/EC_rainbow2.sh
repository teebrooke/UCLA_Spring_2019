#!/bin/#!/usr/bin/env bash
# this script is a for loop that prints the colors in the raindow in reverse order
# it then uses a conditional to determine if the color is blue. if it is it echos sky, if it is not it echos fire
# usage is sh EC_rainbow1.#!/bin/sh

for i in red orange yellow green blue indigo violet
do
  echo $i
  if [ $i == blue ]
    then
      echo "sky"
    else
      echo "fire"
  fi
done
