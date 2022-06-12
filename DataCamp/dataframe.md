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


# planets_df and rings_vector are pre-loaded in your workspace
data.frame(planets_df)

planets_df[rings_vector, ]
# Adapt the code to select all columns for planets with rings
planets_df[rings_vector, "name"]
