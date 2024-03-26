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

- `<-` or `=` assigns to an l-value

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

- Functions can be accessed from uninstalled packages: `package::func()`

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

# Week 3

## Data frames

- Can compose different vector types of the same length, with labels for each column

- `attach()` function will allow you to access dataframe variables directly without using `$` syntax

- Initialisation

```R
FirstName <- c("John", "Peter", "Kevin")

Age <- c(25, 29, 22)

df <- data.frame(FirstName, Age, 
    stringsAsFactors=F)  # force FirstName to be a character vector (only required in older R versions)
```
## Updating dataframes

```R
df <- rbind(df, c("Jim", 23))  # add record to dataframe

# add multiple records to dataframe

records <- data.frame(FirstName = c("Tina", "Sam"), Age = c(22, 19))

df <- rbind(df, records)

# add column to dataframe

Height <- c(184, 167, 156, 174, 143, 184)

df$Height <- Height  # method 1 - dollar sign

df <- cbind(df, Height)  # method 2 - cbind
```

- `cbind()` can also combine two different dataframes

## Sorting dataframes

- Use the `order()` function

- `t()` function transposes matrix output

```R
require("babynames")

# get top 6, order by n column descending

head(order(babynames$n, decreasing = T),)

# get the records by most popular name

babynames[order(babynames$n, decreasing = T),]

```

## Indexing dataframes

```R
babynames[babynames$n>50000 & babynames$sex == "F",]  # index by logic

```

## Summary statistics

- Different statistics will be used depending on these factors:

    - Type of variables:

        - Interval/ratio (quantitative) variables

        - Ordinal/nominal (qualitative) variables

    - Shape of data (central tendency)

        - Skewed (use median and IQR)

        - Normal (use mean and standard deviation)

        - Can be determined using a histogram, boxplot, stem/leaf plot

        - Use `summary()` function to find mean, median, IQR ranges, and min/max of variable

            - `stat.desc()` (`pastecs`) and `describeBy()` (`psych`) functions

        - `table()` function creates a frequency table of categorical variables

    - Variation (dispersion)

        - How spread out the data points are

## Graphs for level of measurement

| Level                | Properties         | Examples       | Descript. stats                                   | Graphs                                |
|-                     |-                   |-               |-                                                  |-                                      |
| Nominal / Categorial | Discrete, no order | Gender         | Mode, freqs/percents                              | Bar/Pie                               |
| Ordinal / Rank       | Discrete, ordered  | Grades         | Mode frqs/percents, min-max-r, IQR                | Bar/Pie                               |
| Interval             | 0 is meaningless   | Attitude score | Mode, frqs/percents, min-max-r, IQR, mean/SD/Skew | Bar/Pie, stem, boxplot, histogram (M) |
| Ratio                | 0 is meaningful    | Age            | Same as above                                     | Histogram, stem, boxplot/error bar    |

## Plotting in base R

```R
require("mosaicData")
attach(SwimRecords)

# histogram

hist(time, main="Time of the swimming world records", xlab="Year", ylab="Time, sec")

# add graph legend

legend(1960, 93, legend=c("Male", "Female"), lty=c("solid", "dashed"), col=c("navy", "orange"))

# line graph (Male times)

plot(year[sex=="M"], time[sex=="M"], col="navy", type="l", xlab="Year", ylab="Time, sec")
```

## Plotting in `ggplot2`

