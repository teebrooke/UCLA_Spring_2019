# What You Should Know From Lecture: Week 1

### Wednesday:
#### [Link to a really cool Shell resource!!!!](https://explainshell.com/)

We learned to change your Hoffman2 password
  * Note that this only works in the login nodes
    * don't remember what that is? Check the notes from Week 1 Monday

```
[c177-i0@login3 ~]$ passwd
```
* You will get this prompt

```
[c177-i0@login3 ~]$ passwd
Changing password for user c177-i0.
Please enter your current password:
```

* You will need to enter your password, but note that you will not be able to see what you typed.
* If all goes well you will see the following:

```
[c177-i0@login3 ~]$ passwd
Changing password for user c177-i0.
Please enter your current password:

Please adhere to the following rules when creating your password:
You cannot use your username or a significant portion of it in your password.
You need to have a minimum of 10 characters.
You need to have at least 5 unique (different) characters.
You need to have at least one character from 3 different character classes.
The character classes are: UPPERCASE CHARACTERS, lowercase characters, digits (0-9),
    and punctuation ((  !#%&)(+*-,/.;=<?>@[]\_^`{}|~  )).
Please enter your NEW password:
```

* I recommend making your password a sassy sentance but that is just me....

* If Hoffman2 accepts your new password it will ask you this:

```
Please re-enter your new password:

Password saved.  Strength: very strong.
Please allow up to 15 minutes for your password to propagate to all cluster nodes.
[c177-i0@login3 ~]$
```

* If you type the same password twice, it will be accepted.

---
We learned some navigation in the shell!
* to see what is in the directory you are currently in type (list directory contents)

* If you type

```
[c177-i0@n9771 ~]$ ls
```

* Note that I am in a compute node.  If you don't remember what this means see the notes from Week 1 Monday.

* You should see

```
[c177-i0@n9771 ~]$ ls
classdata  eeb-177  scratch
```
* `ls` has many useful functions we can check them out by typing the following:

```
man ls
```
* type q a few times to exit

* or

```
ls --help
```

* here are some useful flags (-letter) that work with 'ls'

```
 ls -a (hidden)
 ls -R (all files all folders)
 ls -t (last modified)
 ls -S (files size)
 ls -F (shows file type)
 ls -F directory (other directories)
```

* try them out to understand how they different

* if you need more info [check this out](https://explainshell.com/explain/1/ls)

If you want to know where you are (ie the path to the directory you are in) try:

* if you type pwd

```
[c177-i0@n2010 ~]$ pwd
```
* it will print the name of current/working directory

```
[c177-i0@n2010 ~]$ pwd
/u/home/class/c177/c177-i0
```

What if you want to change directory

* you can do this by using cd

  * cd requires an argument
  * I can find out the directories within my current directory using 'ls'

```
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  scratch
```

* if I want to move up a directory into classdata I will type

```
[c177-i0@n2010 ~]$ cd classdata
```

* now my shell looks like this

```
[c177-i0@n2010 classdata]$
```

* I am no longer in my home directory, I am now in classdata

* Right now classdata looks like this

```
[c177-i0@n2010 classdata]$ ls
classdata  Week1
```

* if I want to move back to my home directory I have a couple of options.

  * 1) I can use $HOME

```
[c177-i0@n2010 classdata]$ cd $HOME
[c177-i0@n2010 ~]$
```

  * 2) I can use cd ~

```
[c177-i0@n2010 classdata]$ cd ~
[c177-i0@n2010 ~]$
```

  * 3) I can use ../

```
[c177-i0@n2010 classdata]$ cd ../
[c177-i0@n2010 ~]$
```
    * the two dots indicate that I would like to go back one directory

    * note that ../ will only take me back to your home directory if I an one directory above home

  * 4) I can also use the full path to home

```
[c177-i0@n2010 classdata]$ cd /u/home/class/c177/c177-i0
[c177-i0@n2010 ~]$
```
* What happens if I try

```
[c177-i0@n2010 classdata]$ cd ../../
```

* Where am I now and how to I get back home?

---
Tip to make your life easier: [use tab to complete your path](https://www.howtogeek.com/195207/use-tab-completion-to-type-commands-faster-on-any-operating-system/)
---

Lets make and delete stuff!

* to make a new directory use mkdir

```
[c177-i0@n2010 ~]$ mkdir example_dir
```

* I will now have a directory named example_dir

```
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  example_dir  scratch
```

* if I include a blank space in my directory name bad stuff happens...

```
[c177-i0@n2010 ~]$ mkdir example dir
[c177-i0@n2010 ~]$ ls
classdata  dir  eeb-177  example  example_dir  scratch
```
* I made two directories 'example' and 'dir'

* I can also make multiple directories in the same go using the flag -p
  * It makes the parent directories for any nested directories
  * I wanted to make and 'example_1' directory that contains and 'example_A' directory in the directory 'example'

```
[c177-i0@n2010 ~]$ mkdir -p example/example_1/example_A
```
* I can then cd into example_A and check that I have the path that I expect

```
[c177-i0@n2010 ~]$ cd example/example_1/example_A
[c177-i0@n2010 example_A]$ pwd
/u/home/class/c177/c177-i0/example/example_1/example_A
```

Let learn to remove the mistakenly made directories 'example' and 'dir', but remember __once it is gone it is really gone__ so be careful.

* there are several ways to remove a directory

* try using rmdir

```
[c177-i0@n2010 ~]$ rmdir example
[c177-i0@n2010 ~]$ ls
classdata  dir  eeb-177  example_dir  scratch
```
* you can also use rm -r
  * the -r stands for recursive (deletes everything in the directory)

```
[c177-i0@n2010 ~]$ rm -r dir
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  example_dir  scratch
```

* if you try  this without the -r you will get the following

```
[c177-i0@n2010 ~]$ rm dir
rm: cannot remove `dir': Is a directory
```

Now lets make a file in example_dir

* we can cd into the directory, then make the file using the command 'touch'

```
[c177-i0@n2010 ~]$ cd example_dir/
[c177-i0@n2010 example_dir]$ touch example.txt
[c177-i0@n2010 example_dir]$ ls
example.txt
```

* now we have an empty text file with the following path: /u/home/class/c177/c177-i0/example_dir/example.txt

* I figured this out by using the command pwd

* I can also make this file from my home directory by doing the following

```
[c177-i0@n2010 ~]$ touch /u/home/class/c177/c177-i0/example_dir/example.txt
```
* I can use 'ls -R' to see that the file 'example.txt' is contained in the new example dir directory

```
[c177-i0@n2010 ~]$ ls -R
.:
classdata  eeb-177  example  example_dir  scratch

./eeb-177:
Favorite_animal.txt  README.txt  W1-Discussion-In-class.txt

./example:
example_1

./example/example_1:
example_A

./example/example_1/example_A:

./example_dir:
example.txt
```

* it also shows me the contents of the eeb-177 directory made for the discussion exercise and the two directories that we made in directory example

* I am now going to remove the 'example.txt' file that I made using rm
