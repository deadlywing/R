# layers
library(ggplot2)
p <- ggplot(diamonds, aes(carat))
p + geom_histogram(binwidth = 2, fill = "steelblue")

# following are equal
qplot(sleep_rem / sleep_total, awake, data = msleep) + geom_smooth()
qplot(sleep_rem / sleep_total, awake, data = msleep, geom = c("point", "smooth"))
ggplot(data = msleep,mapping = aes(sleep_rem / sleep_total, awake)) + 
  geom_point() + geom_smooth()

# eg.1
library(scales)
bestfit <- geom_smooth(method = "lm", se = FALSE,
                       color = alpha("steelblue", 0.5), size = 2)
qplot(sleep_rem, sleep_total, data = msleep) + bestfit
qplot(awake, brainwt, data = msleep, log = 'y') + bestfit
qplot(bodywt, brainwt, data = msleep, log = 'xy') + bestfit

# eg.2
p <- ggplot(mtcars)
summary(p)
p <- p + aes(wt, hp)

p <- ggplot(mtcars, aes(x = mpg, y = wt))
p + geom_point()
p + geom_point(mapping = aes(col = factor(cyl)))
p + geom_point(mapping = aes(y = disp))

# eg.3
library(nlme)
p <- ggplot(Oxboys, aes(age, height, group = Subject)) + geom_line()
p
p + geom_smooth(mapping = aes(group = 1),method = "lm", size = 2, se = F)

boysbox <- ggplot(Oxboys, aes(Occasion, height)) + geom_boxplot()
boysbox
boysbox + geom_line(mapping = aes(group = Subject), col = "red")

# stat
ggplot(diamonds, aes(carat)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.1)
ggplot(diamonds, aes(carat)) + 
  geom_histogram(binwidth = 0.1)

d <- ggplot(diamonds, aes(carat)) + xlim(0, 3)
d + stat_bin(binwidth = 0.1)
d + stat_bin(aes(y = ..count..), binwidth = 0.1, fill = "blue", col = "green")
d + stat_bin(aes(y = ..count..), binwidth = 0.1, geom = "area", 
             fill = "red", col = "green")
d + stat_bin(
  aes(size = ..density..), binwidth = 0.1,
  geom = "point", position = "identity"
)

# mixed model
library(nlme)
model <- lme(height ~ age, data = Oxboys,
             random = ~ 1 + age | Subject)
oplot <- ggplot(Oxboys, aes(x = age, y = height, group = Subject)) + geom_line()
oplot

age_grid <- seq(-1, 1, length = 10)
subjects <- unique(Oxboys$Subject)
# generate grid dataframe
preds <- expand.grid(age = age_grid, Subject = subjects)
# data argument needs to be a dataframe
preds$height <- predict(model, preds)

# update dataset
oplot + geom_line(data = preds, col = "#3366FF", size = 0.4)
Oxboys$fitted <- predict(model)
Oxboys$resid <- with(Oxboys, fitted - height)
oplot %+% Oxboys + aes(y = resid) + geom_smooth(aes(group = 1)) 

# update the model
model2 <- update(model, height ~ age + I(age ^ 2))
Oxboys$fitted2 <- predict(model2)
Oxboys$resid2 <- with(Oxboys, fitted2 - height)
oplot %+% Oxboys + aes(y = resid2) + geom_smooth(aes(group = 1))
