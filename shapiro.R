# Method        : Shapiro-Wilk test
# What is it for: Tests normality (if the values are likely to be from normal distribution)
# H_0           : It is normal
# H_1           : It is not normal (like matúš miškůf)

dat <- read.csv2(file = "data/potatoes.csv")
shapiro.test(dat$Weight)
