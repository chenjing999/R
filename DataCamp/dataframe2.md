Creating a list
Let us create our first list! To construct a list you use the function list():

my_list <- list(comp1, comp2 ...)
The arguments to the list function are the list components. Remember, these components can be matrices, vectors, other lists, …

Instructions
100 XP
Construct a list, named my_list, that contains the variables my_vector, my_matrix and my_df as list components.


### Vector with numerics from 1 up to 10
my_vector <- 1:10 

### Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

### First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

### Construct list with these different elements:
my_list <- list(my_vector,my_matrix,my_df)



Creating a named list
Well done, you're on a roll!

Just like on your to-do list, you want to avoid not knowing or remembering what the components of your list stand for. That is why you should give names to them:

my_list <- list(name1 = your_comp1, 
                name2 = your_comp2)
This creates a list with components that are named name1, name2, and so on. If you want to name your lists after you've created them, you can use the names() function as you did with vectors. The following commands are fully equivalent to the assignment above:

my_list <- list(your_comp1, your_comp2)
names(my_list) <- c("name1", "name2")
Instructions
100 XP
Instructions
100 XP
Change the code of the previous exercise (see editor) by adding names to the components. Use for my_vector the name vec, for my_matrix the name mat and for my_df the name df.
Print out my_list so you can inspect the output.


### Vector with numerics from 1 up to 10
my_vector <- 1:10 

### Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

### First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

### Adapt list() call to give the components names

#### my_list <- list(my_vector, my_matrix, my_df)
#### names(my_list) <- c("vec","mat","df")

my_list <- list(vec=my_vector, mat=my_matrix,df= my_df)

### Print out my_list
my_list


Creating a named list (2)
Being a huge movie fan (remember your job at LucasFilms), you decide to start storing information on good movies with the help of lists.

Start by creating a list for the movie "The Shining". We have already created the variables mov, act and rev in your R workspace. Feel free to check them out in the console.

Instructions
100 XP
Instructions
100 XP
Complete the code in the editor to create shining_list; it contains three elements:

moviename: a character string with the movie title (stored in mov)
actors: a vector with the main actors' names (stored in act)
reviews: a data frame that contains some reviews (stored in rev)
Do not forget to name the list components accordingly (names are moviename, actors and reviews).

### The variables mov, act and rev are available

### Finish the code to build shining_list
shining_list <- list(moviename = mov,actors=act,reviews=rev)
