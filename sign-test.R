# Method        : Sign test
# What is it for: Check if median is equal to some x
# H_0           : It is
# H_1           : Its not
# How to read   : It will give interval, if md is inside, it is still posible that it is the mean. Also p-value is given.

library("BSDA")

dat <- read.csv2(file = "data/minute.csv", header = FALSE)
SIGN.test(dat$V1, md = 60)

# Hands on:
N_PLUS = 11
N = 27
Z = (N_PLUS - (N / 2)) / sqrt(N / 4)
  