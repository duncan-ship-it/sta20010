# 1

p <- c(3, 5, 7, 11, 13, 17, 19)

length(p)

# 2

gas <- c(65311, 65624, 65908, 66219, 66499, 66821, 67145, 67447)

diff(gas)  # differences between previous and current element in vector

# 3

x <- c(2, 5, 4, 10, 8)

x ^ 2

x - 6

(x - 9) ^ 2

# 4

rep("a", 5)

seq(1, 100, 2)

rep(1:3, each=3)

rep(1:3, c(3,2,1))

# 5

c(2, 3, 5, 7, 11, 13, 17, 19)

1:10

1 / 1:10

1964:2014

c(14, 18, 23, 28, 34, 42, 50, 59, 66, 72, 79, 86, 96, 103, 110)

seq(0, 1000, 25)

# 6

trialNames <- paste("Trial", 1:10, sep = " ")

# 7

commutes <- c(7, 16, 20, 24, 22, 15, 21, 15, 17, 22)

max(commutes)

mean(commutes)

min(commutes)

commutes[4] <- 18

mean(commutes)

commutes[commutes >= 20]

length(commutes[commutes < 18]) / length(commutes) * 100

# 8

a8 <- c(5, 37, 45, 47, 49, 25)

names(a8) <- c("A", "B", "C", "D", "E", "F")

# 9

dry <- c(77, 93, 92, 68, 88, 75, 100)

sum(dry)

mean(dry)

median(dry)

stdev(dry)

length(dry)

sorted_dry <- sort(dry)

# 10

require(UsingR)

# 11

# 12

# 13

names(Orange)

# 14

mean(as.numeric(Orange$Tree))

# 15

max(Orange$circumference)