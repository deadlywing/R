# 1. scatter

attach(mtcars)
plot(wt,mpg,
     main = 'Basic Scatter plot of MPG vs. Weight',
     xlab = 'Car Weight', ylab = 'Miles Per Gallon',
     pch = 19)
# add regression curve
abline(lm(mpg ~ wt), col = 'red', lwd = 2, lty = 1)
lines(lowess(wt, mpg), col = 'blue', lwd = 2, lty = 2)
detach(mtcars)
library(car)
scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2,
            main = "Scatter Plot of MPG vs. Weight by Cylinder",
            xlab = 'Weight', ylab = 'Miles Per Gallon',
            legend.plot = TRUE, id.method = "identify",
            labels = rownames(mtcars),
            boxplots = "xy")

scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2,
            main = "Scatter Plot of MPG vs. Weight by Cylinder",
            xlab = 'Weight', ylab = 'Miles Per Gallon',
            legend.plot = TRUE, id.method = "identify",
            labels = rownames(mtcars),
            # change here
            boxplots = "x")

scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2,
            main = "Scatter Plot of MPG vs. Weight by Cylinder",
            xlab = 'Weight', ylab = 'Miles Per Gallon',
            legend.plot = TRUE,
            boxplots = "xy")

# add color
scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2,col = c('blue','yellow','red'),
            main = "Scatter Plot of MPG vs. Weight by Cylinder",
            xlab = 'Weight', ylab = 'Miles Per Gallon',
            legend.plot = TRUE, id.method = "identify",
            labels = rownames(mtcars),
            boxplots = "xy")

#depress annotation, axis
scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2,
            main = "Scatter Plot of MPG vs. Weight by Cylinder",
            xlab = 'Weight', ylab = 'Miles Per Gallon',
            legend.plot = TRUE, id.method = "identify",
            labels = rownames(mtcars),
            boxplots = "xy", ann = FALSE, xaxt = 'n', yaxt = 'n')


# 2. scatterplot matrix
library(car)
scatterplotMatrix(~ mpg + disp + drat + wt, data = mtcars, spread = FALSE,
                  lty.smooth = 2, main = "Scater Plot Matrix via car Package")

scatterplotMatrix(~ mpg + disp + drat + wt, data = mtcars,
                   main = "Scater Plot Matrix via car Package")

scatterplotMatrix(~ mpg + disp + drat + wt | cyl, data = mtcars, spread = FALSE,
                  diagonal = "histogram", main = "Scater Plot Matrix via car Package")

scatterplotMatrix(~ mpg + disp + drat + wt | cyl, data = mtcars, spread = FALSE,
                  diagonal = "histogram", main = "Scater Plot Matrix via car Package",
                  by.group = TRUE, col = c('blue','yellow','red'))


# package:gclus, cpairs() ;more advanced
cor(mtcars[c("mpg",'wt','disp','drat')])
library(gclus)
mydata <- mtcars[c(1,3,5,6)]
mydata.corr <- abs(cor(mydata))
mycolors <- dmat.color(mydata.corr)
myorder <- order.single(mydata.corr)
cpairs(data = mydata,
       order = myorder,
       panel.colors = mycolors,
       gap = 0.5, main = 'Variables Orderd and Colored by Correlation'
       )


# high-density scatter plot
set.seed(1234)

n <- 10000
c1 <- matrix(rnorm(n, mean = 0, sd = 0.5),ncol = 2)
c2 <- matrix(rnorm(n, mean = 3, sd = 2), ncol = 2)
mydata <- rbind(c1,c2)
mydata <- as.data.frame(mydata)
names(mydata) <- c('x','y')

with(mydata,
     plot(x, y, pch=19, main = 'Scatter Plot With 10000 Observations'))

with(mydata,
     smoothScatter(x, y, main = 'Scatter Plot Colored by Smoothed Densitied'))

# 3-D scatter plot
library(rgl)
with(mtcars,
     plot3d(wt, disp, mpg, col = 'red', size = 5))

