# ggplot2 - qplot()
library(ggplot2)

# data set:diamonds,dsmall
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds),100),]

qplot(carat, price, data = diamonds)
# log-transform
qplot(carat, price, data = diamonds, log = 'xy')
qplot(carat, x*y*z, data = diamonds)


# color,shape,size and other attributes
qplot(carat, price, data = dsmall, col = color)
qplot(carat, price, data = dsmall, shape = cut)
# alpha attribute
qplot(carat, price, data = diamonds, alpha = I(1/200))

# add smooth curve
qplot(carat, price, data = dsmall, geom = c('point', 'smooth'))
qplot(carat, price, data = diamonds, geom = c('point', 'smooth'))

# facet
qplot(carat, data = diamonds,facets = color ~ .,
      geom = 'histogram', binwidth = 0.1, xlim = c(0, 3))
qplot(carat, ..density.., data = diamonds, facets = color ~ .,
      geom = "histogram", binwidth = 0.1, xlim = c(0, 3))

# scatter
library(ggplot2)
qplot(displ, hwy, data = mpg, col = factor(cyl))

qplot(displ, hwy, data = mpg, facets = . ~ year) + geom_smooth()
