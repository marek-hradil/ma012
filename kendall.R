
X <- c(2,4,6,8)
Y <- c(1,3,5,7)
cor(X, Y, method = "kendall")

# Hands-on:
res <- count_concordant_discordant(X, Y)
C = res$C
D = res$D
n = 4


t = (C - D) / (1/2 * n * (n - 1))
t

# function for concordant/discordant

count_concordant_discordant <- function(X, Y) {
  concordant <- 0
  discordant <- 0
  n <- length(X)
  
  # Iterate over each unique pair of points (X[i], Y[i]) and (X[j], Y[j])
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      # Calculate the difference for each pair in both X and Y
      diff_X <- X[i] - X[j]
      diff_Y <- Y[i] - Y[j]
      
      # Check if the pair is concordant or discordant
      if (diff_X * diff_Y > 0) {
        concordant <- concordant + 1
      } else if (diff_X * diff_Y < 0) {
        discordant <- discordant + 1
      }
      # Ties are ignored in concordant and discordant counts
    }
  }
  
  # Return the counts as a list
  return(list(C = concordant, D = discordant))
}
