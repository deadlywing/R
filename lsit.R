# create list
j <- list(name="jow", salary=55000, union=T)
j

# indice of list
j$name
j[["name"]]
j[[1]]

# compare the diff 
j["name"]
j[1]

# add or delete the component
j$c <- "sailing"
j
j[[5]] <- 29
j[6:8] <- c(F,F,T)
j
j$c <- NULL
j
c(j,list(6))

# names, unlist, unname
names(j)
ulj <- unlist(j)
ulj
names(ulj)
unname(ulj)

# apply
lapply(list(1:3,25:29),median)
sapply(list(1:3,25:29),median)
