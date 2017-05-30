# create data.frame
kids <- c("jack",'jill')
ages <- c(12,10)
d <- data.frame(kids,ages,stringsAsFactors = F)
d

# access the dataframe
d[[1]] == d$kids
d$kids == d[,1]
d[,1]
d[,1,drop = F]

# subset and complete.cases()
kids <- c('Jack',NA,'Jilian','John')
states <- c('CA','MA','MA',NA)
d4 <- data.frame(kids,states)
complete.cases(d4)
d5 <- d4[complete.cases(d4),]
d4$price <- 1:4
subset(d4,price >= 2)
subset(d4,price >= 2,select = c(kids,states))

# tapply,split,cut
