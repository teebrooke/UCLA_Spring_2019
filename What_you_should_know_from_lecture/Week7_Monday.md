# What You Should Know For Lecture: Week 7

## Monday:

### Announcements-

Any exercises not completed in class will be due Wednesday at 11 pm.

__Projects__

If you need help, or just want to share your progress, please come to office hours or chat with us during class about your projects.

We have added a folder of test script bits in the Term_project folder.  Check it out!  Could be super helpful.

---

__Fantastic R resources:__

_This one is great for shiny project people_

https://bookdown.org/yihui/rmarkdown/notebook.html

_This is great for learning the tidyverse_

https://r4ds.had.co.nz/

---
### Today in class

Today in class you are going go through several R tutorials to learn about using [R notebooks](https://bookdown.org/yihui/rmarkdown/notebook.html) in R studio, the basics of the [tidyverse](https://r4ds.had.co.nz/), and how to play with data in the tidyverse.

http://www.storybench.org/getting-started-r-rstudio-notebooks/

http://www.storybench.org/getting-started-with-tidyverse-in-r/

http://www.storybench.org/how-to-explore-a-dataset-from-the-fivethirtyeight-package-in-r/

# There is a problem with the fivethirtyeight tutorials

For the code:

```
murders_final_sort %
  arrange(
    change)
murders_final_sort
```


Use this instead:

```
murders_final_sort <- murders_final %>%
  arrange(
    change)
murders_final_sort

```

---
### In class exercises

Make R notebooks for each of the three tutorials.  Name these tutorials:

<your_initials>\_R_notebook.Rmd

<your_initials>\_getting_started_tidyverse.Rmd

<your_initials>\_fivethirtyeight.Rmd

Copy these R notebook files to the ~/classdata/In_class/Week7/Monday directory
