# 1. line chart
head(Orange)
layout(matrix(c(1,2),ncol = 2))
t1 <- subset(Orange, Tree == 1)
plot(t1$age, t1$circumference,
     xlab = "AGE", ylab = "Circumference",
     main = 'Orange Tree 1 Growth')
plot(t1$age, t1$circumference,
     xlab = "AGE", ylab = "Circumference",
     main = 'Orange Tree 1 Growth',
     type = 'b')

layout(matrix(c(1),ncol = 1))

# eg
Orange$Tree <- as.numeric(Orange$Tree)
ntrees <- max(Orange$Tree)

xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

plot(xrange, yrange,
     type = 'n',
     xlab = 'AGE', ylab = 'Circumference')

colors <- rainbow(ntrees)
linetypes <- c(1:ntrees)
plotchar <- seq(18, 18 + ntrees, 1)

for(i in 1:ntrees){
  tree <- subset(Orange, Tree == i)
  lines(tree$age, tree$circumference,
        type = 'b',
        lwd = 2, lty = linetypes[i],
        col = colors[i], pch = plotchar[i])
}

title(main = "Tree Growth", sub = 'Exampleof line Plot', col.main = "pink",
      cex.main = 1.5)

legend(x = xrange[1], y = yrange[2],
       legend = c(1:ntrees), title = 'Tree',title.col = 'pink',
       cex = 0.8, col = colors, pch = plotchar, lty = linetypes)

# 2.correlation plot  (useful!!)
library(corrgram)

# eg.1
corrgram(mtcars, order = TRUE, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt,
         main = "Correlogram of mtcars intercorrelations")
# eg.2
corrgram(mtcars,order = TRUE, lower.panel = panel.ellipse,
         upper.panel = panel.pts, text.panel = panel.txt,
         diag.panel = panel.minmax,
         main = 'Correlogram of mtcars data using scatter plots and ellipses')
# eg.3
corrgram(mtcars, lower.panel = panel.shade,
         upper.panel = NULL, text.panel = panel.txt,
         main = "Car Mileage Data(Unsorted)")

corrgram(mtcars, lower.panel = panel.shade, order = TRUE,
         upper.panel = NULL, text.panel = panel.txt,
         main = "Car Mileage Data(Unsorted)")
