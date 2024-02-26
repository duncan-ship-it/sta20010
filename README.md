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

- `<-` assigns an r-value

- `;` seperates two or more operations on a single line - optional

- Single or double quotes can be used for strings - pairs must match

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

# Data frames

- Useful for storing tabular data

- Access column data via `df$col` - returns vector

- R has a built-in `Orange` dataframe