#!/bin/bash

# run as: sh Loop_through_files_in_directory_save_file_name_as_var.sh

# will only work if you are in the directory containing loop_ex.  if you specify the full path then you can run from anywhere.
echo ""

for str in `ls loop_ex/*.txt`
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
