#!/bin/bash

# this is an example of how you could assign a variable from the command line

# ~/bash_command_line_flags.sh -o one -t two -h

# makeing an empty variable for the first and second command line varaibles -o and -t
# If you want the help screen you do not need to declare and  varaibles you just type ~/bash_command_line_flags.sh -h
First=""
Second=""


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



if [ "${HELP}" = "TRUE" ]
then
  printf "\nThis would print a help screen...\nFor this particular example:\n\t-o is the first varaible\n\t-t is the second varaible\n\t-p prints help \n \n"
  exit
else
  echo ""
fi


echo "The varaible stored in -o is ${First}"

echo "The varaible stored in -t is ${Second}"

echo ""
