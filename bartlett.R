# Method        : Bartlett
# What is it for: Homogenity of variances (all of the variances are the same)
# H_0           : All of the variances are equal
# H_1           : At least one of them differs

# Usage: Checks if for each group of Variety, the samples have same variance
dat <- read.csv2(file = "data/potatoes.csv")
dat <- dat |> 
  mutate(Variety = factor(Variety))
bartlett.test(Weight ~ Variety, data = dat)
