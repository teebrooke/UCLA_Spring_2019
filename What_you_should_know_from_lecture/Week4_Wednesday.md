# What You Should Know For Lecture: Week 4

### Wednesday:

#### Announcements-

__Homework__

Any exercises not completed in class will be due Monday. In class exercises from Monday will be due today at 11 pm.   There is also an HW 4 assignment due today by 11 pm.

__Python Tutorials__

Here are a few python tutorial / resources:
https://wiki.python.org/moin/BeginnersGuide/NonProgrammers
https://blog.kowalczyk.info/articles/pqr26/pqr26int.html
https://automatetheboringstuff.com/
http://openbookproject.net/thinkcs/python/english3e/
http://www.mustitz.net/attachments/download/334/Python_Programming_for_Biology_Tim_J_Stevens.pdf
http://www.pythonlearn.com/html-270/
https://datacarpentry.org/semester-biology/materials/python-resources/

__Project__

If you are worried about your project, come to my office hours.  They are after class at the Music Cafe.

---

### Python!

What is python? ["Python is powerful... and fast;
plays well with others;
runs everywhere;
is friendly & easy to learn;
is Open."](https://www.python.org/)

---

#### How to load python on Hoffman2?

Much like we load git in order to run git on Hoffman2 we also have to load python.  There are a lot of versions of python on Hoffman2, for now let's use the default version.

```
$ module load python
```

You can check the version by typing the following:

```
$ python --version
Python 2.6.6
```
Now to launch python type the following:

```
$ python
Python 2.6.6 (r266:84292, Aug 18 2016, 15:13:37)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-17)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

The `>>>` indicates the command prompt.

If you want to quit python type

```
$ python
Python 2.6.6 (r266:84292, Aug 18 2016, 15:13:37)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-17)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> quit()
$
```

---
## Some very basic stuff in python

#### Printing

Much like bash we can to print text to a screen. The command is as follows:

```
>>> print 'Hello World!'
Hello World
```

You can print multiple lines of text as follows:

```
>>> print 'Hello World'; print 'Hope you are well'
Hello World
Hope you are well
```

#### Variables

Also like bash you can store strings of characters in variables.

```
>>> a = 'I live for coffee'
>>> print a
I live for coffee
>>> a
'I live for coffee'
>>> a='I live for coffee'
>>> a
'I live for coffee'
```

You can concatenate variables as follows:

```
>>> b = 'sleep is overrated'
>>> a + b
'I live for coffeesleep is overrated'
```

Python is also a good calculator.  

```
>>> 5 + 7
12
>>> 5.00 + 7
12.0
```

It uses integer (int = whole number), and float (float = with decimal places) variables.  This comes in handy when doing things like division, and you do not have to specify both variables as float variables:

```
>>> 5 / 7
0
>>> 5.0/7
0.7142857142857143
>>> 5.00/7
0.7142857142857143
```

Python discriminates between letters and numbers.  For example:

```
>>> a + 7
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: cannot concatenate 'str' and 'int' objects
>>> a + 7.0
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: cannot concatenate 'str' and 'float' objects

```
---
#### Doing math in python

­Addition: a + b  
Subtraction: a - b

Multiplication: a * b

­Integer Division: a / b

* Note that when division is performed with two integers, only the quotient
is returned (the remainder is ignored.)

­Power: a ** b.

Equals:  a == b

Differs: a != b

Greater: a \> b

Greater or equal: a \>= b

Less than: a \< b

Less than or equal: a \<= b



---

# In class exercises

__Please__ add your responses to a text file called <your_initials>\_week4_inclass.txt.  When you finish, please copy the text file to `/u/home/class/c177/c177-i0/classdata/In_class/Week4/Wednesday`

__1.__ List three websites where you can find help scripting in python.

https://www.tutorialspoint.com/python/python_basic_syntax.htm
https://www.pythonforbeginners.com/commands/
https://www.python.org/about/gettingstarted/



__2.__ What is the command to load python on Hoffman2?  What command runs python on Hoffman2? How do you exit python?

to load python in Hoffman2 you must used module load python
typing python will run it
to exit pyhton you use quit()

__3.__ Write a command to print your first middle and last name on different lines. For example:

Emily

Elizabeth

Curd

print("taylor\nalderete")

__4.__ Bash and python handle variable storage differently.  What is the difference?  __hint:__ I am specifically looking for answers related to white spaces.

bash doesnt like white spaces whereas python can handle them, especially when using loops.

__5.__ What is the difference between int and float variables. If you do not indicate float variables what is not returned during division?

float variable is a decimal
int variable means any intiger 
if you do not indicate float variables a remainder will not show and take the number as an intiger

__6.__ What is the output of:

print 3 * (1 + 3)
12

print '23' + '8'
238

print 23 + 8
31

print '23' + 

error

print 8 < 7
false

print 8 == 7
false

print 8 <= 7
false

print 8 >= 7
true

print 8 > 7
true

__7.__ What commands would give you the following outputs:

pickled cabbage 88

command print 'pickled cabbage 88'

'pickled cabbage 88'

command  print "'pickled cabbage 88'"

__8.__ How does concatenating variables in python differ from in bash?
For example, how would you get the variables storing 'sun' and  'shine' to print 'sunshine' in bash vs python?

In python to concatenate two strings you can use the + sign to concatenate strings like this 'taylor' + 'alderete'
For bash you just write the words right after each other with var. example 
VAR1="Hello,"
VAR2=" World"
VAR3="$VAR1$VAR2"
echo "$VAR3"


__9.__ What does the blue text in a markdown document indicate? 

The blue text indicates important titles. for example in our CV all of our headings were in blue.
