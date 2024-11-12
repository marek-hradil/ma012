# Method        : Lilliefors test
# What is it for: Tests normality (if the values are likely to be from normal distribution)
# H_0           : It is normal
# H_1           : It is not normal

library("nortest")
dat <- read.csv2(file = "data/potatoes.csv")
lillie.test(dat$Weight)
