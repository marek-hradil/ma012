# Method        : Two sample t test
# What is it for: Are the means of two groups the same?
# H_0           : Could be
# H_1           : Are not
# How to read   : p-value and interval for difference

tab <- read.csv("data/people.csv")
tab <- tab |> 
  mutate(
    across(where(is.character), 
           factor
    ))
t.test(Height ~ Sex, data = tab, var.equal = TRUE)
