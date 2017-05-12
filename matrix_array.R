# create matrix
y <- matrix(c(1,2,3,4),nrow = 2,ncol = 2)
y <- matrix(c(1,2,3,4),nrow = 2)
z <- matrix(c(1,2,3,4),nrow = 2,ncol = 2,dimnames = list(c('a1','a2'),c('b1','b2')))
z
y <- matrix(1:6,nrow = 3)
y[-2,]  #unlike the python expression y[2,:], no need :
m <- matrix(1:6,nrow = 3)
m[m[,1] > 1 & m[,2] > 5,,drop = FALSE]  # need & rather than &&

# apply()
z <- matrix(1:6,nrow = 3)
f <- function(x) x/c(2,8)
y <- apply(z, 1,f)  # outcome placed in columns
y

# which.max() and max()
x <- c(1,9,2,6,4,8)
which.max(x)
max(x)

#dim() nrow() ncol() as.matrix()
z <- matrix(1:6,nrow = 3)
x <- c(1,9,2,6,4,8)
dim(z)
nrow(z)
ncol(z)
attributes
attributes(x)
str(z)
str(x)
r <- z[2,,drop = FALSE]
attributes(r)
y <- as.matrix(x)
attributes(y)
y
