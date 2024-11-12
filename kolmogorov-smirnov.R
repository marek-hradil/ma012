# Method        : Kolmogorov smirnov
# What is it for: Check if data could be from some particular distribution
# H_0           : Could be
# H_1           : Are not
# How to read   : p value

tab <- read.csv(file = "data/restart.csv")
lambda <- 0.04
ks.test(tab$time_restart, "pexp", rate = lambda)
