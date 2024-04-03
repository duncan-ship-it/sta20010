# Question 1 - ChickWeight

# Part 1: determining context/structure of dataset

data(ChickWeight, package="datasets")

?ChickWeight
str(ChickWeight)

# Part 2: finding data inconsistencies
attach(ChickWeight)

table(Time)

sort(tapply(Time, Chick, max))

which(duplicated(ChickWeight))

nrow(ChickWeight) - nrow(ChickWeight[complete.cases(ChickWeight),])

summary(weight)

# Part 3: reporting statistics

require("ggplot2")

# plotting weight histogram

ggplot(data = ChickWeight, aes(x = weight)) +
geom_histogram() + ggtitle("Chick Weights") +
                xlab("Weight, grams") +
                ylab("Frequency")

# statistics
require("psych")

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

# Question 2 - cleaning dataset

# Part 1: reading dataset and obtaining structure

# read in dataset, interpreting "#NA" as NA and converting strings to factors
cleaning <- read.csv("Cleaning.csv")

str(cleaning)

# Part 2: missing values and data inconsistencies

attach(cleaning)
Q4[grep("[^0-9]", Q4)]
Q5[grep("[^0-9]", Q5)]


cleaning$Q4 <- as.integer(ifelse(Q4 == "#NA", NA, Q4))
cleaning$Q5 <- as.integer(ifelse(Q5 == "#NA", NA, Q5))

detach(cleaning)
attach(cleaning)  # re-attach cleaning with new values

summary(cleaning)

str(cleaning)

# Part 2: missing values and data inconsistencies

cleaning[!complete.cases(cleaning),]  # finding cases with NA values

apply(cleaning[seq(5, 16)], 2, max, na.rm=T)  # finding max score values for questions
apply(cleaning[seq(5, 16)], 2, min, na.rm=T)  # finding min score values for questions

# Part 3: replacing unusual/missing values with NA

cleaning$Q5 <- replace(Q5, Q5>40, NA)
cleaning$Q7 <- replace(Q7, Q7>40, NA)
cleaning$Q11 <- replace(Q11, Q11>40, NA)
apply(cleaning[seq(5, 16)], 2, max, na.rm=T)  # verify replacements

detach(cleaning)
attach(cleaning)  # re-attach cleaning with new values

# Part 4: imputing missing values with mean/medium

apply(cleaning[c(6, 8, 9, 11, 14, 15, 16)], 2, describe, na.rm=T)  # check score skews

# impute NA values with question means

cleaning$Q2 <- replace(Q2, is.na(Q2), mean(Q2, na.rm=T))
cleaning$Q4 <- replace(Q4, is.na(Q4), mean(Q4, na.rm=T))
cleaning$Q5 <- replace(Q5, is.na(Q5), mean(Q5, na.rm=T))
cleaning$Q7 <- replace(Q7, is.na(Q7), mean(Q7, na.rm=T))
cleaning$Q10 <- replace(Q10, is.na(Q10), mean(Q10, na.rm=T))
cleaning$Q11 <- replace(Q11, is.na(Q11), mean(Q11, na.rm=T))
cleaning$Q12 <- replace(Q12, is.na(Q12), mean(Q12, na.rm=T))

detach(cleaning)
attach(cleaning)  # re-attach cleaning with new values


detach(cleaning)

# Question 3 - fuel economy

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

fuel[Smog_Rating==7 & Transmission=="A6" & Fuel_type=="Z", ]

# Part 6: parallel boxplot for the variable “Emission_co2” by “Fuel_type”

ggplot(fuel, aes(x = Fuel_type, y = Emission_co2)) + 
        geom_boxplot() + 
        ggtitle("CO2 emmissions by fuel type") +
        xlab("Fuel type") +
        ylab("CO2 emmissions, grams per km")

describeBy(Emission_co2, Fuel_type)

# Part 7: histogram for variable “Comb_Fuel” when Transmission =” A8”

ggplot(fuel[Transmission=="A8",], aes(x = Comb_Fuel)) + 
        geom_histogram(binwidth=1) + 
        ggtitle("Combined fuel consumption for A8 transmissions") +
        xlab("Comb_Fuel, mpg") +
        ylab("Frequency")

describe(fuel[Transmission=="A8",]$Comb_Fuel)

# Part 8: creating Compare variable

fuel$Compare <- Emission_co2/Cylinders*100

head(fuel)

detach(fuel)

# Question 4 - diabetes

# reading in dataset

diabetes <- read.csv("diabetes.csv")

attach(diabetes)

apply(is.na(diabetes), 2, sum)  # no missing values

# scatterplots for comparing diabetic and non-diabetic trends by age

ggplot(diabetes, aes(x = Age, y = BloodPressure)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1)

ggplot(diabetes, aes(x = Age, y = Pregnancies)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1)

ggplot(diabetes, aes(x = Age, y = Pregnancies)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1)

ggplot(diabetes, aes(x = Age, y = BMI)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1)

# report plots/statistics

# age vs diabetes

ggplot(diabetes, aes(y = Age, group = Outcome, x = Outcome)) + 
        geom_boxplot() +
        ggtitle("Diabetes by age", subtitle = "Diabetic patients are older") +
        xlab("Diabetic = 1") +
        ylab("Age, years")

describeBy(Age, Outcome)

# Glucose vs diabetes

ggplot(diabetes, aes(x = Outcome, group = Outcome, y = Glucose)) +
        geom_boxplot() +
        ggtitle("Glucose vs Diabetes", subtitle = "Diabetic patients have higher glucose levels") +
        xlab("Diabetic = 1") +
        ylab("Glucose concentration")

describeBy(Glucose, Outcome)

# DiabetesPedigreeFunction vs diabetes (no relationship)

ggplot(diabetes, aes(x = Outcome, group = Outcome, y = DiabetesPedigreeFunction)) +
        geom_boxplot() +
        ggtitle("Family history vs Diabetes", subtitle = "Family history is a poor predictor of Diabetes") +
        xlab("Diabetic = 1") +
        ylab("DiabetesPedigreeFunction")

describeBy(DiabetesPedigreeFunction, Outcome)

# 

ggplot(diabetes, aes(x = Age, y = SkinThickness)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1) +
        ggtitle("Skin thickness by age and Diabetes", subtitle="Group 1 (Diabetic) have higher glucose levels") +
        xlab("Age, years") +
        ylab("Skin thickness, mm")

ggplot(diabetes, aes(x = Age, y = Insulin)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1) +
        ggtitle("Insulin by age and Diabetes", subtitle="Group 1 (Diabetic) have higher glucose levels") +
        xlab("Age, years") +
        ylab("Skin thickness, mm")

# conclusion

ggplot(diabetes, aes(x = Age, y = Glucose)) +
        geom_point() +
        facet_wrap(~ Outcome, nrow = 1) +
        ggtitle("Glucose concentration by age and Diabetes", subtitle="Group 1 (Diabetic) have higher glucose levels") +
        xlab("Age, years") +
        ylab("Glucose concentration")


# summary statistics


detach(diabetes)

rm(list=ls())  # free workspace memory