You can pinpoint an element's position in a vector by its index. The first element has index 1, the second has index 2, and so on.

You can select one or more elements from a vector by placing the index, or a vector of indexes, inside square brackets. age[1] selects the first element from the age vector, and age[c(2, 3)] subsets the second and third elements. 

age <- c(32, 26, 89)

age[1]

age[c(2,3)]

32

26 89

You can assign names to the elements of a vector with the names() function. This provides a clearer view of what the data represents. 

age <- c(32, 26, 89)

names(age) <- c("Bob", "Joy", "Rex")

age

Bob Joy Rex

 32  26  89

You can subset a named vector with a vector containing the names of the elements you wish to select. 

age[c("Bob", "Rex")]

32 89
