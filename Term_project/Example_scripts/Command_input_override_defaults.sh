#!/bin/bash

# this is an example of how you could assign a variable from the command line to override a default varaible defined in the vars file

# to run: ~/bash_command_line_flags.sh
# to run and overide defaults: ~/bash_command_line_flags.sh -o one -t two
# to run and get the help screen: ~/bash_command_line_flags.sh -h


# makeing an empty variable for the first and second command line varaibles -o and -t
# If you want the help screen you do not need to declare and  varaibles you just type ~/bash_command_line_flags.sh -h
First=""
Second=""

# note that we are using the same vars.sh script for two different scripts
# if the vars file is not in your working directory you need to specify where it is located
source vars.sh


# getops is a builtin function in bash to take command line varaibles designeted by flags.  This alows the user to input the command line varaibles that they want, and it does not require them to be input in any particular order.
# here are some tutorials: https://dustymabe.com/2013/05/17/easy-getopt-for-a-bash-script/, https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/, https://linuxconfig.org/how-to-use-getopts-to-parse-a-script-options,

while getopts "o:t:h?:" opt; do
    case $opt in
        o) First="$OPTARG" # path to desired Anacapa output
        ;;
        t) Second="$OPTARG"  # path to Anacapa_db
        ;;
        h) HELP="TRUE"  # calls help screen
        ;;
    esac
done


# if the user gave the -h flag the help screen prints, if not an empty new line is returned
if [ "${HELP}" = "TRUE" ]
then
  printf "\nThis would print a help screen...\nFor this particular example:\n\t-o is the optional first varaible. (default return is "A")\n\t-t is the optional second varaible (default return is "B")\n\t-p prints help \n \n"
  exit
else
  echo ""
fi


echo "The varaible stored in -o is ${First:=$First_Default}"

echo "The varaible stored in -t is ${Second:=$Second_Default}"

echo ""
