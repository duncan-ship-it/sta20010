# Question 1

# Part 1: determining context/structure of dataset

data(ChickWeight, package="datasets")
attach(ChickWeight)

?ChickWeight
str(ChickWeight)

# Part 2: finding data inconsistencies

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

# plotting line graph of Chick weight by Diet

p <- ggplot(data = ChickWeight, aes(x = Time, y = weight, group = Chick, color = Diet)) +
  geom_line(linetype = 2,
            lwd = 1.1)

p + ggtitle("Chick weights over time by diet") +
        xlab("Time since birth, days") +
        ylab("Weight, grams")

# Question 2

# Part 1: reading dataset and obtaining structure

# Part 2: missing values and data inconsistencies

# Part 3: replacing unusual values

# Part 4: imputing missing values

# Question 3

# Part 1: reading in dataset

# Part 2: plotting frequency table

# Part 3: plotting bar graph

# Part 4: listing records with Smog_Rating = 7, Transmission = 'A6' and Fuel_type = 'Z'

# Part 5: plotting box plot for Emmission_co2 by Fuel_type

# Part 6: histogram for variable “Comb_Fuel” when Transmission =” A8”

# Part 7: 

# Part 8: attaching Compare variable to dataset file

# Question 4



