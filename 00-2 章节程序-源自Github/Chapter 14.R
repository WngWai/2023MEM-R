library(tidyverse)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
df
x <- df$a
(x - min(x, na.rm = T)) / (max(x, na.rm = T) - min(x, na.rm = T))
rng <- range(x, na.rm = T)

rescale01 <- function(x){
  rng <- range(x, na.rm = T)
  (x - rng[1]) / (rng[2] - rng[1])
}

mean(is.na(x))
x / sum(x, na.rm = T)
sd(x, na.rm = T) / mean(x, na.rm = T)

is_directory <- function(x) file.info(x)$isdir
is_directory("C:\\Users\\13522\\Desktop\\X\\R\\R for Data Science\\Chapter 1.R")

x <- 2
any(x == 2)
near(x, 2)

switch(x,
  a = ,
  b = "ab",
  c = ,
  d = "cd"
)

wt_mean <- function(x, w, na.rm = FALSE){
  stopifnot(is.logical(na.rm), length(na.rm) == 1)
  stopifnot(length(x) == length(w))
  
  if (na.rm) {
    miss <- is.na(x) | is.na(w)
    x <- x[!miss]
    w <- w[!miss]
  }
  sum(w * x) / sum(x)
}

wt_mean(1:6, 6:1, na.rm = F)
