# STA20010 Assignment 1 (103594137)

## Question 1

### 1. _Discuss all of the aspects of the dataset including the context and properties._

The effects of diet on the weight of chicks during early development was investigated by a nutrition student. Chicks were fed 1 of 4 diets, with varying amounts of protein, and their weights were measured at birth, and every second day from birth, up to day 20, and finally measured on day 21.

There are 578 observations and 4 variables in the dataset:

- There are 2 numeric variables, namely "weight" and "Time". "weight" contains the measured chick's weight in grams. "Time" contains the age of the chick in days since birth.

- There are 2 factor variables, namely "Chick" and "Diet". "Chick" is an ordered factor with 50 levels, that uniquely identifies each chick with an integer. The factors are ordered by their final weight amongst the other chicks in the same diet group, from lightest to heaviest (note that the factor number does not correspond to it's order). "Diet" is a factor containing 4 levels, specifying the type of diet the chick received.

### 2. _Look at carefully the variable and discuss any inconsistencies dataset has. Explain your reasoning and the steps you have taken._

A few chicks were only measured up to a certain day, and are missing measurement entries, namely chicks 8, 15, 16, 18, and 44. This is an obvious data inconsistency, as these cases are missing observations, and can be explained by chicks dying during the experiment.

These cases should still be included in the analysis, since there is no inaccuracies in the data present in these cases, and they demonstrate an important event in the experiment.

Another data inconsistency is the time intervals of the experiment, with the final measurement taking place on day 21, leaving only a 1 day gap between the previous measurement, whereas all other measurements have a consistent 2 day gap.

Furthermore, the varible naming scheme is inconsistent, with the weight variable name being fully lowercase, while the other variables are sentence case (Time, Chick, Diet).

Other aspects of the dataset were validated, such as Time recordings being integers between 0 and 21, even numbers (unless 21), and no records existing with duplicate Time and Chick measurements. The dataset was also scanned for any fully duplicate records, yielding no duplicates. The minimum and maximum weights of 35g and 375g respectively are plausible weights of a chick. Checking for incomplete cases yielded no results.

### 3. _Produce appropriate summary statistics and graphs to see any association between variables and discuss._

```
> summary(ChickWeight)
     weight           Time           Chick     Diet   
 Min.   : 35.0   Min.   : 0.00   13     : 12   1:220  
 1st Qu.: 63.0   1st Qu.: 4.00   9      : 12   2:120  
 Median :103.0   Median :10.00   20     : 12   3:120  
 Mean   :121.8   Mean   :10.72   10     : 12   4:118  
 3rd Qu.:163.8   3rd Qu.:16.00   17     : 12          
 Max.   :373.0   Max.   :21.00   19     : 12          
                                 (Other):506
```
```
> describeBy(weight, Diet)

 Descriptive statistics by group 
group: 1
   vars   n   mean    sd median trimmed   mad min max range skew kurtosis   se
X1    1 220 102.65 56.66     88   95.31 52.63  35 305   270 1.07     0.61 3.82
------------------------------------------------------------ 
group: 2
   vars   n   mean    sd median trimmed   mad min max range skew kurtosis   se
X1    1 120 122.62 71.61  104.5  113.67 67.46  39 331   292 0.95     0.18 6.54
------------------------------------------------------------ 
group: 3
   vars   n   mean    sd median trimmed   mad min max range skew kurtosis  se
X1    1 120 142.95 86.54  125.5  133.68 90.44  39 373   334 0.76    -0.39 7.9
------------------------------------------------------------ 
group: 4
   vars   n   mean    sd median trimmed   mad min max range skew kurtosis   se
X1    1 118 135.26 68.83  129.5   131.2 84.51  39 322   283  0.4    -0.67 6.34
```

![Chick Weight Plot](/assignment1/plots/Q1_weight_line_plot.png)

The weight of chicks in the dataset ranges from 35g to 373g, and is positively skewed, with a median chick weight of 103g. The variance of Chick weights is negligible at the beginning of the experiment, but increases dramatically over time as the chicks age, across all diet groups.

There is an indication that "Diet" has an effect on chick's weight during early development. We can deduce that chicks eating Diet 1 tended to be the most malnourished, with the lowest median weight of 88g, and 4 of the 5 deaths ocurring in chicks from this group. Conversly, chicks eating Diet 3 or Diet 4 tended to gain the most weight during the experiment.

## Question 2

### 1. _Read the dataset in R, obtain the structure of the dataset and discuss._

```
> str(cleaning)
'data.frame':   101 obs. of  16 variables:
 $ ID     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ AGE    : int  18 23 39 24 27 26 26 26 28 24 ...
 $ GENDER : Factor w/ 2 levels "Female","Male": 2 1 2 2 2 2 1 1 2 1 ...
 $ YRSTUDY: int  3 7 10 6 16 16 10 8 9 6 ...
 $ Q1     : int  8 15 9 10 10 10 14 12 9 10 ...
 $ Q2     : int  14 21 12 15 20 16 18 17 15 13 ...
 $ Q3     : int  16 20 14 15 21 16 16 11 21 23 ...
 $ Q4     : int  19 23 12 18 24 18 16 9 23 24 ...
 $ Q5     : int  18 19 22 17 25 18 10 17 24 19 ...
 $ Q6     : int  14 16 20 15 23 18 11 10 23 19 ...
 $ Q7     : int  21 20 16 20 29 20 15 18 21 24 ...
 $ Q8     : int  27 22 22 29 26 27 27 21 23 23 ...
 $ Q9     : int  25 24 26 30 27 24 25 27 20 26 ...
 $ Q10    : int  26 26 26 25 25 25 25 25 25 25 ...
 $ Q11    : int  22 18 23 27 21 25 24 24 26 19 ...
 $ Q12    : int  14 17 15 13 24 14 13 10 22 18 ...
```
The above dataset describes student scores ranked on a scale of 0 to 40 on a series of 12 questions.

There are 101 observations and 16 variables in the dataset:

- There are 15 numeric variables, namely ID, AGE, YRSTUDY, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, and Q12. ID contains a number that identifies the student. AGE contains the student's age in years. YRSTUDY contains the current year of education the student is studying in. Q1 to Q12 contains the student's received score on the relevant question, on a scale from 0 to 40.

- There is 1 factor variable, namely GENDER. This is a factor with two levels, "Male" and "Female", describing the student's gender.

### 2. _Discuss and report any missing values and unusual characters in the dataset._

```
> summary(cleaning)
       ID           AGE           GENDER      YRSTUDY             Q1       
 Min.   :  1   Min.   :18.00   Female:69   Min.   : 0.000   Min.   : 7.00  
 1st Qu.: 26   1st Qu.:19.00   Male  :32   1st Qu.: 3.000   1st Qu.: 9.00  
 Median : 51   Median :23.00               Median : 6.000   Median :10.00  
 Mean   : 51   Mean   :23.35               Mean   : 6.634   Mean   :10.94  
 3rd Qu.: 76   3rd Qu.:26.00               3rd Qu.: 9.000   3rd Qu.:12.00  
 Max.   :101   Max.   :39.00               Max.   :20.000   Max.   :19.00  
                                                                           
       Q2              Q3              Q4              Q5        
 Min.   : 9.00   Min.   :10.00   Min.   : 9.00   Min.   : 10.00  
 1st Qu.:13.00   1st Qu.:15.00   1st Qu.:15.75   1st Qu.: 15.00  
 Median :15.00   Median :18.00   Median :20.00   Median : 18.00  
 Mean   :15.61   Mean   :18.02   Mean   :19.11   Mean   : 19.23  
 3rd Qu.:19.00   3rd Qu.:21.00   3rd Qu.:23.00   3rd Qu.: 21.00  
 Max.   :28.00   Max.   :30.00   Max.   :30.00   Max.   :120.00  
 NA's   :1                       NA's   :1       NA's   :1       
       Q6              Q7              Q8              Q9       
 Min.   : 9.00   Min.   :13.00   Min.   :19.00   Min.   :16.00  
 1st Qu.:13.00   1st Qu.:16.00   1st Qu.:24.00   1st Qu.:24.00  
 Median :16.00   Median :20.00   Median :26.00   Median :26.00  
 Mean   :16.19   Mean   :20.29   Mean   :25.45   Mean   :25.59  
 3rd Qu.:19.00   3rd Qu.:22.00   3rd Qu.:28.00   3rd Qu.:27.00  
 Max.   :26.00   Max.   :52.00   Max.   :32.00   Max.   :33.00  
                                                                
      Q10             Q11             Q12       
 Min.   :22.00   Min.   :13.00   Min.   :10.00  
 1st Qu.:23.00   1st Qu.:21.00   1st Qu.:15.00  
 Median :24.00   Median :23.00   Median :17.50  
 Mean   :23.73   Mean   :23.01   Mean   :17.61  
 3rd Qu.:25.00   3rd Qu.:25.00   3rd Qu.:20.00  
 Max.   :26.00   Max.   :52.00   Max.   :26.00  
 NA's   :1       NA's   :1       NA's   :1
```

```
> cleaning[!complete.cases(cleaning),]
   ID AGE GENDER YRSTUDY Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12
72 72  18 Female      13  9  9 17 15 16 13 15 25 28  23  15  NA
75 75  24 Female       7 10 18 16 18 NA 11 17 22 26  23  NA  17
89 89  24   Male       6 10 NA 11 12 13 15 16 26 21  22  23  13
93 93  27 Female      11  7  9 12 NA 15 13 15 25 24  NA  22  15
```

Questions 2, 4, 5, 10, 11, 12 contain missing values

### 3. _Replace unusual values and missing values if exists, in the dataset with NA._


### 4. _Impute missing values with appropriate statistic (mean or median) for each variable and explain why you have chosen that particular statistic._



## Question 3

### 1. _Read the dataset “Fuel\_Cons\_2022.csv” in R, obtain the structure of the dataset and discuss it._

```
> str(fuel)
'data.frame':   967 obs. of  11 variables:
 $ Make        : Factor w/ 39 levels "Acura","Alfa Romeo",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ Model       : Factor w/ 726 levels "124 Spider","1500",..: 357 433 434 432 536 537 545 634 635 636 ...
 $ Cylinders   : int  4 6 6 6 4 4 6 4 6 6 ...
 $ Transmission: Factor w/ 24 levels "A10","A4","A5",..: 10 16 16 9 11 11 9 10 16 16 ...
 $ Fuel_type   : Factor w/ 4 levels "D","E","X","Z": 4 4 4 4 4 4 4 4 4 4 ...
 $ City_Fuel   : num  9.9 12.3 12.2 9.1 11 11.3 8.4 10.2 11.4 12 ...
 $ Hwy_Fuel    : num  7 9.2 9.5 9 8.6 9.1 8.2 7.4 7.7 8.2 ...
 $ Comb_Fuel   : num  8.6 10.9 11 9 9.9 10.3 8.4 8.9 9.8 10.3 ...
 $ Emission_co2: int  199 254 258 210 232 241 196 209 228 240 ...
 $ Rating_Co2  : int  6 4 4 5 5 5 6 5 5 5 ...
 $ Smog_Rating : int  3 3 3 3 6 6 7 3 3 3 ...
 ```
The above dataset 


### 2. _Produce a frequency table for the variable “Fuel\_type” and discuss it._

```
> t <- table(Fuel_type)
> t
Fuel_type
  D   E   X   Z 
 20  23 443 481
```
From the above frequency table, fuel type D is the least commonly used (20), whereas fuel type Z is the most commonly used (481). There is a large discrepancy in usages between fuel types D and E (20 and 23) and fuel types X and Z (443 and 481). This could be attributed to fuel types D and E being harder or more expensive to produce, company loyalty to fuel types X and Z, or varying environmental regulations between countries, restricting the usage of fuel types D and E.

### 3. _Obtain a bar plot for the variable “Fuel\_type”_

![Bar plot of fuel type](/assignment1/plots/Q3_fuel_bar_plot.png)

### 4. _Obtain mean and standard deviation for the variable“City\_Fuel” based on “Cylinders” and discuss._

```
> describeBy(City_Fuel, Cylinders)

 Descriptive statistics by group 
group: 3
   vars  n mean   sd median trimmed  mad min max range  skew kurtosis   se
X1    1 12 8.52 0.93    8.6    8.58 0.52 6.6 9.8   3.2 -0.61     -0.5 0.27
------------------------------------------------------------ 
group: 4
   vars   n mean   sd median trimmed  mad min  max range  skew kurtosis   se
X1    1 425 9.89 1.78   10.1   10.03 1.63 4.2 14.3  10.1 -0.85     1.01 0.09
------------------------------------------------------------ 
group: 5
   vars n mean sd median trimmed mad  min  max range skew kurtosis se
X1    1 2 12.1  0   12.1    12.1   0 12.1 12.1     0  NaN      NaN  0
------------------------------------------------------------ 
group: 6
   vars   n  mean  sd median trimmed  mad min  max range skew kurtosis  se
X1    1 295 12.89 1.7   12.8    12.8 1.33 7.5 22.1  14.6 1.17      5.6 0.1
------------------------------------------------------------ 
group: 8
   vars   n  mean   sd median trimmed  mad  min  max range skew kurtosis   se
X1    1 202 16.25 2.14   15.8   15.96 1.63 12.8 24.5  11.7 1.29     1.66 0.15
------------------------------------------------------------ 
group: 10
   vars n  mean   sd median trimmed mad  min max range  skew kurtosis   se
X1    1 6 17.83 0.26     18   17.83   0 17.5  18   0.5 -0.54    -1.96 0.11
------------------------------------------------------------ 
group: 12
   vars  n  mean   sd median trimmed  mad  min  max range skew kurtosis  se
X1    1 23 20.61 3.37     20   20.32 1.19 15.5 28.1  12.6 1.09     0.24 0.7
------------------------------------------------------------ 
group: 16
   vars n mean   sd median trimmed mad  min  max range skew kurtosis  se
X1    1 2   27 0.28     27      27 0.3 26.8 27.2   0.4    0    -2.75 0.2
```

### 5. _List the records of the vehicles where Smog\_Rating= 7, Transmission=” A6” and Fuel\_type=”Z”_


### 6. _Obtain a parallel boxplot for the variable “Emission\_co2” by “Fuel\_type” variable and discuss._


### 7. _Obtain a histogram for variable “Comb\_Fuel” when Transmission =” A8” and discuss._


### 8. _Create a new variable Compare = Emission\_co2/Cylinders*100 attach it to the dataset “Fuel\_Cons\_2022.csv”._



## Question 4

### _You are expected to produce graphs and summary statistics to decide which variables are possibly associated with diabetes. All summary statistics and graphs should be referred to support with your decision._

