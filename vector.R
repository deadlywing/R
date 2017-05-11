# vector , matrix , array
z <- c(5,12,13,21,34)
z1 <- z[-1:-3]
z <- c(5,12,13,21,34)
z2 <- z[-3:-1]

# seq()
seq(12,30,by = 3)
seq(1.1,2,length.out = 10)
# rep()
x <- rep(1:3, 2)
x <- rep(c(5,12,13),each = 2,times = 2)
rep(c(5,12,13), c(1,2,3))
example(rep)
# all() and any()
x <- 1:10
x < 8
any(x > 8)
all(x > 8)
# subset() and which()
subset(airquality, Day == 1, select = -Temp)
z <- c(5,2,-3,8)
which(z*z > 8)
m <- matrix(1:12,3,4)
which(m %% 4 == 1, arr.ind = TRUE)
example(which)
