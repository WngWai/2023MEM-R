x <- c(10, 3, -1, -5, 0)
x[-which(x > 0)]
x[x <= 0]
-which(x > 0)

a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))
str(a[1:2])
str(a[4])
b <- tibble(a = 1:3, b = 2:4, c = 3:5)
b[,2][2,]

x <- 1:10
attr(x, "greeting")
as.Date
hms::hms(600)
