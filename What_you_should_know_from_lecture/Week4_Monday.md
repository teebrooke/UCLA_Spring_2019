# What You Should Know For Lecture: Week 4

### Monday:

#### Announcements-

__Homework__

Any exercises not completed in class will be due Wednesday.  There is also an HW 4 assignment due on Wednesday by 11 pm.


__Readings__
Read about [job submission](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Submitting_Jobs), [job monitoring](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Monitoring_Jobs), and [compute nodes](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Interactive_Sessions) on Hoffman2.

__Project__
If you are worried about your project, come to my office hours.  They are after class at the Music Cafe.

---

#### What is a loop?  

We played around with a 'for' loop last time, but what is the purpose of loops?  They make our lives easier buy doing repetitive tasks.  They can 'do' an number of things for a list of items, a range of numbers, while some condition is true, or if something exists.  I personally love loops, and I hope that you will too.

---

The 'for' loop revisited.  This is essentially what it does:

```
for thing in list_of_things
do
    operation_using $thing    # Indentation within the loop is not required, but aids legibility
done
```

The loop we saw last time looked like this:

```
$ for i in ./*  # i is a script in the list of scripts found in ./*
> do
> bash $i # bash ran each script in the list of scripts.
> done
```

We can also do this as a one liner....

```
for i in ./*; do bash $i; done  # the ';' indicate new lines
```

We used a for loop to do something to a bunch of files.  We can use a for loop to do something to a list or items:

```
for word in alpha beta kappa delta epsilon
do
  touch ${word}-file.txt
done
```

How would this look as a one liner?

```
for word in alpha beta kappa delta epsilon; do touch ${word}-file.txt; done
```
These could also be filenames....
cd into ~/classdata/Homework_data/data-shell/creatures for this...

```
for x in basilisk.dat unicorn.dat
do
    head -n 2 $x | tail -n 1
done
```

cd back into the directory that you made for today's class.

If there are spaces in items of a list you need to use "".  For example:

```
for spacenames in "outer space" "office space" "personal space"
do
  echo $spacenames
done
```

We can also iterate over a sequence of numbers:
```
for NUM in `seq 1 1 10`
do
  echo ${NUM}
done
```
What happens if we change the values in the `seq`?

```
for NUM in `seq 1 2 10`
do
  echo ${NUM}
done
```

```
for NUM in `seq 2 1 10`
do
  echo ${NUM}
done
```

```
for NUM in `seq 1 1 5`
do
  echo ${NUM}
done
```

'seq X Y Z'
  * X=starting value
  * Y=number of count between digits to return
  * Z= upper limit to return

We can also iterate over a list of things contained within a document.

```
for line in `cat ~/classdata/Homework_data/data-shell/data/animals.txt`;
do
  echo $line
done
```

Did it work?  Did you use \` or ' it makes a difference....

Write a for loop that loops over the colors of the rainbow and prints them to a file. The colors are red, orange, yellow, green, blue, indigo, violet.  

---

### While and Until loops!
The while loop does something until a condition is true. We will use a similar example to what was in the reading:

```
counter=3  
while [ $counter -le 5 ]
do
echo $counter
((counter++))
done
```
Why did we do `counter=3`

What does `[ $counter -le 5 ]` mean?

What does `((counter++))` do?

The until loop does something until a condition is met. We will use a similar example to what was in the reading:

```
counter=2
until [ $counter -gt 5 ]
do
echo $counter
((counter++))
done
```

How does `[ $counter -le 5 ]` differ from `[ $counter -gt 5 ]`?

---

#### integer comparison

-eq
is equal to

[ "$a" -eq "$b" ]

-ne
is not equal to

[ "$a" -ne "$b" ]

-gt
is greater than

[ "$a" -gt "$b" ]

-ge
is greater than or equal to

[ "$a" -ge "$b" ]

-lt
is less than

[ "$a" -lt "$b" ]

-le
is less than or equal to

[ "$a" -le "$b" ]

<
is less than (within double parentheses)

(("$a" < "$b"))

<=
is less than or equal to (within double parentheses)

(("$a" <= "$b"))

\>
is greater than (within double parentheses)

(("$a" > "$b"))

\>=
is greater than or equal to (within double parentheses)

(("$a" >= "$b"))

---

### Ranges
Similar to until and while loops, we can write a for loop that covers ranges of integers

```
for numb in {10..1}
do
  echo $numb
done
```

How is this different?

```
for numb in {1..10}
do
  echo $numb
done
```

We can also skip over integers like we did with `seq 1 2 10`

```
for numb in {1..10..3}
do
  echo $numb
done
```
How is this different?
```
for numb in {10..1..3}
do
  echo $numb
done
```

---
### If Then...
The if then loop determines if a variable satisfies a specific condition.  If it does 'then' something happens and then the conditional ends with 'if'.  If the condition is not me it ends with 'fi'.  Because we are evaluating the names in a for loop, we will print all but the words that meet our condition.

```
for name in Emily Elizabeth Curd Guswa
do
  if [ Curd != $name ]
  then
    echo $name
  fi
done
```
If we add a break what happens?

```
for name in Emily Elizabeth Curd Guswa
do
  if [ Curd != $name ]
  then
    echo $name
    break
  fi
done
```

If we add a continue what happens?

```
for name in Emily Elizabeth Curd Guswa
do
  if [ Curd != $name ]
  then
    echo $name
    continue
  fi
