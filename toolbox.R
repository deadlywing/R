# toolbox
library(ggplot2)
df <- data.frame(
  x = c(3,1,5),
  y = c(2,4,6),
  label = c("a", "b", "c")
)

p <- ggplot(df, aes(x, y)) + xlab(NULL) + ylab(NULL)
p + geom_point() + labs(title = "geom_point")
p + geom_bar(stat = "identity") + labs(title = "geom_bar")
p + geom_text(aes(label = label)) + labs(title = "geom_text")

# eg
depth_dist <- ggplot(diamonds, aes(depth)) + xlim(58, 68)
depth_dist + geom_histogram(aes(y = ..density..), binwidth = 0.1) +
  facet_grid(cut ~ .)
depth_dist + geom_histogram(aes(fill = cut), binwidth = 0.1, position = "fill")
depth_dist + geom_freqpoly(aes(y = ..density.., color = cut), binwidth = 0.1)

# eg.2
library(plyr)
qplot(cut, depth, data = diamonds, geom = "boxplot")
qplot(carat, depth, data = diamonds, geom = "boxplot",
      group = round_any(carat, 0.1, floor), xlim = c(0, 3))
qplot(depth, data = diamonds, geom = "density", xlim = c(54, 70),
      fill = cut, alpha = I(0.2))

# overplotting
df <- data.frame(x = rnorm(2000), y = rnorm(2000))
norm <- ggplot(df, aes(x, y))
norm + geom_point()
norm + geom_point(shape = 1)
norm + geom_point(shape = ".")
norm + geom_point(col = "black", alpha = 1/10)

# eg
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3) +
  theme(legend.position = "none")
d + geom_point() + geom_density2d()
d + stat_density2d(geom = "point", mapping = aes(size = ..density..),
                   contour = F) + scale_size_area()
d + stat_density2d(geom = "tile", aes(fill = ..density..), contour = F)
last_plot() + scale_fill_gradient(limits = c(1e-5, 8e-4))

# eg.2
library(ggplot2)
d <- subset(diamonds, carat < 2.5 & rbinom(nrow(diamonds), 1, 0.2) == 1)
d$lcarat <- log10(d$carat)
d$lprice <- log10(d$price)

detrend <- lm(lprice ~ lcarat, data = d)
d$lprice2 <- resid(detrend)
mod <- lm(lprice2 ~ lcarat * color, data = d)

# eg.3
library(ggplot2)
d <- ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()
d
d + stat_summary(fun.data = "mean_cl_boot", col = "red", size = 2)
# or
d + stat_summary(fun.y = "median", colour = "red", size = 2, geom = "point")
d + stat_summary(fun.y = "mean", colour = "red", size = 2, geom = "point")
d + aes(colour = factor(vs)) + stat_summary(fun.y = mean, geom="line")
d + stat_summary(fun.y = mean, col = "red", na.rm = T, geom = "point")
d + stat_summary(fun.y = mean, fun.ymin = min, fun.ymax = max,
                 colour = "red")

# eg.4
d <- ggplot(diamonds, aes(cut))
d + geom_bar()
d + stat_summary(mapping = aes(y = price), fun.y = "mean", geom = "bar")
p <- ggplot(mtcars, aes(cyl, mpg)) +
  stat_summary(fun.y = "mean", geom = "point")
p
# following is the wrong way
p + ylim(15, 30)
# the indeed true way
p + coord_cartesian(ylim = c(15, 30))

# eg.5
stat_sum_df <- function(fun, geom="crossbar", ...) {
  stat_summary(fun.data = fun, colour = "red", geom = geom, width = 0.2, ...)
}
d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
d + stat_sum_df("mean_cl_boot", mapping = aes(group = cyl))
d + stat_sum_df("mean_sdl", mapping = aes(group = cyl))

# fig annotation
library(ggplot2)
unemp <- qplot(date, unemploy, data = economics, geom = "line",
               xlab = "", ylab = "No. unemployed (1000s)")
unemp

presidential <- presidential[-(1:3),]
yrng <- range(economics$unemploy)
xrng <- range(economics$date)
unemp + geom_vline(aes(xintercept = as.numeric(start)), data = presidential)

library(scales)
# draw the rectangles
# fill the colors with the corresponding names
cols <- c("Republican" = "green", "Democratic" = "red")
unemp + geom_rect(aes(NULL, NULL, xmin = start, xmax = end, fill = party), 
                  ymin = yrng[1], ymax = yrng[2],
                  data = presidential, alpha = 0.2) + scale_fill_manual(
                    values = cols)
# add text
last_plot() + geom_text(aes(x = start, y = yrng[1], label = name),
                        data = presidential, size = 3, hjust = 0, vjust = 0)

caption <- paste(strwrap("Unemployment rates in the US have varied a lot over 
    the years", 40), collapse = "\n")
unemp + geom_text(aes(x, y, label = caption), 
                  data = data.frame(x = xrng[2], y = yrng[2]),
                  hjust = 1, vjust = 1, size = 4)
unemp + geom_text(aes(x, y, label = caption), 
                  data = data.frame(x = xrng[2], y = yrng[2]),
                  hjust = 2, vjust = 2, size = 4)
# mark the maximum point
highest <- subset(economics, unemploy == max(unemploy))
unemp + geom_point(data = highest, size = 3, col = "red", alpha = 0.5)

# tips on weighted data
qplot(percwhite, percbelowpoverty, data = midwest)
qplot(percwhite, percbelowpoverty, data = midwest,
      size = poptotal / 1e6) + scale_size_area("Population\n(millions)", 
                                               breaks = c(0.5, 1, 2, 4))
qplot(percwhite, percbelowpoverty, data = midwest, size = area) + scale_size_area()

lm_smooth <- geom_smooth(method = lm, size = 1)
qplot(percwhite, percbelowpoverty, data = midwest) + lm_smooth
# equivalent to weighted linear model
qplot(percwhite, percbelowpoverty, data = midwest,
      weight = popdensity, size = popdensity) + lm_smooth

qplot(percbelowpoverty, data = midwest, binwidth = 1)
qplot(percbelowpoverty, data = midwest, 
      weight = poptotal, binwidth = 1) + ylab("Population")
