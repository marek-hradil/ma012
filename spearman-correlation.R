# Method        : Spearman correlation
# What is it for: Check if there is a linear connection between the variables
# How to read   : P-value & if > 1, then there is positive, if < 1 then there is negative, if = 0, then there is none
library("Hmisc")      # rcorr
library("ggcorrplot")
library("ppcor")
dat <- read.csv2("data/households.csv", header = TRUE, skip = 5) |> 
  rename("members" = "N", "income" = "I", "expense" = "E")

cor.test(dat$expense, dat$members)


# Plot:
Z <- as.matrix(dat)
R <- rcorr(Z, type = "spearman")
diag(R$P) <- 0
ggcorrplot(R$r, p.mat = R$P, title = "Spearman's correlations", 
           lab = TRUE, type = "full", method = "square", outline.color = "white", show.legend = FALSE, pch.cex = 10)

