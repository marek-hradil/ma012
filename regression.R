# Method        : Regresion
# What is it for: Make a model of a variable based on other variables

library("ellipse")    # ellipse
library("rgl")        # 3D graphics
library("GGally")     # ggpairs
library("tidyverse")

dat <- read.csv("data/people2.csv", stringsAsFactors = TRUE)
m1 <- lm(Weight ~ 1 + Height, data = dat)


# Coefficients
(beta <- coef(m1))

# Confidence intervals for coefficients
(beta.CI <- confint(m1))
