Only planets with rings (2)
You probably remember from high school that some planets in our solar system have rings and others do not. Unfortunately you can not recall their names. Could R help you out?

If you type rings_vector in the console, you get:

[1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
This means that the first four observations (or planets) do not have a ring (FALSE), but the other four do (TRUE). However, you do not get a nice overview of the names of these planets, their diameter, etc. Let's try to use rings_vector to select the data for the four planets with rings.

Instructions
100 XP
The code in the editor selects the name column of all planets that have rings. Adapt the code so that instead of only the name column, all columns for planets that have rings are selected.



Take Hint (-30 XP)
Incorrect Submission
Have you correctly adapted the code to select all columns for the planets that have rings? You can use planets_df[rings_vector, ]. Make sure to include the comma here, it's crucial!


### planets_df and rings_vector are pre-loaded in your workspace
data.frame(planets_df)

planets_df[rings_vector, ]
### Adapt the code to select all columns for planets with rings
planets_df[rings_vector, "name"]


Only planets with rings but shorter
So what exactly did you learn in the previous exercises? You selected a subset from a data frame (planets_df) based on whether or not a certain condition was true (rings or no rings), and you managed to pull out all relevant data. Pretty awesome! By now, NASA is probably already flirting with your CV ;-).

Now, let us move up one level and use the function subset(). You should see the subset() function as a short-cut to do exactly the same as what you did in the previous exercises.

subset(my_df, subset = some_condition)
The first argument of subset() specifies the dataset for which you want a subset. By adding the second argument, you give R the necessary information and conditions to select the correct subset.

The code below will give the exact same result as you got in the previous exercise, but this time, you didn't need the rings_vector!

subset(planets_df, subset = rings)
Instructions
100 XP
Use subset() on planets_df to select planets that have a diameter smaller than Earth. Because the diameter variable is a relative measure of the planet's diameter w.r.t that of planet Earth, your condition is diameter < 1.

### planets_df is pre-loaded in your workspace
data.frame(planets_df)
### Select planets with diameter < 1
subset(planets_df,subset= diameter < 1)


Sorting
Making and creating rankings is one of mankind's favorite affairs. These rankings can be useful (best universities in the world), entertaining (most influential movie stars) or pointless (best 007 look-a-like).

In data analysis you can sort your data according to a certain variable in the dataset. In R, this is done with the help of the function order().

order() is a function that gives you the ranked position of each element when it is applied on a variable, such as a vector for example:

a <- c(100, 10, 1000)
order(a)
[1] 2 1 3
10, which is the second element in a, is the smallest element, so 2 comes first in the output of order(a). 100, which is the first element in a is the second smallest element, so 1 comes second in the output of order(a).

This means we can use the output of order(a) to reshuffle a:

a[order(a)]
[1]   10  100 1000
Instructions
100 XP
Experiment with the order() function in the console. Submit the answer when you are ready to continue.

### Play around with the order function in the console
a<-c(1,10,5)
order(a)
a[order(a)]


Sorting your data frame
Alright, now that you understand the order() function, let us do something useful with it. You would like to rearrange your data frame such that it starts with the smallest planet and ends with the largest one. A sort on the diameter column.

Instructions
100 XP
Call order() on planets_df$diameter (the diameter column of planets_df). Store the result as positions.
Now reshuffle planets_df with the positions vector as row indexes inside square brackets. Keep all columns. Simply print out the result.


Take Hint (-30 XP)
Incorrect Submission
Use planets_df[positions, ] to sort planets_df; the comma inside the square brackets is crucial!


### planets_df is pre-loaded in your workspace
data.frame(planets_df)
### Use order() to create positions
positions <-  order(planets_df$diameter)

### Use positions to sort planets_df
planets_df[positions,]

