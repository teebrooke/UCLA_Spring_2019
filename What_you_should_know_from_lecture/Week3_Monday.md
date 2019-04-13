variable# What You Should Know From Lecture: Week 3

### Monday:
#### Announcements-

HW
Readings
project

---

#### Warm up exercise:

1. Find a partner
2. Create / write the following to a text file (technically a script) called test_shell_script_<your_initials>\_<your_partners_initials>.sh

```
#!/bin/bash
# This program prints:
# hello world!
# our names are <type your names>
# we like <type in your favorite animals>
# Have a great day!

echo "hello world!"

echo "our names are <type your names>"

echo "we like <type in your favorite animals>"

echo "Have a great day!"

```

3. cp your file (technically a script) to the directory ~/classdata/In_class/week2/my_first_scripts_for_PCEEB

---

#### What is a Shell script anyways?

It is really just a  bunch of commands all saved in a file. It is a small program!  You just made a program!!!

The elements of a program are pretty simple

1. The [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix) `#!/bin/bash` tells your computing environment that you are going to execute a shell script
2. add comments that indicate what your program should do.  The # sign tells bash to ignore this line of text

3. Add some commands that you want to run

4. Save the file

Now all you have to do is enter the following

```
$ bash ~/classdata/In_class/week2/my_first_scripts_for_PCEEB/test_shell_script_<your_initials>\_<your_partners_initials>.sh
```
shell scripts can also be submitted with `sh` or `bin/bash`.  The one that you use depends 1) on your computing environment (not all accept `sh`), 2) your personal preference.

try
```
bin/bash bash ~/classdata/In_class/week2/my_first_scripts_for_PCEEB/test_shell_script_<your_initials>\_<your_partners_initials>.sh
```
and
```
sh bash ~/classdata/In_class/week2/my_first_scripts_for_PCEEB/test_shell_script_<your_initials>\_<your_partners_initials>.sh
```

---

#### Ooooo a for loop

What if we want to run all of the scripts in this directory at the same time?  We could write a for loop that lets us do this!!!!

```
$ for i in ./*
> do
> bash $i
> done
```
What did it print to the screen?  We can also do this as a one liner....

```
for i in ./*; do bash $i; done
```

and get the same results.

Why is is called a for loop?  In this case, for a set of scripts in a folder `./*.sh` do something.  We stored each file name in the variable 'i', and then called it when we wanted to run a command.  

