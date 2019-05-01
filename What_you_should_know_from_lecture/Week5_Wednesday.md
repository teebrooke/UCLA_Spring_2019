variable# What You Should Know For Lecture: Week 5

## Wednesday:

### Announcements-

__Homework__

Any exercises not completed in class will be due Monday at 11 pm.   There will be a HW 5 assignment due during discussion week6.

---
## Make a folder called <your_initials>\_Week5_Wednesday  Store all of the scripts from today in this folder. All scripts need to be well commented.  At the end of class copy this folder to `/u/home/class/c177/c177-i0/classdata/In_class/Week5/Wednesday`

---

## Python Scripts

Before we learn about dictionaries let's learn about python scripts.

The anatomy of a python script is very similar to that of a bash script.  Python scripts typically have shebangs.  This tells the user and the operating system that this is a python script.

```
#!/usr/bin/env python2
```

After the shebang, we give python a command. Let's do the following:

Make a new file and call it Week_5_Wed.py.  Inside the file type the following:

```
#!/usr/bin/env python2
# usage: python Week_5_Wed.py
# this file prints: Week5 is here!

print 'Week5 is here!'
```

Congratulations you just made a python script!  Notice the .py file extension.  This indicates that this file is a python script.

To execute this code you need to do the following: 1) load python, and 2) type

```
$ python Week_5_Wed.py
Week5 is here!
```

Notice you did not need to open python to run this script.  You are still in bash.

Let's take this a step further and write a shell script that executed this python script!!!  

Make a bash file called Week_5_Wed.sh

Inside the file type the following:

```
#!/bin/bash
# usage: sh Week_5_Wed.sh
# this executes the program Week_5_Wed.py
# Step 1) load python <- it is possible that python will already be loaded and this will have no effect.  However if python is not loaded you can load it in the script!
# Step 2) run python script

source /u/local/Modules/default/init/bash   # this line tells Hoffman2 where to look for the python module, without this line python will not load
module load python

python Week_5_Wed.py
```

You can convince yourself that python is being loaded in the program by unloading the python module.

```
$ module unload python

The 'python/2.6' module is being unloaded
```

Then run the shell script:

```
$ sh Week_5_Wed.sh
Week5 is here!
```

---

A note about comments.  In python you can use the `#` to make comments just as you did in bash.  You can also comment out blocks of text using triple quotes ` """ ` before and after the block of text.


Make a bash file called Week_5_comment_block.py

Inside the file type the following:

```
#!/usr/bin/env python2
"""
usage: python Week_5_comment_block.py
we are practicing commenting out a block of text with triple quotes
this file prints: Week5 is here!
"""

print 'Week5 is here!'

```

Then run the script.

```
$ python Week_5_comment_block.py
Week5 is here!
```

---

## Dictionaries

A data collection that is unordered, changeable and indexed. They are written with curly brackets, and have keys and values.

Let's learn about sets while using a python script.  Make a script called dictionary.py

```
#!/usr/bin/env python2


"""
usage: python Dictionary.py
We will make a dictionary and print the items in the keys and values
"""
petdict =	{
  "dog": "Fluffy",
  "cat": "Muffin",
  "turtle": "yurtle"
}

print(petdict)
```

Then run the script.

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
```

Dictionaries have keys and values.  For example 'turtle' is a key and yurtle is a value.  We can access the value of a key using the following:

x = petdict["turtle"]

Let's add the following to Dictionary.py:

```
# access the value of the key turtle
x = petdict["turtle"]
print x
```

If we run the script again we get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
```

We can get the same result using .get() and we can test that this is true using an if statement:

Add the following to Dictionary.py:

```
# access the value of the key turtle using .get()
y = petdict.get("turtle")
print y

# we can test that the values are equivalent

if y == x:
  print 'true'
else:
  print 'false'
```
Now if you run the script you get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
yurtle
true
```

If my turtle dies, and I get a new one name spike I can update my dictionary do the key `turtle` now returns the value `spike`.

Add the following to Dictionary.py:

```
# Change the value of the key turtle
petdict["turtle"] = "Spike"
print(petdict)
```

Now if you run the script you get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
yurtle
true
{'turtle': 'Spike', 'dog': 'Fluffy', 'cat': 'Muffin'}
```

You can use a for loop to print each key name in the dictionary.

Add the following to Dictionary.py:

```
# loop through the key names in a dictionary:

for x in petdict:
        print(x)

```

Now if you run the script you get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
yurtle
true
{'turtle': 'Spike', 'dog': 'Fluffy', 'cat': 'Muffin'}
turtle
dog
cat
```

You can use a for loop to print each value in the dictionary.

Add the following to Dictionary.py:

```
# loop through the value in a dictionary using two equivalent methods:

for x in petdict:
        print(petdict[x])

for x in petdict.values():
        print(x)
```
Now if you run the script you get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
yurtle
true
{'turtle': 'Spike', 'dog': 'Fluffy', 'cat': 'Muffin'}
turtle
dog
cat
Spike
Fluffy
Muffin
Spike
Fluffy
Muffin
```

