# Week 1

## R

- Statistical software (programming language) for analysis and reporting of data

## Statistical Computing

- The practice of efficiently analysing data through digital means

## Help commands

```r
help.start()  # general help

# help for mean method

help(mean)  # or
??mean  # or
?mean
```

## Setting up workspace

```r
setwd("/path/to/files")  # set directory

getwd()  # get directory
```

## R syntax

- R is object-oriented

- Case sensitive variables and functions

- Accessing an undefined variable results in an error

- Indexing starts at 1

- `<-` or `=` assigns an r-value

- `;` seperates two or more operations on a single line - optional

- Single or double quotes can be used for strings - pairs must match

- append `L` to number to signify integer

## Division

```r
x <- 5
y <- 3

x / y  # division (1.666667)

x %/% y  # floor (integer) division (1)

x %% y  # x mod y (2)

```

## Ranges

- Represents a sequence of numbers

- Operations can be performed on ranges

```r
x <- 5:7  # ranges from 5 to 7

y <- 3

x %/% y  # 1 2 2

```

## R scalar types

- numeric

- integer

- character

- logical

- `class` method reveals the type of an object

## R data structures

- Vectors (homogenous elements)

- Matrices (multi-dimensional vector)

- Data frames (similar to data sets)

- Arrays

- Lists (mixed elements)

## Vectors

- Sequence of values of the same type

- Patterns can be programmatically generated

```r
c(1, 4, 5, 5)  # vector of numerics

c(1L, 4L, 2L)  # vector of integers

c("test", "foo", "bar")  # vector of characters

c(T, F, F)  # vector of logicals

rep(0, 5)  # vector with five 0 elements

seq(0, 5)  # vector with elements 0 to 5

seq(1, 5, length=9)  # generate 9 elements (increment by 0.5)

seq(1, 5, by=0.2)  # increment by 0.2 (generate 21 elements)

```

## Data frames

- Useful for storing tabular data

- Access column data via `df$col` - returns vector

- R has a built-in `Orange` dataframe

# Week 2

## Vectors

- R is a vector-based language

- Use `str()` (structure) function to see structure of vector

    - Type of elements

    - Dimensions (height, width)

    - Prints elements contained in vector

- Use `length()` to find length of vector

- Use `is.vector()` to determine whether the object is a vector

- Use indexing to access vector members

    - Indexing starts at 1

    - Negative indices discards the `|n|th` element from the vector if it exists

- Get multiple vector elements by passing in numeric vector of indices:

    - Example: `vec[c(1, 3)]  # get 1st and third element`

    - Negative indices can only be used with `0`

    - Non-integer indices are truncated `3.54` -> `3`

- Get range of vector elements:

    - Example: `vec[1:4]  # get elements 1 to 4 inclusive` 

    - Example: `vec[-(1:4)]  # get all elements EXCEPT 1 to 4 inclusive` 

## Modifying vectors

- Vectors elements can be reassigned

- Vectors can be reassigned parts of themselves

```R
test <- c(1, 2, 3, 4)

test[4] <- 5  # last vector element is now 5

test <- test[1:3]  # truncate vector to first 3 elements

```

- Vectors can be sorted using `sort()` function (creates copy)

    - Example: `sort(v, decreasing=TRUE)  # make descending sorted copy`

- Vector members can be named (and indexed accordingly)

```R
v <- c("John", "Doe")
names(v) <- c("FirstName", "LastName")

v["FirstName"]  # John

```

## Vector coersion

- Vectors of different types can be combined to the most general type of either vector:

- Known as equation

```R
vec <- c(1, 2, 3)

class(vec)  # numeric

vec[3] <- "hello"

class(vec)  # character
```

## Vector operations

- Performed member-wise

- Members are recyled from a shorter vector, provided the longer vector's length is a multiple of the short vector (warning is displayed if not the case)

- `all()` and `any()` functions can be used to check all members for condition

- `%in%` operator checks whether value is a vector member

- `head()` and `tail()` functions returns first/last 6 elements of vector

    - `tail()` takes additional parameter for amount of last elements

- Passing condition involving vector in index will return all elements that satisfy condition

## Character vector operations

- Use the `paste()` function to combine character elements

    - Example: `paste(v, 1:3, sep = "-")  # concatenate v elements 1 to 3 with - seperator`

- `paste()` can also collapse the elements into a single string

    - Example: `paste(v, collapse = ", ")  # combine all v elements into a single string, with ", " seperator`

- `strsplit()` splits a given string at a particular substring

    - Example: `strsplit(sentence, " ")  # split words of sentence into character vector`paste(v, 1:3, sep = "-") 

## R Packages

- Get number of available packages: `nrow(available.packages())`

- Install a package: `install.packages("ggplot2")`

- Load a package: `library(ggplot2)` or `require(ggplot2)`

- Get package help: `help(package=ggplot2)`

- Display available datasets from package: `data(package="package")`

- View data: View(dataset)

## Matrices

- 2D data structure with homogenous elements

- Create a new matrix using `matrix()` function

    - This takes a vector and converts it into a matrix with specified number of rows and columns

    - Populates by column by default

- `rbind()` converts multiple row vectors into a matrix

- `cbind()` converts multiple col vectors into a matrix

```R
m <- matrix(1:9, nrow=3, byrow=TRUE)  # create 3 x 3 matrix of 1 to 9 sequence
```
- Rows/Cols can be named by passing in `dimnames` (2 element list of vectors) into `matrix` function

    - Example: `m <- matrix(1:9, nrow=3, dimnames=list(c("first","second","third"), c("A","B","C")))`

- Rows/Col names can be changed after creating the matrix:

    - Example: `colnames(m) <- c("C1", "C2", "C3")`

    - Example: `rownames(m) <- c("R1", "R2", "R3")`

- `dim()` function returns vector of height and width of matrix

