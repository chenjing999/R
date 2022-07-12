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

### Comparison operators 

R has several comparison operators that return logical values. 
You can check if one value is equal to another with the ==operator, or 
not equal with !=. 

4 == 4

"book" != "cook"

TRUE

TRUE

< and > check whether values are less than or greater than each other, 
respectively. 

Likewise, <= checks if a value is less than or equal to another, while >= checks if it is greater than or equal to. 

4 >= 8

3 <= 3

FALSE

TRUE

You can also use comparison operators on vectors. 
This creates a Boolean vector that indicates whether each element met the condition or not. 

v <- c("small","large","huge")

big <- v != "small"

big

FALSE  TRUE  TRUE

Finally, Boolean vectors can be used to subset vectors. The Boolean vector big can be used to subset the vector v by placing it in square 
brackets []. 

v[big]

"large" "huge"
