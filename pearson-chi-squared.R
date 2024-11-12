# Method        : Pearson chi-squared test
# What is it for: Check if data could be from some particular distribution
# H_0           : Could be
# H_1           : Are not
# How to read   : 

tab.raw <- read.csv2(file = "data/families.csv")
k <- nrow(tab)
n <- tab.raw |> summarise(n = sum(NumFamilies)) |> pull(n)
tab <- tab.raw |> as_tibble() |> transmute(
  x.j = NumBoys, 
  A.j = factor(NumBoys), 
  N.j = NumFamilies, 
  p.j = dbinom(NumBoys, size = 5, prob = 0.5), 
  n.j = n * p.j
)

# Yarnolds criterion

q <- tab |> summarise(q = mean(n.j < 5)) |> pull(q)
tab |> mutate(test = n.j >= 5 * q)
tab

# Pearson criterion
tab |> mutate(test = n.j >= 5)
tab


K <- tab |> summarize(K = sum((N.j - n.j)^2 / n.j)) |> pull(K)
quantile <- qchisq(0.95, df = k - 1)
data.frame(K, df = k - 1, quantile, p.value = 1 - pchisq(K, df = k - 1))

chisq.test(tab$N.j, p = tab$p.j) # built-in function
