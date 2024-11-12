# Method        : Mann-Whitney test
# What is it for: Check if there is significant distribution difference between two groups
# H_0           : Distributions are the same
# H_1           : They are not
# How to read   : p value

dat <- read.csv2(file = "data/field.csv")
wilcox.test(dat |> filter(Fertilizer == "A") |> pull(Yield), dat |> filter(Fertilizer == "B") |> pull(Yield))

