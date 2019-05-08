# What You Should Know For Lecture: Week 6

## Wednesday:

### Announcements-

Any exercises not completed in class will be due Monday at 11 pm.   

If you need help, or just want to share your progress, please come to office hours or chat with us during class about your projects.

---
### Today in class

In the /u/home/class/c177/c177-i0/classdata/In_class/Week6/Wednesday/script_file directory is a python script called run_namecount.py, a test file called tax_test.txt and an output directory called ./namecounts.

This script takes a file with this format:

```
gi_EU272527;tax=d:Fungi,p:Ascomycota,c:Eurotiomycetes,o:Eurotiales,f:Trichocomaceae,g:Paecilomyces;
gi_L54118;tax=d:Fungi,p:Basidiomycota,c:Agaricomycetes,o:Boletales,f:Suillaceae,g:Suillus;
gi_GQ165636;tax=d:Fungi,p:Basidiomycota,c:Agaricomycetes,o:Agaricales,f:Cortinariaceae,g:Phaeocollybia;
gi_HQ909094;tax=d:Fungi,p:Ascomycota,c:Saccharomycetes,o:Saccharomycetales,f:Saccharomycodaceae,g:Hanseniaspora;
gi_EU168101;tax=d:Fungi,p:Basidiomycota,c:Agaricomycetes,o:Agaricales,f:Coprinaceae,g:Coprinus;
gi_EU008620;tax=d:Fungi,p:Ascomycota,c:Lecanoromycetes,o:Lecanorales,f:Stereocaulaceae,g:Lepraria;
gi_GU979821;tax=d:Fungi,p:Ascomycota,c:Lecanoromycetes,o:Lecanorales,f:Parmeliaceae,g:Parmelina;
gi_AJ229064;tax=d:Fungi,p:Ascomycota,c:Saccharomycetes,o:Saccharomycetales,f:Saccharomycetaceae,g:Saccharomyces;
gi_JQ085932;tax=d:Fungi,p:Basidiomycota,c:Agaricomycetes,o:Agaricales,f:Inocybaceae,g:Inocybe;
gi_AF414292;tax=d:Fungi,p:Ascomycota,c:Sordariomycetes,o:Hypocreales,f:Hypocreaceae,g:Hypocrea;
```

and counts the occurrences of each taxonomic rank.  The output file looks something like the example below, where the first column is the count of occurrences of a taxonomic rank and the second column is the taxonomic rank (d:domain, c:class, o:order, f:family, g:genus) and name. For example, the domain Fungi (d:Fungi) can be found 9336 times in tax_test.txt, but the genus Scedosporium (g:Scedosporium) occurs only 1 time in tax_test.

```
9336 	d:Fungi
271 	o:Capnodiales
193 	f:Boletaceae
1 	g:Scedosporium
2 	g:Dirinaria
11 	g:Scutellinia
17 	f:Hericiaceae
6 	g:Candelariella
6 	g:Battarrea
3 	g:Seimatosporium
```

# In_class assignment

Your job is to figure out how the code works. The person that wrote the code (Emily...) did a really poor job of commenting the script. There are a number of `#` in the code file where there should be comments describing a step in the program.  For today's assignment, you need to fill in the comment that describes that chunk of code.

Use any means necessary to figure out what is going on (google, talk to a friend, ask me or Daniel). One way to see what is going on is to comment out parts of code and see what does or does not happen. Ask me about this during class if you are confused.

Before you start commenting, please copy the directory /u/home/class/c177/c177-i0/classdata/In_class/Week6/Wednesday/script_file to a safe place in your home directory.  Please rename the python script <your_initials>\_run_namecount.py.  Once you finish commenting the script please copy it to /u/home/class/c177/c177-i0/classdata/In_class/Week6/Wednesday/
