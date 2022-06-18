### Task 1: Instructions
Load the packages and read in the data.

Load the readr and dplyr packages.
Read in the data from the datasets folder using read_csv() and assign it to the variable, wwc_raw. The name of the data file is 2019_WWCFIFA_summary.csv.
Determine the class of wwc_raw and its dimensions. Use glimpse(), summary(), and str() to look its structure.
Good to know
This project lets you apply the skills from Introduction to the Tidyverse, Introduction to Importing Data in R, and Data Cleaning in R. We recommend that you take these courses before starting this project.

wwc is a shortened version of "Women's World Cup".

Helpful links:

RStudio data import cheat sheet
Packages vs. Libraries in R blog post
If you experience odd behavior, you can reset the project by clicking the circular arrow in the bottom-right corner of the screen. Resetting the project will discard all code you have written so be sure to save it offline first.

### Task 2: Instructions
Import data and assign data types.

Use read_csv() to read in the data again. This time parse Round to factor, Date to date, and Venue to factor by setting the col_types argument.
Inspect the data by calling glimpse() and summary().
The dataset is not large - print it and explore.
Helpful links:

read_csv() column parsers
read_csv() parsing dates and times

### Task 3: Instructions
Change all column names to lowercase and remove rows of NA.

Load the tidyr package.
Create wwc_1 by first changing all column names to lowercase, then removing rows of NA.
Get the dimensions of wwc_1, then inspect the first ten and last ten rows.
One way to remove rows of NA is to filter for !is.na(). Filter on a column of data that has non-NA values in all cells except for the cells that are part of the rows of NAs.

Helpful links:

Missing and special values in R
rename_all() documentation (scroll down)
tolower() documentation
filter() documentation
is.na() documentation

### Task 4: Instructions
Find the NA and replace them with correct data.

Using which() and is.na(), find the index value for the NA in the date column of wwc_2 and assign it to index_date. Use [] to subset and view the row with the missing data, then replace the NA with the correct data value (given).
Repeat the process for venue.
A second approach would be to use replace_na().

wwc_2 <-  wwc_1 %>% 
  mutate(date = replace_na(date, "2019-06-09"),
         venue = replace_na(venue, "Groupama Stadium"))
Helpful links:

which() documentation
is.na() documentation
replace_na() documentation

### Task 5: Instructions
Separte data in columns and replace NA.

Create wwc_3 from wwc_2 by calling separate() twice, and then calling replace_na() twice within mutate(). Separate score into home_score and away_score. Separate pks into home_pks and away_pks. Replace the NA in home_pks and away_pks with 0.
Print the data and marvel at your awesome data cleaning skills!
Don't forget to corretly set the convert = and sep = arguments in separate(). If you are stuck, check the hint.

Helpful links:

separate()documentation
mutate()documentation
replace_na() documentation

### Task 6: Instructions
Create a boxplot to look for outliers.

Load the ggplot2 package.
Using wwc_3, create a boxplot of attendance by venue using geom_boxplot(). The first line of code is the call to ggplot() with the correct x and y aesthetics. The second line of code is the call to the boxplot geometry. Do not forget the +.
geom_jitter() is a convenient way to add random variation to the location of each point. This random variation makes overlapping points easier to visualize.

Helpful links:

ggplot2 package
geom_boxplot() documentation
geom_jitter() documentation
theme() documentation

### Task 7: Instructions
Summarize the attendance at each venue and fix the outlier.

Summarize the number of games, minimum attendance, and maximum attendance at each venue in wwc_3.
Use mutate(), and which() within replace(), to update the outlier with the correct value, 57900. Assign the updated dataset to wwc_4.
After updating the outlier, summarize the number of games, minimum attendance, and maximum attendance at each venue and print the summary table.
We are using a different method to replace the outlier here. Check the Helpful links or the hint if you are having difficulty.

Helpful links:

group_by() documentation
summarize() documentation
replace() and mutate() SO Discussion


### Task 8: Instructions
Redo the boxplot from Task 6. This time make it prettier.

Add the correct geometries to create a boxplot of the attendance by venue. Add red, jittered points over the boxplot. Reduce the size of the points to 0.5.
Within labs(), add a title, "Distribution of attendance by stadium", and a subtitle, "2019 FIFA Women's World Cup".
Instead of loading the package forcats, we can call the function with forcats::fct_reorder().

If you're stuck, look back at the code from Task 6 or at the hint.

Helpful links:

ggplot2 labs documentation
coord_flip() documentation
fct_reorder() documentation


### Task 9: Instructions
Make a line plot of venue attendance over the duration of the tournament.

Add the correct x and y aesthetics and color each line by venue.
Add the correct geometry to make a line plot.
Helpful links:

geom_line() documentation


### Task 10: Instructions
Answer the following multiple-choice questions.

Which match had the highest attendance during the tournament?
In what stadium was the match with the highest attendance played?
You might have to do a little more coding to figure out the first question. Use the space below to run more code to help you answer the questions. You can run a cell without checking the entire project by clicking the "Run" button or using Ctrl-Enter.

Helpful links:

arrange() documentation

10. HINT

A quick way to look at the games with the highest attendance is to arrange the attendance in descending order.

wwc_4 %>% arrange(desc(attendance))
