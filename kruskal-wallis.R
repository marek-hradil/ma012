# Method        : Kruskal-Wallis test
# What is it for: Check if there is significant distribution difference between multiple groups
# H_0           : Distributions are the same
# H_1           : They are not
# How to read   : p value

dat <- read.csv2(file = "data/potatoes.csv")
KWtest <- kruskal(dat$Weight, dat$Variety)
KWtest
