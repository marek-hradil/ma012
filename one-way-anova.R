# Method        : Anova
# What is it for: Testing if for all groups the means are the same
# H_0           : All means are same
# H_1           : At least one of them differs
# Requirements  :
#                 1. Homogenity of variances (either Bartlett or Levene)
#                 2. Samples from normal distribution (lilliefors or shapiro)
# How to read   :
#                 Df: degrees of freedom (if summed and increased by one, it should give the number of obs.)
#                 Sum: sum of squares
#                 Mean: (sum of squares)/df
#                 Pr(>F): p-value


dat <- read.csv2(file = "data/potatoes.csv")
dat <- dat |> 
  mutate(Variety = factor(Variety))

aov.model <- aov(Weight ~ Variety, data = dat) # aov object
summary(aov.model) # ANOVA table 


# Effects table
# How to read   : First row are the effects of the groups, the second are the number of elements in the groups
model.tables(aov.model, type = "effects")

# Means table
# How to read   : Grand mean (mean of every sample), then means per group and in the last row again num of elements in group
model.tables(aov.model, type = "means")
