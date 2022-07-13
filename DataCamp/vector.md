### Vector indexing
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

-----Output------:

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


### Lists

In R, a list allows you to gather a variety of objects under one name in an ordered way. These objects can be any type: matrices, vectors, data frames, even other lists! 

Consider the following variables. 

vec <- 1:6

mat <- matrix(1:6, nrows=2)

df <- data.frame(x="one", y=8, z=FALSE)


Passing these variables as arguments to the list() function creates a list containing the three variables as list elements. 

my_list <- list(vec, mat, df)

print(my_list)

[[1]]

 [1]  1  2  3  4  5  6
 
[[2]]

     [,1] [,2] [,3]
     
[1,]    1    3    5

[2,]    2    4    6

[[3]]

     x y     z
     
1  one 8 FALSE


### Summarizing a variable
The summary() function provides an overview of a variable's contents. Passing summary() a character vector returns the number of vector elements. 

summary(c("No", "No", "No", "Yes"))

-----OUTPUT----:

Length        Class       Mode

     4    character  character

Passing summary() a factor returns a named vector containing the count of each factor level. 

f <- factor(c("easy", "hard", "med", "med"))

summary(f)

-----OUTPUT----:

easy hard med
   1    1   2
   
   
### Adding data to a matrix
Columns and rows can be added to matrices using built-in functions. 
Consider the following matrix. 

my_matrix

     [,1] [,2]
[1,]    1    4

[2,]    2    3

[3,]    4    1

rbind() can be used to add additional rows to a matrix. 
To do this, pass the matrix as the first argument to rbind() and a vector containing the new row values as the second. 

rbind(my_matrix, c(6, 7))

     [,1] [,2]

[1,]    1    4

[2,]    2    3

[3,]    4    1

[4,]    6    7

Similarly, cbind() can be used to add columns. 

cbind(my_matrix, 4:6)

     [,1] [,2] [,3]

[1,]    1    4    4

[2,]    2    3    5

[3,]    4    1    6

### Factor levels

When you create factors with factor(), the levels are automatically given the same name as the factor elements.
Consider the following factor v, which contains three levels: one, three, and two. 

vals <- c("one", "two", "three")

v <- factor(vals)

v

one   two   three

Levels: one three two

To rename the levels, apply levels() to the factor, and assign the result to a vector of new levels. 
The new levels must be specified in the same order as the levels they are renaming. 

levels(v) <- c(1, 3, 2) renames the levels of v from one, three, and twoto 1, 3, and 2. 
The new levels are applied to the factor elements, changing the way they appear. 

levels(v) <- c(1, 3, 2)

v

1 2 3

Levels: 1 3 2


### Comparing factors

An ordered factor allows you to compare factor elements using comparison operators. 
Consider the following ordered factor created using the factor() function. 

diff <- c("easy", "hard", "med", "med")

f <- factor(diff, ordered = TRUE, levels=c("easy", "med", "hard"))

f

easy hard med med

Levels: easy med hard

The elements of a factor are selected in the same way as vector elements. 

f[1] returns the first element of the factor f, and f[2] returns the second element. 

c(f[1], f[2], f[3], f[4]) 

"easy" "hard" "med" "med"

Elements can be compared, for example, f[1] > f[2]. 
This returns FALSE because the first element, "easy", is two levels below the second element, "hard". 

f[1] > f[2]

FALSE

Comparing unordered factors returns an error. 

colors <- factor(c("red", "blue", "green", "green"))

colors[1] > colors[2]

NA

Warning message:

In Ops.factor(colors[1], colors[2]) : ‘>’ not meaningful for factors
