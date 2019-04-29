# What You Should Know For Lecture: Week 5

## Monday:

### Announcements-

__Homework__

Any exercises not completed in class will be due Wednesday at 11 pm.   There will be a HW 5 assignment due during discussion week6.

__Project__

_During discussion_ this week you will start a GitHub repo for your project and you will work on your Readme. Your homework will be related to generating your project readme.

_Today in class_ we will spend 20 - 30 min finalizing groups and projects.  May of you have your own project ideas.  For the rest of you, there are several projects that need people.

1. Gaurav's shiny app educational simulations
2. Zack's fishbase tools
3. Chris's PUMA expansion pack
4. CURE Phylogenetic tree taxon/fasta file retrieval tool?

#### First Activity:

On a piece of paper, write down:

```
Your name

Your project idea(s)

Name of person to work with (if you do not have a person

no worries we will find you a person)
```

Based on the info in the cards we will form groups.

#### Second Activity

Meet with your group for a few minutes.  Get to know each other.  Exchange email details etc. Talk about plans of attack.

---

## Python

__print__ revisited

Let's store the following variables:

```
>>> a = 'canis'
>>> b = 'familiaris'
>>> weight_lbs = 55
```

Let's play with `print` as we did last time, we can also use `print()` and separate variables with a `+``

```
>>> print(a+b+weight_lbs)
canis familiaris 55
```
We can also do math and add `'text'`, but we need to separate variables, equations and text with a `,` and not use `()`.

```
>> print 'my', a, b, 'weighs', 2.2 * weight_lbs , 'kilograms'
my canis familiaris weighs 121.00000000000001 kilograms
```

We can also round the resulting floating point number (float) with the following:

To the nearest whole number:
round(number)

```
>>> round(2.3333333)
2
>>> round(2.6333333)
3
```

To a specified number of decimal places:
```
>>> round(2.3333333, 2)
2.33
>>> round(2.6333333, 5)
2.63333
```

Here is an example for the print command above.  We will round the number of kilograms to 1 decimal place:

```
>> print('my'+ a + b+ 'weighs'+ round(2.2 * weight_lbs, 1)+ 'kilograms')
my canis familiaris weighs 121.00000000000001 kilograms
```
___

### Python collections: List, Tuple, Set, Dictionary

These are different kinds of data types in python.  Today we will learn about Lists and Tuples.

A _List_ is ordered and changeable and allows duplicate members. It is writen in `[]`.  For example:

```
>>> fruit = ["bell peppers", "pumpkin", "grapes", "apples", "bananas"]
```
We can print this entire list by doing the following:

```
>>> print(fruit)
['bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas']
```

If we only want to print the first item in this list we would do the following:

```
>>> print(fruit[0])
bell peppers
```

We could also change the first item of the list and print it.

```
>>> fruit[0] = "red bell peppers"
>>> print(fruit[0])
red bell peppers
>>> print(fruit)
['red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas']
```

You can find out how many things are in a list by typing:

```
>>> print(len(fruit))
5
```

You can add things to the list as follows:

```
>>> fruit.append("satsuma")
>>> print(fruit)
['red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas', 'satsuma']
```

If you wanted to add something to a specific position (e.g. the 2 place in your list) you would do the following:

```
>>> fruit.insert(1, "cherries")
>>> print(fruit)
['red bell peppers', 'cherries', 'pumpkin', 'grapes', 'apples', 'bananas', 'satsuma']
```

And you can delete things from your list with .remove():

```
>>> fruit.remove("bananas")
>>> print(fruit)
['red bell peppers', 'cherries', 'pumpkin', 'grapes', 'apples', 'satsuma']
```

You can also use .pop() which either removes the last item from the list

```
>>> fruit.pop()
'satsuma'
>>> print(fruit)
['red bell peppers', 'cherries', 'pumpkin', 'grapes', 'apples']
```

or an item specified by position:

```
>>> fruit.pop(3)
'grapes'
>>> print(fruit)
['red bell peppers', 'cherries', 'pumpkin', 'apples']
```

In the example above grape was the fourth item.

`del` can remove items by position

```
>>> del fruit[0]
>>> print(fruit)
['red bell peppers', 'cherries', 'apples', 'satsuma']
>>>
```

`del` can completely delete the List

```
>>> del fruit
>>> print(fruit)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'fruit' is not defined
```

`clear` will empty a List

```
>>> fruit
['red bell peppers', 'cherries', 'pumpkin', 'grapes', 'apples', 'bananas', 'satsuma']
>>> fruit.clear()
>>> fruit
[]

```

You can also make a list by doing the following:

```
>>> fruit = list(('red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas')) # note the double round-brackets
>>> fruit
['red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas']
```



We used most of the list methods for python.  There are a few that we did not try but the descriptions can be found below:

