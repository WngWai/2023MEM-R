#########################################################lessonA2
typeof(letters)
1:10 %% 3==0
(1:10) %% 3==0
c(TRUE,TRUE,FALSE,NA)
x <- sqrt(2L) ^ 2
x
x <- sqrt(2) ^ 2
x
y <- c(TRUE,TRUE,FALSE,NA)
is.na(y)
is.finite(y)
bzhou <- rep(x,1000)
###引入包
#pryr::object_size(bzhou)
bzhou
###########################################################
x <- sample(20,100,replace= TRUE)
x
y <- x > 10
x <- sample(20,100000000,replace= TRUE)
y <- x > 10
sum(y)
#########################################################
x <- sample(20,10000000,replace= TRUE)
y <- x > 10
mean(y)
##########################
funif(10) > 0.5
1:10 + 1:3
################################
install.packages("tidyverse")
tibble(x = 1:4,y = 1:2)
########################################################
x <- c("one","two","three","fouor","five")
x[c(3,2,5)]
##################################################
x <- c(10,3,NA,5,8,1,NA)
x[!is.na(x)]
x[is.na(x)]
############################8章
mpg


