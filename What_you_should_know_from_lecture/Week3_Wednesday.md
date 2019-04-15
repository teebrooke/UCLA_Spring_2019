# What You Should Know From Lecture: Week 3

### Wednesday:
#### Announcements-
__Homework__
HW3 was due today.

HW4 will be due on Monday before class.

__Readings__
Read about [job submission](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Submitting_Jobs), [job monitoring](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Monitoring_Jobs), and [compute nodes](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2:Interactive_Sessions) on Hoffman2.

__Project__
If you are worried about your project, come to my office hours.  They are after class at the Music Cafe.

---

#### Warm up exercise:

__Make a directory__ for todays class. cd into that directory

1. Find a partner to work with.

2. Write a script called cut_stuff_<your_initials>\_<your_partners_initials>.sh

3. You script needs to include the following:
  * comments on usage
  * It must take an input file, a delimiter, the column to be printed, and an output file as arguments. For example:
  `$ sh cut_stuff_EC_DC.sh ~/classdata/Homework_data/data-shell/data/amino-acids.txt : 1 cut_stuff_EC_DC_out.sh`

  * It must cut the text file at the first argument keep the text in the column indicated by the second argument and print that column to a new folder.
  __Hint__ see line 171-177 of Week 2 Wednesday.

  4. Copy or move the script to `~/classdata/In_class/Week3/my_first_scripts_for_PCEEB`

----
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



# Wednesday Challenge:

Take the for loop that you used in class to print the colors of the rainbow (as is) and make a script that runs that for loop, then takes that output file and generates another output file that has the colors printed in reverse order.
