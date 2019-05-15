#!/bin/bash

# run as: sh Loop_through_files_in_directory_save_file_name_as_var_with_command_input_for_file_name.sh -i loop_ex/


# makeing an empty variable for the varaibles -i which will be used to specify and input directory
Input_dir=""


# getops is a builtin function in bash to take command line varaibles designeted by flags.  This alows the user to input the command line varaibles that they want, and it does not require them to be input in any particular order.
# here are some tutorials: https://dustymabe.com/2013/05/17/easy-getopt-for-a-bash-script/, https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/, https://linuxconfig.org/how-to-use-getopts-to-parse-a-script-options,

while getopts "i:" opt; do
    case $opt in
        i) Input_dir="$OPTARG" # path to desired Anacapa output
        ;;
    esac
done



# will only work if you are in the directory containing loop_ex.  if you specify the full path then you can run from anywhere.
echo ""

for str in `ls ${Input_dir}*.txt`
do
  echo "this is the file / path:"
  echo ${str}
  # selecting the part of str up to the .txt and storing it in variable $str1
 str1=${str%.txt}
 echo "this is the file / path without the file extension:"
 echo ${str1}
 # selecting the part of $str1 after loop_ex/
 j=${str1#loop_ex/}
 echo "this is the file name without the file extension:"
 echo ${j} "..."
 echo ""


done
