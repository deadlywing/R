# S3
x <- c(1,2,3)
y <- c(1,3,8)
lmout <- lm(y ~ x)
class(lmout)
lmout
unclass(lmout)

# eg
j <- list(name = 'Joe', salary = 55000, union = T)
class(j) <- 'employee'
attributes(j)
j
print.employee <- function(wrkr){
  cat(wrkr$name, '\n')
  cat("salary",wrkr$salary,"\n")
  cat("union number",wrkr$union,"\n")
}
methods(,"employee")
j