You can also loop through the dictionary and print both the key word and the value. Try this by adding the following to to Dictionary.py:

```
# loop through both the key and the value using the following:

for x, y in petdict.items():
        print x, y
```

Now if you run the script you get the following:

```
$ python Dictionary.py
{'turtle': 'yurtle', 'dog': 'Fluffy', 'cat': 'Muffin'}
yurtle
yurtle
true
{'turtle': 'Spike', 'dog': 'Fluffy', 'cat': 'Muffin'}
turtle
dog
cat
Spike
Fluffy
Muffin
Spike
Fluffy
Muffin
turtle Spike
dog Fluffy
cat Muffin
```

---

## Loading libraries and data

Python [libraries](https://docs.python.org/3/library/) are sets of built-in methods and functions that allow you to perform actions.  Today we will play with a commonly used and very powerful library called [numpy](https://www.numpy.org/).

To load libraries we need to use the following text:

```
import numpy
```

If you are importing a different library you would use that library name rather then numpy.

Let's start a new python script called libs_and_data.py.  In this script add a shebang and import numpy.

```
#!/usr/bin/env python2
"""
usage: python libs_and_data.py
we are playing with numpy and data importing
"""

import numpy

```

Copy the file `/u/home/class/c177/c177-i0/classdata/In_class/Week5/Wednesday/data/inflammation-01.csv` to <your_initials>\_Week5_Wednesday.

We are now going to import this file by adding the following to libs_and_data.py:

```
# load the .csv file as a numpy.array using the function numpy.loadtxt(), as a delimiter and store the data in a variable called data

data = numpy.loadtxt(fname='inflammation-01.csv', delimiter=',')

print data
```

The output should look like this:

```
[[ 0.  0.  1. ...,  3.  0.  0.]
 [ 0.  1.  2. ...,  1.  0.  1.]
 [ 0.  1.  1. ...,  2.  1.  1.]
 ...,
 [ 0.  1.  1. ...,  1.  1.  1.]
 [ 0.  0.  0. ...,  0.  2.  0.]
 [ 0.  0.  1. ...,  1.  1.  0.]]
```
Only a few rows and columns are shown, by default and ... is a stand-in for elements in big arrays. Python displays numbers as 1. instead of 1.0 if there is nothing after the decimal point.

We can verify the data type and the data shape (dimensions of the array).

Adding the following to libs_and_data.py:

```
# what type of thing is data
print(type(data))

# what are the dimensions of data
print(data.shape)
```

If we run the script we will learn that we have a numpy n dimensional array and it is 60 rows by 40 columns.

```
<type 'numpy.ndarray'>
(60, 40)
```

If we want to get a single number from the array, we must provide an index in square brackets after the variable name. Our data has two dimensions, so we will need to use two indices to refer to one specific value:

Adding the following to libs_and_data.py:

```
# print the first value (row 0 and column 0) and the middle value of the array (row 30 and column 20)

print('first value in data:', data[0, 0])
print('middle value in data:', data[30, 20])
```

If we run the script we will learn that:

```
first value in data: 0.0
middle value in data: 13.0
```

__Slicing data__: We can subset the data by indicating which parts of the array we want to keep.  We need to specify the index range that we want to keep.

So if we want to keep the first 4 rows and the first ten columns we would do the following:

Add this to libs_and_data.py:

```
"""
print the first 4 rows and first ten columns
0:4 means “Start at index 0 and go up to, but not including, index 4.”
0:10 means “Start at index 0 and go up to, but not including, index 10.
"""

print(data[0:4, 0:10])
```

The new output is

```
[[ 0.  0.  1.  3.  1.  2.  4.  7.  8.  3.]
 [ 0.  1.  2.  1.  2.  1.  3.  2.  2.  6.]
 [ 0.  1.  1.  3.  3.  2.  6.  2.  5.  9.]
 [ 0.  0.  2.  0.  4.  2.  2.  1.  6.  7.]]
```


If we wanted to take the five rows that start at row 6 and the first 10 colums we would do the following:

Add this to libs_and_data.py:

```
"""
print the five rows starting at row 6 rows and first ten columns
5:10 means “Start at index 5 and go up to, but not including, index 10.”
0:10 means “Start at index 0 and go up to, but not including, index 10.
"""

print(data[5:10, 0:10])
```

The new output is:

```
[[ 0.  0.  1.  2.  2.  4.  2.  1.  6.  4.]
 [ 0.  0.  2.  2.  4.  2.  2.  5.  5.  8.]
 [ 0.  0.  1.  2.  3.  1.  2.  3.  5.  3.]
 [ 0.  0.  0.  3.  1.  5.  6.  5.  5.  8.]
 [ 0.  1.  1.  2.  1.  3.  5.  3.  5.  8.]]
 ```

 We don't have to specify the upper and lower bound on the data using slice.  What the heck does that mean?  

 For example, if we are selection rows 1 - 3 we can indicate that we want 0:3 or just :3 and omit the zero.  Python knows that you mean 0.

 If we are selecting column 36 to the end of the array we can just indicate 36: and python will know what we want everything from 36 onward.  

 Add this to libs_and_data.py:

 ```
 """
 print the three rows starting at row 1 rows and all of the columns from 36 to the end
 :3 means “Start at index 0 and go up to, but not including, index 3.”
 36: means “Start at index 36 and go to the last index.
 """

 print(data[:3, 36:])
 ```

 The new output is:

 ```
 [[ 2.  3.  0.  0.]
 [ 1.  1.  0.  1.]
 [ 2.  2.  1.  1.]]
 ```

This output can be saved in a variable as follows:

Add this to libs_and_data.py:

```
"""
Store the subset of the array above in a variable called subset1.
Print the text subset1 is: and then print subset1
"""

subset1 = data[:3, 36:]
print('subset1 is:')
print(subset1)
```

---

## Making files and storing data in those files

We are going to make two new files called subset1_ugly.txt and subset1_cleaner.txt to store the new numpy array.

```
"""
numpy.savetxt('file to write', array variable name, delimiter ='how you want the indices to be separated')
This will print out a lot of decimal places....
"""
numpy.savetxt('subset1_ugly.txt', subset1, delimiter =', ')

"""
We can add an additional field to this command called fmt. It will specify how we want the data to b formatted.  In the following example we want to set the floating point precision to three decimal places.  Don't worry about what fmt does for now.  We will revisit it if it becomes useful for your project.
"""
numpy.savetxt("subset1_cleaner.txt", subset1, fmt="%2.3f", delimiter=",")
```

We can also just open files and write text.  __Note__ that this will not work for writing numpy arrays to files.

Add this to libs_and_data.py:

```
"""
Make a new file called f using open("file name", "w+").  The "w" is for read. The "+" indicates that a new file needs to be written if it does not already exist.   

Note that we can open a file using open("file name", "r") the "r" is for read, or add to a new file using open("file name", "a") the "a" is for append.

We will then store subset one in the file using f.write()

Then we will close the file using f.close()

"""
f = open("I_wrote_a_text_file_in_python.txt", "w+")
f.write("numpy arrays do not play well with .write, but look I made a new text file!")
f.close()
```



___

## In class exercises

Answer the following in a text file called Week5_inclass.txt and add them to your ''<your_initials>\_Week5_Wednesday' directory.

__1.__ Why are we specifying python2 in the shebang? _Hint_ which version of python are we using?  How do we know which version of python we are using, what is the command to find out?

__2.__ Which command prompt to you expect for bash?  Which command prompt do you expect for python?

__3.__ With the exception of the shebang what does the `#` symbol indicate to bash and python?

__4.__  What is the difference between commenting with `#` and triple quotes in python?

__5.__ If the starting petdict for each command is:

petdict =	{
  "dog": "Fluffy",
  "cat": "Muffin",
  "turtle": "yurtle"
}

Indicate the output of the following commands.  __Hint__ these are very similar to the commands used for list.


if "dog" in petdict:
  print("Yes, 'dog' is one of the keys in the petdict dictionary")


print(len(petdict))


petdict["fish"] = "bubbles"

print(petdict)


petdict.pop("dog")

print(petdict)

petdict.popitem()

print(petdict)


del petdict["dog"]

print(petdict)

del petdict

print(petdict)


petdict.clear()

print(petdict)

mydict = petdict.copy()

print(mydict)


mydict = dict(petdict)

print(mydict)

petdict = dict(fish="bubbles", dog="fluffy", cat="scratches")

\# note that keywords are not string literal

\# note the use of equals rather than colon for the assignment

print(petdict)

__6__. Look at the inflammation-01.csv data in bash (__hint__ use head, cat, less, etc).  What did the numpy array do to the data? For example, comment on the presence of floats and commas.

---

Add the following scripts to the '<your_initials>\_Week5_Wednesday' directory

__1.__ Write a python script called numbers_dict.py that contains a dictionary where the keys are the words for the numbers one - ten and the values are the corresponding numbers 1 -10. Then print the keys and values so that the output reads:

```
one = 1
two = 2
etc....
```

__2.__ Write a python script called numpy_csv2.py that imports the library numpy, imports the datafile `/u/home/class/c177/c177-i0/classdata/In_class/Week5/Wednesday/data/inflammation-02.csv` and stores it in a variable, and performs the following actions on the datafile:

  a. prints the shape of the data
  b. Slices the first 15 rows and all of the columns and stores them in a variable called slice1
  c. Print text that indicates that you slices the first 15 rows of the data set and then print the dataset.

__3.__ Write a python script called write_new_text.py that makes a new text file called new_text.txt and prints a sentence to the file before closing the file.  __Hint:__ use open(), .write(), and .close().


__4.__ Write a shell script called Week_5_Wed_master.sh that runs all of the scripts contained in ''<your_initials>\_Week5_Wednesday'. _Hint1_ You will need to load python. _Hint2:_ You will need to write a for loop.  It will be similar to the following, but instead of printing the file name it will run python on the file name.

```
for x in \*.py
do
  echo $x
done
```
