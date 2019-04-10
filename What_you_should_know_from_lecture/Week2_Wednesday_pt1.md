# What You Should Know From Lecture: Week 2

### Wednesday pt 1:
#### Announcements-

__Please__, before next lab you need to go to the help desk located at WGYoung 4351 to get register and be able to use the computers in the lab. This will only take 5 minutes!

__If you are a Mac user__ please bring it to lab. In case you are a pc users you also need to find a way to transfer files. Here are different options to transfer files here are a few good options with instructions on how to install them.

__Please__ try to install thing by your own. If you encounter problems please come to office hours.

Cyberduck: https://cyberduck.io/download/

Globus: https://dechavezv.github.io/eeb_C177_2019//lecture_pdfs/week2_Lecture_Globus.pdf

PuTTy (https://www.hoffman2.idre.ucla.edu/access/putty/)


__You__ have a Homework due Monday before class.  An email will be sent out shortly.

___

It is really annoying to realize that there is a typo in a command, particularly if it is at the beginning of a long  stretch of text.  Keyboard shortcuts are a great way to jump around in the command line.

up arrow until you find a long stretch of command.  Now try the following and see what happens.

	ctrl A
    -> go to begning of line
	ctrl E
    -> go to end of line
	ctrl L
    -> clear screen
	ctrl U
    -> clear line before cursor
	ctrl K
    -> clear line after cursor
	ctrl C
    -> kill program
	ctrl D
    -> exit shell
	Alt + F
    -> move forward one word (Mac esc F)
	Alt + B
    -> move backward one word (Mac esc B)

---
Sorting can be very important when you are dealing with biological data.  We can sort in the shell using the command 'sort'.  Copy the following directory `/u/home/class/c177/c177-i0/classdata/Week2` to your home directory.  cd into that directory and type the following
```
$ sort sort_ex_1.txt
```
You should get the following:

```
Armant
Blue Heeler
Bruno Jura Hound
Cesky Fousek
Griffon Bleu de Gascogne
Labradoodle
Maltese
Pachon Navarro
Ratonero Valenciano
Segugio Italiano
Stabyhoun
Treeing Tennessee Brindle
```
The original file was in this order

```
$ head -15 sort_ex_1.txt
Griffon Bleu de Gascogne
Segugio Italiano
Blue Heeler
Pachon Navarro
Treeing Tennessee Brindle
Ratonero Valenciano
Maltese
Labradoodle
Bruno Jura Hound
Cesky Fousek
Armant
```
---

We can run multiple commands from the same command line on the same file or command line output (e.g. ls).  The magic that allows this to happen is the pipe "|".  Essentially we can tell the shell to do an operation on a file or a command line output and before printing out the result of the command, we can run another command on that result.

Lets try this with wc -l
```
wc -l *.txt
21 README.populations.modified.txt
11 sort_ex_1.txt
31 sort_ex_2.txt
 4 uniq_color1.txt
 2 uniq_color2.txt
 1 uniq_color3.txt
97 uniq_ex_1.txt
167 total
```

We can then see what happens if we sort the output
```
wc -l *.txt | sort
  11 sort_ex_1.txt
 167 total
   1 uniq_color3.txt
  21 README.populations.modified.txt
   2 uniq_color2.txt
  31 sort_ex_2.txt
   4 uniq_color1.txt
  97 uniq_ex_1.txt
```
Try to sort by number (sort -n)

```
wc -l \*.txt | sort -n
   1 uniq_color3.txt
   2 uniq_color2.txt
   4 uniq_color1.txt
  11 sort_ex_1.txt
  21 README.populations.modified.txt
  31 sort_ex_2.txt
  97 uniq_ex_1.txt
 167 total
```
We can then choose a number of output lines to keep
```
wc -l *.txt | sort | head -5
  11 sort_ex_1.txt
```

We can then redirect that to a file
```
wc -l *.txt | sort | head -5 > pipe.txt
```
We can use the redirect '<' (__note__ this is not'>') to run an command on a file.

What is the difference between

```
$ wc -l sort_ex_1.txt
11 sort_ex_1.txt
```
and

```
$ wc -l < sort_ex_1.txt
11
```

_hint_ the shell does not return the file name.

We can redirect in two directions.  How are these things different?

```
$ wc -l pipe.txt > redirect_test1.txt
$ head redirect_test1.txt
11 sort_ex_1.txt
$ wc -l < pipe.txt > redirect_test2.txt
$ head redirect_test2.txt
11
```
What do the following commands do?
```
wc -l | sort -n < pipe.txt
wc -l  < sort_ex_1.txt | sort -n
cat sort_ex_1.txt | head -n 5 > heads.txt
cat sort_ex_1.txt | head -n 5 | tail -n 3  > heads_tails.txt
cat sort_ex_1.txt | head -n 5 | tail -n 3 | sort -r > heads_tails.txt
```
---
Another very useful command is 'cut'. Cut chops sections from each line of a file.
`cut -d -f file`
* -d = delimiter
* -f indicates the column to retain
Try this:
```
cut -d " " -f 2 sort_ex_2.txt > sort_ex_2.test1.txt
```
How does `sort_ex_2.test1.txt` differ from `sort_ex_2.txt` ?

Try this one....

```
	* cut -d " " -f 1 sort_ex_2.txt > sort_ex_2.test2.txt
```
Changing the number after -f changes which column is retained.

---

I use unique all of the time.  If I am trying to find how many occurrences of something are in a datafile, or perhaps I just want to summarize a data file I use 'uniq'

Lets try the following

```
$ uniq uniq_ex_1.txt
```
How does 'uniq_ex_1.txt' change after using this command

```
$ wc -w uniq_ex_1.txt
98 uniq_ex_1.txt
$ uniq uniq_ex_1.txt | wc -w
98

```

Ok, nothing changed but why?  uniq only works on adjacent things that are the same. We have to sort first
```
$ sort uniq_ex_1.txt | uniq
$ sort uniq_ex_1.txt | uniq | wc -w
31
```
It worked this time!
uniq can also be used to count occurrences.

```
$ sort uniq_ex_1.txt | uniq -c
2 1898  
4 1899  
4 1904  
2 1910  
2 1912     
1 1914   
1 1915  
4 1917  
1 1918   
1 1919
3 1919    
1 1927   
1 1933
11 1935              
4 1936   
2 1939   
2 1945  
2 1946    
1 1946          
1 1948          
4 1950  
2 1954  
1 1955    
4 1956   
6 1959  
2 1967  
10 1979  
11 1980  
2 1990   
4 1991   
2 1994  

```
The first column is the count of times things are replicated

Try this:
```
$ uniq -u <(sort uniq_color1.txt uniq_color2.txt uniq_color3.txt)
```

Open each of the uniq_color*.txt files to see what happened.

_hint_ This command extracted and sorted unique lines from several files

Try these and see what happens.
```
$ cat uniq_color1.txt uniq_color2.txt uniq_color3.txt | sort | uniq -c
$ cat uniq_color1.txt <(echo) uniq_color2.txt <(echo) uniq_color3.txt | sort | uniq -c
```
---
Lets revisit wildcards
	* "\*" zero or more characters
	* ? any character single character
		* ls uniq_color?.txt
	* ! not the following character
		* ls uniq_color[!3].txt
	* only some characters
		* ls uniq_color[13].txt
		* ls uniq_color[1-3].txt
---
Grep is an amazing command.  Go to [expalin shell](https://explainshell.com) and try to figure out what it does.  Now do the following:
```
$ grep "Chinese" README.populations
```
		* what happened?  Try the following and predict what will happen

```
$ grep "Chi" README.populations
$ grep "Ch" README.populations
$ what else was added
$ grep "C" README.populations
```
There are really useful grep flags
```
	-e pattern
	-i: Ignore uppercase vs. lowercase.
	-v: Invert match.
	-c: Output count of matching lines only.
	-l: Output matching files only.
	-n: Precede each matching line with a line number.
	-b: A historical curiosity: precede each matching line with a block number.
	-h: Output matching lines without preceding them by file names.
	-s: Output status only.
	-x
	-f file: Take regexes from a file.
```
We can use grep on terminal Output.  Try the following:
```
$ ls | grep sort
$	ls |  grep [3]
$	ls |  grep [a]
$	ls |  grep [A]
```

# Wednesday Challenge

Make a file using the commands that you just learned to replicate README.populations.modified.txt