```
Method	Description
append()	Adds an element at the end of the list
clear()	Removes all the elements from the list
copy()	Returns a copy of the list
count()	Returns the number of elements with the specified value
extend()	Add the elements of a list (or any iterable), to the end of the current list
index()	Returns the index of the first element with the specified value
insert()	Adds an element at the specified position
pop()	Removes the element at the specified position
remove()	Removes the item with the specified value
reverse()	Reverses the order of the list
sort()	Sorts the list
```
___

A _Tuple_ is ordered and __un__ changeable. It is writTen in `()`.  For example:

```
>>> veggie = ("carrot", "celery", "lettuce")
>>> print(veggie)
('carrot', 'celery', 'lettuce')
```

If we only want to print the first item in this tuple we would do the following:

```
>>> print(fruit[0])
carrot
```

I hope this is familiar...

Once a tuple is created, you cannot add items to it, you cannot delete items from it. Tuples are unchangeable.

You can delete the tuple with `del`

```
>>> del veggie
>>> print(veggie)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'veggie' is not defined
```

You can also make a tuple using the following:

```
>>> veggie = tuple(("carrot", "celery", "lettuce")) # note the double round-brackets
>>> print(veggie)
('carrot', 'celery', 'lettuce')
```

Python has two built-in methods that you can use on tuples.

```
Method	Description
count()	Returns the number of times a specified value occurs in a tuple
index()	Searches the tuple for a specified value and returns the position of where it was found
```
___
### For loops in Python

Similar to Bash, we can run for loops in python.

Remember the list of fruit from above:

```
>>> print(fruit)
['red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas']
```

We can print each item in the list using a for loop.

```
>>> for x in fruit:
...     print(x)
...
red bell peppers
pumpkin
grapes
apples
bananas
```

Python requires an indent in your for loop.  If it is missing you will get an error:

```
>>> for x in fruit:
... print (x)
  File "<stdin>", line 2
    print (x)
        ^
IndentationError: expected an indented block
```
___


### If statements in python

Much like bash we can also use conditionals in python to check if something exists.

Here is an example using items in the list `fruit`.

```
>>> if "apples" in fruit:
...     print("Yes, 'apples' is in the fruits list")
...
Yes, 'apples' is in the fruits list
```

In the example above, if the item does not exist it will return nothing.

```
>>> if "peas" in fruit:
...     print("Yes, 'peass' is in the fruits list")
... else:
...     print("no, 'peas' is not in the fruits list")
...
no, 'peas' is not in the fruits list
```

We can also use logical statement:

```
>>> if 5 > 2:
...   print("Five is greater than two!")
...
Five is greater than two!
>>> if 2 > 5:
...   print("Five is greater than two!")
...
>>>
```

You can have multiple logical statements with `and` `or` and `not`

```
>>> if 5 > 2 and 6 !=7:
...   print("everything is right with the world")
...
everything is right with the world
```

```
>>> x = 1
>>> y = 4
>>> if not( x != 1 or y != 4 ):
...   print("ok")
...
ok
>>> if not( x == 1 or y == 4 ):
...   print("no way")
...
>>>
```

___

## In class exercises

__Please__ add your responses to a text file called <your_initials>\_week5_inclass.txt.  When you finish, please copy the text file to `/u/home/class/c177/c177-i0/classdata/In_class/Week5/Monday`

__1.__ Describe your Term project in 1 sentence.  Who is in your group?  What is their email address.

__2.__ Store 2 strings of characters and one integer in  3 different variables.  Using print(), generate a sentence with at least 2 additional bits of 'text' and one equation that uses a float.  For this equation use round() the float output to 3 decimal places.  This must be different from the example given in the text above.

  Provide the print() command and the output.

__3.__ What value associated with the first item in a list (e.g. is it a 1 or a 0)?  In the fruit list

`fruit = ['red bell peppers', 'pumpkin', 'grapes', 'apples', 'bananas']`

  which item is number 3?  What command would you use to verify this?

  How would you print this list in reverse? Give the command and the output.

  What happens when you sort this list?

__4.__ You can count the length of lists and tuples using the same command. You can also return the item in a specific position of a list or a tuple with the same command.  Make a list and a tuple that contain 5 items each.  Print the length of the tuple and the list, and also return the fourth item for each.  Give the commands and the output.

__5.__ How do for loops differ between bash and python? How do if statements differ between bash and python? (Hint consider indentation, but this is not the only difference)

__6.__ Make a list of 5 items that you would take to the beach. Write a for loop that prints each item in the list, a tab, and the text 'check'. The out put should look something like:

```
sunglasses  check
flip flops  check
surf board  check
book        check
towel       check
```

  Provide the for loop and the output.

__7.__ Make a tuple of 6 letters between a and z. Write a for loop with and if statement that prints the value of the item if it is not a, b, m, or k.

  Provide the for loop / if statement and the output.
