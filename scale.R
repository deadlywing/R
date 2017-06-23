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