```R
require("mosaicData")
require("ggplot2")

attach(SwimRecords)

# plot histogram

p <- ggplot(data = SwimRecords, aes(x = time))

p + geom_histogram() + ggtitle("Time of the swimming world records",
                                subtitle="100m distance") +
                                xlab("Year") +
                                ylab("Time, sec")

# stacked histogram

p2 <- ggplot(data = SwimRecords, aes(x = time, color=sex)) + 
        geom_histogram(fill="black")

p2 + ggtitle("Time of the swimming world records",
                                subtitle="100m distance") +
                                xlab("Year") +
                                ylab("Time, sec")

# line graph

p3 <- ggplot(data = SwimRecords, aes(x=year, y=time, group=sex)) + 
        geom_line(aes(linetype=sex, color=sex)) +
        geom_line(aes(linetype=sex, color=sex)) +
        geom_point(aes(shape=sex, color=sex))

p3 + ggtitle("Time of the swimming world records",
            subtitle="100m distance") +
            xlab("Year") +
            ylab("Time, sec")

```
## Data I/O

```R
# load exported dataframe (.RData)

load("data.RData")

# export dataframe

save(data, file = "data.RData")

# read csv as dataframe

read.table("data.csv", sep = ",", header=T)

# export dataframe as csv

write.table(data, "path/to/file.csv", sep=",")

# read excel file

install.packages("xlsx")
require("xlsx")

read.xlsx("data.xlsx", 1)  # read first worksheet
read.xlsx("data.xlsx", "first")  # read worksheet named "first"

# read SPSS file

install.packages("haven")
require("haven")

read_spss(file="data.sav")

fullFilePath <- paste(getwd(), "mtcars.sav", sep = "/")

```

## Data inconsistencies

- Things to check:

    - Dates are sane

    - Items add up

    - Values are reasonable

    - Variable names are consistent

- Common problems:
  
    - Duplicate data

    - Missing values

        - Represented by `NA` (`is.na()`)

        - `NaN`implies not a number (`is.nan()`)

- Missing data

    - Can introduce bias

    - Should be replaced with the mean/median, depending on the skewness of the data

- Use `which()` and `duplicated()` function to find duplicate records

- Use `complete.cases()` to find rows that contain complete data

```R
which(duplicated(data))

# copy of data set with duplicates removed
data[!duplicated(data)]
```

# Week 4

## Factors

- Data objects that categorise the data as levels

- Can take integers or strings

- Example: "Male" and "Female"

- More than 2 levels = anormal - compare means of groups

- Can be instantiated using vectors:

```R
directions <- c("North", "East", "South", "West")

dir_factor = factor(directions)  # encode a vector as a factor

is.factor(dir_factor)  # TRUE

nlevels(dir_factor)  # 4

levels(dir_factor)  # "East"  "North" "South" "West"

# change the order of the levels
dir_factor <- factor(dir_factor, levels = c("North", "South", "East"))
```

- Dataframes will automatically convert vector variables into factors, set `stringsAsFactors=FALSE` to set them as characters

## Converting data types

```R
as_character()

as.numeric()

as.factor()

as.integer()

as.Date()
```

## List

- Contains collections of different data types

- Can contain named entries similar to vectors

- Index notation:

```R
l <- list(x1 = 2, x2 = c(1))

l["x1"]  # 2
l[1]  # 2

l[[x2]]  # 2 (this will extract the first value if the indexed element is an iterable structure)

l$x1  # 2
```

## Mapping/aggregation functions

### apply
  - Useful for iteratively manipulating slices of data

```R

apply()  # apply function over the matrix/array

tapply()  # apply function to a vector, grouped by another vector

```

### `melt`

- Elongates the dataframe by adding records with unique values of the specified by the user

### `cast`

- Does the opposite of melt, shrinks the dataset to unique columns specified by the user, allowing for aggregation of groups of records

### `spread`

- Converts a long dataset to wide, by combining records that share a particular field
- 

## Conditionals

- If statement
  - Cannot be used in a loop
  - Can only work with scalar variables
  
- `ifelse()`
  - Can be used in a loop
  - Can be used with iterables
  - 
```R
total <- c(50)
if (total > 50) print("test")
total <- c(50)

ifelse(total > 50, "yes", "no")
```

# Week 5

## Freeing memory

```
ls()  # list all variables/functions loaded in the workspace

rm(list=ls())  # free all memory used for loaded variables/functions


```
