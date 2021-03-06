# scale
rm(list = ls())
library(ggplot2)
plot <- qplot(cty, hwy, data = mpg)
plot
# change the scale
plot + aes(x = drv)
plot + aes(x = drv) + scale_x_discrete()

# eg.1
p <- qplot(sleep_total, sleep_cycle, data = msleep, col = vore)
p
# add the scale manually 
p + scale_color_hue()

# change the default parameters of scales
p + scale_color_hue(name = "What dose\nnit eat",
                    breaks = c("herbi", "carni", "omni", NA),
                    labels = c("plants", "meat", "both", "don't know"))
p + scale_color_brewer(palette = "Set1", na.value = "pink")
p + scale_color_brewer(palette = "Oranges")
# show all the names of color
colours()
# ?plotmath to show the math expressions

# some paras
p <- qplot(cty, hwy, data = mpg, col = displ)
p
p + scale_x_continuous("City mpg")
p + xlab("City mpg")
p + ylab("Highway mpg")

p <- qplot(cyl, wt, data = mtcars)
p
p + scale_x_continuous(breaks = c(5.5, 6.5))
p + scale_x_continuous(limits = c(5.5, 6.5))

p <- qplot(wt, cyl, data = mtcars, col = cyl)
p
p + scale_colour_gradient(breaks = c(5.5, 6.5))
p + scale_colour_gradient(limits = c(5.5, 6.5))

# some differences between two ways
qplot(log10(carat), log10(price), data = diamonds)
qplot(carat, price, data = diamonds) + scale_x_log10() + scale_y_log10()

# scales of manual
plot <- qplot(brainwt, bodywt, data = msleep, log = "Xy")
plot + aes(col = vore) + scale_colour_manual(values = c("red", "orange","yellow",
                                                      "green", "blue"))
colours <- c("carni" = "red", "NA" = "orange", "insecti" = "yellow",
             "herbi" = "green", "omni" = "blue")
plot + aes(col = vore) + scale_colour_manual(values = colours)
plot + aes(shape = vore) + scale_shape_manual(values = c(1, 2, 6, 0, 23))

# eg.2
rm(list = ls())
library(ggplot2)

huron <- data.frame(year = 1875:1972, level = LakeHuron)
ggplot(huron, aes(year)) + geom_line(aes(y = level - 5), col = "blue") + 
  geom_line(aes(y = level + 5), col = "red")

# use scale_colour_manual to modify the legend
ggplot(huron, aes(year)) + 
  geom_line(aes(y = level - 5, col = "below")) + 
  geom_line(aes(y = level + 5, col = "above"))

ggplot(huron, aes(year)) + 
  geom_line(aes(y = level - 5, col = "below")) + 
  geom_line(aes(y = level + 5, col = "above")) + 
  scale_colour_manual(name = "Direction", values = c("below" = "blue", "above" = "red"))

ggplot(huron, aes(year)) + 
  geom_line(aes(y = level - 5, col = "below")) + 
  geom_line(aes(y = level + 5, col = "above")) + 
  scale_colour_manual(name = "Direction", values = c("below" = "yellow", "above" = "orange"))

