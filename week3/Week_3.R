
library(MASS)
datasets(package="MASS")
library(MASS)
View(Pima.te)
Pima <- data.frame(Pima.te)
head(Pima.te)
dim(Pima.te)
attach(Pima.te)
table(Pima$npreg)
detach(Pima.te)
str(Pima.te)
?complete.cases
sum(complete.cases(Pima.te))
summary(Pima.te)
table(npreg)
sum(Pima.te$npreg > 6)
dim(Pima.te)[1]

sum(Pima.te$npreg > 6)/dim(Pima.te)[1]*100
Diabetic_No<-Pima.te[Pima.te$type=="No",]
head(Diabetic_No)

dat1<-Pima.te[(Pima.te$bmi>26) & (Pima.te$age<30),]
dim(dat1)
# when use attach command it consume r memory, 
#better to remove once you have done the computation
attach(Pima)
dat2<-Pima.te[(bmi>26 & age<30),]
dim(dat2)
dat3<-Pima.te[npreg <=5 & age<30,]
dim(dat3)
dat4<-Pima.te[bmi >18.5 & bmi<25,]
dim(dat4)
summary(age)
hist(age)
detach(Pima)
# detach to remove the dataset from memory
# to remove any objects from R memory use rm()
rm(abc)
dat2<-Pima[(Pima$bmi>26 & Pima$age<30),]
dim(dat2)
dat3<-Pima[Pima$npreg <=5 & Pima$age<30,]
dim(dat3)
dat4<-Pima[Pima$bmi >18.5 & Pima$bmi<25,]
dim(dat4)
summary(Pima$age)
hist(Pima$age)
v1 <-c(2,3,4,5,6)
summary(v1)
v2 <-c(2,3,4,5,60)
summary(v2)

?boxplot

boxplot(Pima.te$age)
boxplot(Pima.te$age~Pima.te$type,horizontal = T, col="green")

table(type)
barchart(Pima.te$type)
detach(Pima.te)
table(Pima.te$type)

Pima$bmi_cat[Pima$bmi> 18.5 & Pima$bmi< 25]<-"Normal"
Pima$bmi_cat[Pima$bmi>=25 & Pima$bmi< 30]<-"Owerweight"
Pima$bmi_cat[Pima$bmi>=30 & Pima$bmi< 35]<-"Obese"
Pima$bmi_cat[Pima$bmi >=35 & Pima$bmi< 40]<-"Severe Obese"
Pima$bmi_cat[Pima$bmi>40]<-"Morbid Obese"
head(Pima)

table(Pima$bmi_cat)
table(Pima$bmi_cat)
barplot(table(Pima$bmi_cat), horiz=F)
?barplot
warnings

## To read the file using read.csv command in line
# file.choose() is used to open the dialog box to select the file
# Header =T when the dataset consists of the variables

abc<-read.csv(file.choose(), header=T)


