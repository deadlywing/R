# important arguments
# pch, cex, lty, lwd, col, bg,
# col.axis,col.lab, col.main, col.sub
# cex.axis,cex.lab, cex.main, cex.sub
# main, sub, xlab, ylab, xlim, ylim

# another function to control the plot
# title()
# axis()


# eg.1
x <- c(1:10)
y <- x
z <- 10 / x

par(mar=c(5,4,4,8) + 0.1)

plot(x, y, type = 'b', 
     pch = 21, col = "red")

plot(x, y, type = 'b', 
     pch = 21, col = "red",
     yaxt = "n", lty = 3, ann = FALSE)

lines(x, z, type = 'b', pch = 22, col = 'blue', lty = 2)

axis(2, at = x, labels = x, col.ticks = 'red', las = 0, col.axis = 'purple')

axis(4,at = z, labels = round(z,digits = 2), col.axis = "blue", las = 2,
     cex.axis = 0.7, tck = -.01)

mtext("y=10/x", side = 4, line = 3,cex.lab = 1, las = 2, col = "blue")

title("An Example of Create Axes",col.main = "red",
      xlab = "X Value", ylab = "Y=X", font.lab = 2)

abline(h=c(1,5,7),col = "yellow")
abline(v=seq(1,10,2), lty = 2, col = "green")


# eg.2

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly = TRUE)

par(lwd = 2, cex = 1.5, font.lab = 2)

plot(dose, drugA, type = 'b',
     pch = 15, lty = 1, col = "red", ylim = c(0,60),
     main = "Drug A vs. Drug B",
     xlab = "Drug Dosege", ylab = "Drug Response")

lines(dose, drugB, type = 'b',
      pch = 17, lty = 2, col = "blue")

abline(h=c(30), lwd = 1.5, lty = 2, col = "gray")

library(Hmisc)
minor.tick(nx = 3, ny = 3, tick.ratio = 0.5)

legend("topleft", inset = 0.05, title = "Drug Type", legend = c("A","B"), 
       lty = c(1,2), pch = c(15,17), col = c("red","blue"))

par(opar)


# eg.3
attach(mtcars)
plot(wt, mpg,
     main = "Mileage vs Car Weight",
     xlab = "Weight", ylab = "Mileage",
     pch = 18, col = "blue")
text(wt, mpg,
     rownames(mtcars),
     cex = 0.6, pos = 4, col = "red")
detach(mtcars)

# eg.4
opar <- par(no.readonly = TRUE)
par(cex = 1.5)
plot(1:7,1:7,type = 'n')

# will overlap 
title(xlab = 'x')

text(3,3,"Example of default text")
text(4,4,"Example of mono-spaced text", family = 'mono')
text(5,5,"Example of serif text",family = 'serif')
par(opar)

# eg.5
attach(mtcars)
layout(matrix(c(1,1,2,3),nrow = 2, byrow = TRUE))
hist(wt)
title(sub = "where is it?",col.sub = "blue")
hist(mpg)
hist(disp)
title(sub = "where is it?")
title(sub = "where is it?", adj = 0)
title(sub = "where is it?", adj = 1)


# eg.6
layout(matrix(c(1,1,2,3),nrow = 2, byrow = TRUE),
       widths = c(3,1), heights = c(1,2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)
