# Question 1

# Part 1: determining context/structure of dataset

data(ChickWeight, package="datasets")

?ChickWeight
str(ChickWeight)

# Part 2: finding data inconsistencies
attach(ChickWeight)

table(Chick, Time)

which(duplicated(ChickWeight))

nrow(ChickWeight) - nrow(ChickWeight[complete.cases(ChickWeight),])

max(weight)

min(weight)

# Part 3: reporting statistics

require("ggplot2")
require("psych")

# plotting weight histogram

ggplot(data = ChickWeight, aes(x = weight)) +
geom_histogram() + ggtitle("Chick Weights") +
                xlab("Weight, grams") +
                ylab("Frequency")

# statistics
summary(ChickWeight)

describeBy(weight, Diet)

# plotting line graphs of weight by Diet over Time

ggplot(ChickWeight, aes(x = Time, y = weight, group = Chick)) + 
        geom_line(linetype = 1, lwd = 1.1) + 
        facet_wrap(~ Diet, nrow=4) + 
        ggtitle("Chick weights over time by diet") +
        xlab("Time, days since birth") +
        ylab("Weight, grams")

detach(ChickWeight)

# Question 2

# Part 1: reading dataset and obtaining structure

# read in dataset, interpreting "#NA" as NA and converting strings to factors
cleaning <- read.csv("Cleaning.csv", na.strings = "#NA", stringsAsFactors=T)

str(cleaning)

# Part 2: missing values and data inconsistencies

attach(cleaning)

summary(cleaning)

cleaning[!complete.cases(cleaning),]  # finding cases with NA values

apply(cleaning[seq(5, 16)], 2, max, na.rm=T)  # finding max score values for questions

# Part 3: replacing unusual/missing values with NA



# Part 4: imputing missing values



detach(cleaning)

# Question 3

# Part 1: reading in dataset

fuel <- read.csv("Fuel_Cons_2022.csv", stringsAsFactors=T)

# Part 2: plotting frequency table

attach(fuel)

t <- table(Fuel_type)
t

# Part 3: plotting bar graph

df <- data.frame(Fuel=names(t), Frequency=as.vector(t))

ggplot(df, aes(x=Fuel, y=Frequency)) +
geom_bar(stat = "identity") +
ggtitle("Frequency of fuel types")

# Part 4: Obtain mean and standard deviation for the variable “City_Fuel” based on “Cylinders”

describeBy(City_Fuel, Cylinders)

# Part 5: records of the vehicles where Smog_Rating= 7, Transmission=” A6” and Fuel_type=”Z”



# Part 6: parallel boxplot for the variable “Emission_co2” by “Fuel_type”



# Part 7: histogram for variable “Comb_Fuel” when Transmission =” A8”



# Part 8: creating Compare variable

detach(fuel)

# Question 4



# free workspace memory
rm(list=ls())