done
```

---
#### String Comparison

__=__ : is equal to

if [ "$a" = "$b" ]

if [ "$a"="$b" ] this does not work because it is missing whitespace.

__==__ : is equal to

if [ "$a" == "$b" ]

if [ "$a" =. "$b" ] also does the same thing

__!=__ : is not equal to

if [ "$a" != "$b" ]

__<__ : is less than, in ASCII alphabetical order

if [[ "$a" < "$b" ]] Notice that you can use double brackets

if [ "$a" \< "$b" ]

Note that the "<" needs to be escaped within a single brackets.  Escaped is when you add an "\" in front of a character.  We will see this again with regular expressions.

__\>__ : is greater than, in ASCII alphabetical order

if [[ "$a" > "$b" ]]

if [ "$a" \> "$b" ]

__-z__ : string is null, that is, has zero length

if [ -z $a ]

__-n__ : string is not null.

---

#### The If then else statement

This is very much like the if then statement but instead of having a single condition to meet, it has two.

```
String="not dead yet"  

if [ -n "$String" ] # -n means not null see above
then
  echo "\$String is NOT null."
  echo $String
else
  echo "\$String is null."
fi     # $String is Not null.

```

Then this one:

```
String=""  

if [ -n "$String" ]
then
  echo "\$String is NOT null."
  echo $String
else
  echo "\$String is null."
fi     # $String is Not null.

```
#### In class exercise:

__Make a directory__ for todays class. cd into that directory

1. Write a script called cut_stuff_<your_initials>\_<your_partners_initials>.sh

2. You script needs to include the following:
  * comments on usage
  * It must take an input file, a delimiter, the column to be printed, and an output file as arguments. For example:
  `$ sh cut_stuff_EC_DC.sh ~/classdata/Homework_data/data-shell/data/amino-acids.txt : 1 cut_stuff_EC_DC_out.sh`

  * It must cut the text file at the first argument keep the text in the column indicated by the second argument and print that column to a new folder.
  __Hint__ see line 171-177 of Week 2 Wednesday.

3. Copy or move the script to `~/classdata/In_class/Week3/my_first_scripts_for_PCEEB`


4. Take the for loop that you used in class to print the colors of the rainbow (as is) and make a script that runs that for loop, then takes that output file and generates another output file that has the colors printed in reverse order.

5. Write and comment a script that takes the for loop that you used in class to print the colors of the rainbow (as is) and if the color is equal to blue print sky, for every other color print fire.  Save this script as color.sh . The output should be as follows:
```
red
fire
orange
fire
yellow
fire
green
fire
blue
sky
indigo
fire
violet
fire
```

6. Write an script that contains an until loop that prints a counter from 5 until the counter is greater than 8. Call this script until_8.sh

7. Write an script that contains an while loop that prints a counter while the counter is not greater than

8. Start the counter at 5.  Call this script while_8.sh

9. Write an script that contains an range loop that prints a range of numbers from 5 to 8. Call this script range_8.sh


----

If you ls the the directory ~/classdata/Homework_data/data-shell/molecules directory, you get the following output:

```
cubane.pdb  ethane.pdb  methane.pdb  octane.pdb  pentane.pdb  propane.pdb
```

1. __What__ is the output of the following code?
```
$ for datafile in *.pdb
> do
>    ls *.pdb
> done
```


2. __What__ is the output of the following code?
```
$ for datafile in *.pdb
> do
>	ls $datafile
> done
```


3. __Why__ do these two loops give different outputs?


4. __What__ is output of running the following loop in the data-shell/molecules directory?
```
$ for filename in c*
> do
>    ls $filename
> done
```
__a.__ No files are listed.
__b.__  All files are listed.
__c.__  Only cubane.pdb, octane.pdb and pentane.pdb are listed.
__d.__  Only cubane.pdb is listed.

5. __How__ would the output differ from using this command instead?
```
$ for filename in *c*
> do
>    ls $filename
> done
```
__a.__ The same files would be listed.
__b.__ All the files are listed this time.
__c.__ No files are listed this time.
__d.__ The files cubane.pdb and octane.pdb will be listed.
__e.__ Only the file octane.pdb will be listed.

6. In the data-shell/molecules directory, __what__ is the effect of this loop?
```
for alkanes in *.pdb
do
    echo $alkanes
    cat $alkanes > alkanes.pdb
done
```
__a.__ Prints cubane.pdb, ethane.pdb, methane.pdb, octane.pdb, pentane.pdb and propane.pdb, and the text from propane.pdb will be saved to a file called alkanes.pdb.
__b.__ Prints cubane.pdb, ethane.pdb, and methane.pdb, and the text from all three files would be concatenated and saved to a file called alkanes.pdb.
__c.__ Prints cubane.pdb, ethane.pdb, methane.pdb, octane.pdb, and pentane.pdb, and the text from propane.pdb will be saved to a file called alkanes.pdb.
__d.__ None of the above.

7. __What__ would be the output of the following loop?

```
for datafile in *.pdb
> do
> cat $datafile >> all.pdb
> done
```

__a.__ All of the text from cubane.pdb, ethane.pdb, methane.pdb, octane.pdb, and pentane.pdb would be concatenated and saved to a file called all.pdb.
__b.__ The text from ethane.pdb will be saved to a file called all.pdb.
__c.__ All of the text from cubane.pdb, ethane.pdb, methane.pdb, octane.pdb, pentane.pdb and propane.pdb would be concatenated and saved to a file called all.pdb.
__d.__ All of the text from cubane.pdb, ethane.pdb, methane.pdb, octane.pdb, pentane.pdb and propane.pdb would be printed to the screen and saved to a file called all.pdb.
