# Lecture Homework: Practice exercises due 4-17-19 before class.

## [Read about loops](https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php)

## _then..._
__Hint__ Check out the lecture notes from Week2_Monday_pt2 for help with the output.

## __Write__
a well commented shell script called morse_code_script_<your_ initials>1.sh that does the following to the file /u/home/class/c177/c177-i0/classdata/Homework_data/data-shell/data/morse.txt:

1. Takes user input from the command line in the form of 1) the file name and 2) an alpha numeric  with spaces between each character. For example:

```
$ morse_code_script_EC1.sh morse.txt E M I L Y
```

2. And outputs the following:
```
The Morse Code for the input word is
E	.
M	--
I	..
L	.-..
Y	-.--
```
---

## __Write__
a second well commented shell script called morse_code_script_<your_ initials>2.sh that does the following to the file /u/home/class/c177/c177-i0/classdata/Homework_data/data-shell/data/morse.txt:

1. Takes user input from the command line in the form of 1) the file name and 2) an alpha numeric  with spaces between each character. For example:

```
$ morse_code_script_EC2.sh morse.txt E M I L Y
```

2. And outputs the following:
```
The Morse Code for the input word is
E	. M	--  I	..  L	.-..  Y	-.--
```

The white space between letters / morse code sets is a tab.  e.g `E	.\tM	--\tI	..\tL	.-..\tY	-.--`
