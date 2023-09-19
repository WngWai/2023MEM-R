library(tidyverse)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
output <- vector("double", ncol(df))
for (i in seq_along(df)) {
  output[[i]] <- median(df[[i]])
}
output

cars <- vector("double", ncol(mtcars))
for (i in seq_along(mtcars)) {
  cars[[i]] <- mean(mtcars[[i]])
}
cars

type <- vector("character", ncol(flights))
for (i in seq_along(flights)) {
  type[[i]] <- typeof(flights[[i]])
}
type

unique <- vector("double", ncol(iris))
for (i in seq_along(iris)) {
  unique[[i]] <- nrow(unique(iris[i]))
}

out <- ""
for (x in letters) {
  out <- str_c(out, x)
}

c <- c(x = 1, y = 2, z = 3)
results <- vector("list", length(c))
names(results) <- names(c)
for (i in seq_along(c)) {
  results[[i]] <- c[[i]]
}

means <- c(0, 1, 2)
output <- double()
for (i in seq_along(means)) {
  n <- sample(100, 1)
  output <- c(output, rnorm(n, means[[i]]))
}
str(output)

out <- vector("list", length(means))
for (i in seq_along(means)) {
  n <- sample(100, 1)
  out[[i]] <- rnorm(n, means[[i]])
}
str(unlist(out))

microbenchmark::microbenchmark(
  for (i in seq_along(means)) {
    n <- sample(100, 1)
    out[[i]] <- rnorm(n, means[[i]])
  },
  for (i in seq_along(means)) {
    n <- sample(100, 1)
    output <- c(output, rnorm(n, means[[i]]))
  }
  )

flip <- function()sample(c("T", "H"), 1)
flips <- 0
nheads <- 0
while (nheads < 3) {
  if (flip() == "H") {
    nheads <- nheads + 1
  } else {
    nheads <- 0
  }
  flips <- flips + 1
}

files <- dir("data/", pattern = "\\.csv$", full.names = T)
data <- vector("list", length(files))
names(data) <- files
for (i in seq_along(files)) {
  data[[i]] <- read_csv(file = files[i], col_names = T)
}

show_mean <- function(x) {
  a <- vector("character", length(x))
  for (i in seq_along(x)) {
    a[i] <- paste(names(iris)[i], ": ", round(mean(iris[[i]]), 2), sep = "")
  }
  print(a)
}

show_mean <- function(x) {
  for (i in seq_along(x)) {
    if (is.numeric(x[[i]] == FALSE)) 
    paste(names(x)[i], ": ", round(mean(x[[i]]), 2), sep = "") %>% print()
  }
}

for (i in 1:5) {
    if (is.numeric(data[[i]] == FALSE)) {
    next}
    print(names(data[i]))
}

vec <- c(9,31,28,82,43,87,12,58)
for (el in vec) {
  if (el %% 2 == 0)
    next
  print(el)
}

col_summary <- function(df, fun) {
  out <- vector("double", length(df))
  for (i in seq_along(df)) {
    out[i] <- fun(df[[i]])
  }
  out
}

df <- tibble(
  a = rnorm(10000),
  b = rnorm(10000),
  c = rnorm(10000),
  d = rnorm(10000)
)

col_summary(df, mean)
map_dbl(df, mean)
microbenchmark::microbenchmark(
  col_summary(df, mean),
  map_dbl(df, mean)
)

unique_number <- function(df) {
  out <- vector("double", length(df))
  for (i in seq_along(df)) {
    out[i] <- length(unique(df[[i]]))
  } 
  out
}

unique2 <- function(df) {
  length(unique(df))
}


set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, replace = TRUE)))
names(df) <- letters[1:6]
fix_missing <- function(x) {
  x[x == -99] <- NA
  x
}
df <- lapply(df, fix_missing)
summary_rewrite <- function(x) {
  funs <- c(median, mean, sd)
  lapply(funs, function(f) f(x, na.rm = TRUE))
}

minN_then_square <- function(N) {
  function(x) {
    (x - N) ^ 2
  }
}
min1_then_square <- minN_then_square(1)

system.time( {
  x <- c()
  for (i in 1:200000) {
    if (i %% 2 == 0) {
      x <- c(x, i)
    }
  }
} )

system.time(
  {
    a <- 1:200000
    x <- a[a %% 2 == 0]
  }
)

col_sum <- function(df) {
  out <- df %>% keep(is.numeric) %>% map(summary)
  out
}
col_sum(iris)

show_mean <- function(df) {
  out <- df %>% keep(is.numeric) %>% str() %>% map(mean)
  out
}
show_mean(iris)

col_sum3 <- function(df, f) {
  is_sum <- sapply(df, is.numeric)
  df_num <- df[, is_sum]
  
  sapply(df_num, f)
}

df <- tibble::tibble(
  x = 1:3,
  y = 3:1,
  z = c("a", "b", "c")
)
col_sum3(df[0], mean)
df[0]
df
