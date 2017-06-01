# some expression
f <- function(r){
  if (r == 4) {
    x <- 1
    y <- NA
  } else {
    x <- 3
    y <- 4
  }
  return(c(x,y))
}

# for loop
j <- 0
for (i in seq(1,10,by = 2)){
  j <- j + i
}
j

# get function
g1 <- function(x) return(sin(x))
g2 <- function(x) return(sqrt(x ^ 2 + 1))
g3 <- function(x) return(2 * x - 1)
plot(c(0,1),c(-1,1.5))
for (strs in c('g1','g2','g3')) {
  funcs <- get(strs)
  plot(funcs,0,1,add = TRUE)
}

# <<- and assign()
f <- function(){
  inc <- function(){x <<- x + 1}
  x <- 3
  inc()
  return(x)
}

two <- function(u){
  assign("u",2 * u,pos = .GlobalEnv)
}