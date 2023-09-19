#函数
rescale01 <- function(x) {
  rng <- range(x,na.rm = TRUE)
  (x - rng[1])/rng[2] -rng[1]
}
rescale01(c(0,10,20))

#法一
function1 <- function(x,y,z){
  count <- x^2+y^2+z^2
}
(function1(1,2,3))
#法二
function2 <- function(x){
  count <- x[1]^2+x[2]^2+x[3]^2
}
(function2(c(1,2,3)))