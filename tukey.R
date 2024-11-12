# Method        : Tukey honesty significant difference test
# What is it for: Checking different means after ANOVA
# How to read   :
#                 First row: which varieties are compared
#                 Second row: difference of means
#                 Third row: lower bound for confidence interval (95% sure the mean is somewhere there)
#                 Fourth row: upper bound
#                 Fifth row: p-value (H_0: means are the same, H_1: means are different)

dat <- read.csv2(file = "data/potatoes.csv")
dat <- dat |> 
  mutate(Variety = factor(Variety))

aov.model <- aov(Weight ~ Variety, data = dat) # aov object
TukeyTest <- TukeyHSD(aov.model)
TukeyTest

TukeyTest$Variety |> 
  as.data.frame() |>
  rownames_to_column(var = "groups") |> 
  rename("p.value" = "p adj") |> 
  mutate(significant = factor(p.value < 0.05)) |> 
  ggplot(aes(x = groups, y = diff, ymin = lwr, ymax = upr, colour = significant)) + 
  geom_hline(yintercept = 0, color = "black", linetype = "dashed", linewidth = 0.5) + 
  geom_errorbar(width = 0.1) + 
  geom_point(size = 2) + 
  labs(x = "potato varieties", y = "difference in weights [kg]")