Could we have stored it in a different variable? You betcha!  [There are a few exceptions. The Shell has some default variables](https://ss64.com/bash/syntax-variables.html)

We will come back to the idea of loops in a little while...

---

#### What is a variable really?

It is a way to store some character or set of characters. In bash you do not need to declare a variable you just need to assign it with something.

```
$ My_pets_name="Quincey"
```

I can verify that I stored something in that variable by doing the following:

```
$ echo $My_pets_name
Quincey
```

I can use multiple variables at the same time.

```
$ My_pets_species="dog"
$ echo "I have a $My_pets_species named $My_pets_name"
I have a dog is named Quincey
```
Sometimes when you call the variable it will be encased in `{ }` like this:

```
$ My_pets_species="dog"
$ echo "I have a ${My_pets_species} named ${My_pets_name}"
I have a dog is named Quincey
```

Operationally, it is the same. But it can be used to clear up ambiguities like in the following:

```
$ var=quincey
$ echo $vardog

$ echo ${var}dog
$ quinceydog
```

What happens if you try to improve the grammar of your variable?
```
$ My_pet's_species="dog"
```
It does not work.  

What if you include white spaces?

```
$ var = vari
$ var= varia
$ var =variab
```
It does not work.

What if my variable needs to have white spaces? Perhaps We want to store the following `Quincey dog` in the variable q_beast.

---

Lets try using variables in a shell script.

Make a directory called Week3_in_class.  Copy a version of the file ~/classdata/Week3/UC_mascots.txt to this new directory.

Now we are going to make a shell script called `mascots_1.sh`

```
#!/bin/bash
# script prints the following:
# "These UCs have no mascot"
# then it searches the text file UC_mascots.txt for lines that contain "??" using grep and prints the matching line(s)

echo "These UCs have no mascot"

grep "??" UC_mascots.txt
```
run it
```
$ sh mascots_1.sh
These UCs have no mascot
UC San Fransisco: ??
UC Hastings: ??
```

We could ask ourselves why they don't have mascots, but instead lets see what we did...  We used grep to search UCmascots.txt for '??'.  These '??' indicate in the text file that Emily could not find a mascot for these schools. If you do not know of the many wonders of grep, go to https://explainshell.com/.

Lets write a new shell script that requires an input file, and call it `mascots_2.sh`

```
#!/bin/bash
# this script requires and input file
# here is an example usage:
# sh mascots_2.sh UC_mascots.txt
# script prints the following:
# "These UCs have no mascot"
# then it searches the text file stored as $1  for lines that contain "??" using grep and prints the matching line(s)

echo "These UCs have no mascot"

grep "??" $1
```

If you run it as
```
$ sh mascots_2.sh
These UCs have no mascot
^C
```
it gets stuck and does not quit. You will have to kill it with ^C.

Now try

```
$ sh mascots_2.sh UC_mascots.txt
```

Why did this work?  Well UC_mascots.txt was saved as $1.

For more command line variable fun lets try this. Save it to mascots_3.sh

```
#!/bin/bash
# this script requires and input file and an input string of characters
# here is an example usage:
# sh mascots_2.sh UC_mascots.txt Los
# script prints the following:
# "This UCs has the best mascot"
# then it searches the text file stored as $1 for lines that contain the command line string of characters stored in $2 using grep and prints the matching line(s)


echo "This UC has the best mascot!"

grep "$2" $1
```

```
$ sh mascots_3.sh UC_mascots.txt Los
This UC has the best mascot
UC Los Angeles: Joe and Josephine Bruin/Bruins
```

So which variable was used to store Los?  $2 right.  What if we play with the input that goes into $2.
```
$ sh mascots_3.sh UC_mascots.txt UC
This UC has the best mascot
UC Los Angeles: Joe and Josephine Bruin/Bruins
UC Santa Barbara: Olé the Gaucho/Gauchos
UC Riverside: Scotty Highlander/Highlanders
UC Davis: Gunrock the Mustang/Aggies
UC San Diego: King Triton/Tritons
UC Irvine: Peter the Anteater/Anteaters
UC Berkeley: Oski the Bear/Golden Bears
UC Santa Cruz: Sammy the Slug/Banana Slugs
UC Merced: Rufus Bobcat/Golden Bobcats
UC San Fransisco: ??
UC Hastings: ??
```
Why did they all show up?  What does this tell you about grep?

Write a small program that prints the top 2 and bottom 3 lines of UC_mascots.txt.  Call it heads_and_tails_<your_initials>\_<your_partners_initials>.sh and add it to ~/classdata/In_class/week2/my_first_scripts_for_PCEEB .  It must contain comments for usage.


Now write a small program that allow the user to identify the number of lines that they want to print from the top and the number of lines that they want to print from the bottom of the file. Call it heads_and_tails_<your_initials>\_<your_partners_initials>1.sh and add it to ~/classdata/In_class/week2/my_first_scripts_for_PCEEB . It must contain comments for usage.


Now write a small program that allow the user to identify the number of lines that they want to print from the top and the number of lines that they want to print from the bottom of the file. Finally allow the user to indicate the file that they want to input into the script. Call it heads_and_tails_<your_initials>\_<your_partners_initials>3.sh and add it to ~/classdata/In_class/week2/my_first_scripts_for_PCEEB . It must contain comments for usage.

---

## Monday Challenge

Learn two ways to add 2 + 4 = 6 in bash
Make a script that does runs arithmetic using two input values as variables.  Include both ways to add two numbers in the script.  Have the script echo the method used to do the addition.  Make sure the script is adequately commented.  Add the script to ~/classdata/In_class/Week3/Challenge and call it Monday_challenge_<your_initials>\_<your_partners_initials>.sh

I have some amazing candy for anyone that completes the challenge.

[Do math in bash](http://faculty.salina.k-state.edu/tim/unix_sg/bash/math.html)



---
In case we need it, here is [a good link about permissions](https://ss64.com/bash/chmod.html)
