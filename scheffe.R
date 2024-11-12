# Method        : Scheffe test
# What is it for: Checking different means after ANOVA
# How to read   : Main thing are the groups, where for each letter it represents significantly different groups.

library("agricolae")

dat <- read.csv2(file = "data/potatoes.csv")
dat <- dat |> 
  mutate(Variety = factor(Variety))

aov.model <- aov(Weight ~ Variety, data = dat) # aov object

ScheffeTest <- scheffe.test(aov.model, "Variety")
ScheffeTest

