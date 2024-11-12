# Method        : Wilcoxon test
# What is it for: Check if median is equal to some x
# H_0           : It is
# H_1           : Its not
# How to read   : P-value.

dat <- read.csv2(file = "data/minute.csv", header = FALSE)
wilcox.test(dat$V1, md = 60)
