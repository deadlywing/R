# this is annotatin
getwd()
ls()
x <- c(1,2,5)
mean(x)
sd(x)
data(Nile)
mean(Nile)
hist(Nile, breaks = 12)

# count the number of odd integers in x
oddcount <- function(x) {
  k <- 0
  for (n in x) {
      if (n %% 2 == 1) {
        k <- k + 1
      }
  }
  return(k)
}

oddcount(c(1,2,3,7,9))

# matrix
m <- rbind(c(1,4),c(2,2))
mode(m)
m %*% c(1,1)
a <- c(1,1)
mode(m[1,])
m[,2]

# list
x <- list(u = 2, v = "abc")
x$u
x$v

example(seq)
help.search("multivariate normal")
help.search("gamma distribution")

# can push ??
# can pull ?
