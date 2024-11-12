# Method        : Anova (two way with or without interactions)
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

dat <- read.csv2(file = "data/hay.csv")
dat <- dat |> 
  mutate(Soil = factor(Soil), Fertilizer = factor(Fertilizer))

aov.model <- aov(Yield ~ Soil + Fertilizer + Soil:Fertilizer, data = dat) # aov object
summary(aov.model) # ANOVA table 
