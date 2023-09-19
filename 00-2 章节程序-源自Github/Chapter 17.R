
# Chapter 17 2020-01-28 ---------------------------------------------------

library(tidyverse)
library(modelr)
options(na.action = na.warn)

models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x, y)) +
  geom_point()

model1 <- function(a, data) {
  a[1] + data$x * a[2]
}
model1(c(7, 1.5), sim1)

measure_distance <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  sqrt(mean(diff ^ 2))
}
measure_distance(c(7, 1.5), sim1)

sim1_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1)
}

models <- models %>% 
  mutate(dist = map2_dbl(a1, a2, sim1_dist))
models

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(models, rank(dist) <= 10)
  )

ggplot(models, aes(a1, a2)) +
  geom_point(
    data = filter(models, rank(dist) <= 10),
    size = 4, color = "red"
  ) +
  geom_point(aes(color = -dist))

grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
) %>%
  mutate(dist = map2_dbl(a1, a2, sim1_dist))

grid %>%
  ggplot(aes(a1, a2)) +
  geom_point(
    data = filter(grid, rank(dist) <= 10),
    size = 4, color = "red"
  ) +
  geom_point(aes(color = -dist))

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(grid, rank(dist) <= 10)
  )

best <- optim(c(0, 0), measure_distance, data = sim1)
best$par

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(intercept = best$par[1], slope = best$par[2])

sim_mod <- lm(y ~ x, data = sim1)
coef(sim_mod)

sim1a <- tibble(
  x = rep(1:10, each = 3),
  y = x * 1.5 + 6 + rt(length(x), df = 2)
)

ggplot(sim1a, aes(x, y)) +
  geom_point()
sim1a_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1a)
}

models2 <- tibble(
  a1 = runif(250, -20, 20),
  a2 = runif(250, 0, 10)
)

models2 <- models2 %>% 
  mutate(dist = map2_dbl(a1, a2, sim1a_dist))

ggplot(sim1a, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(aes(intercept = a1, slope = a2), data = filter(models2, rank(dist) <= 10))

best2 <- optim(c(0, 0), measure_distance, data = sim1a)
best2$par

measure_distance_abs <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  mean(abs(diff))
}

best <- optim(c(0, 0), measure_distance_abs, data = sim1)
best$par

model2 <- function(a, data) {
  a[1] + data$x * a[2] + a[3]
}
measure_distance2 <- function(mod, data) {
  diff <- data$y - model2(mod, data)
  sqrt(mean(diff ^ 2))
}
optim(c(0, 0), measure_distance2, data = sim1)

sim_mod_loess <- loess(y ~ x, data = sim1)
grid2 <- sim1 %>% 
  data_grid(x)
grid2 <- grid2 %>%
  add_predictions(sim_mod_loess)

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(
    aes(y = pred),
    data = grid2,
    color = "red",
    size = 1
  ) +
  geom_smooth(aes(y = y), se = F)


# 17.4.3 Interaction Item (Continuous Variables） --------------------------

mod1 <- lm(y ~ x1 + x2, data = sim4)
mod2 <- lm(y ~ x1 * x2, data = sim4)
grid <- sim4 %>%
  data_grid(
    x1 = seq_range(x1, 5),
    x2 = seq_range(x2, 5)
  ) %>%
  gather_predictions(mod1, mod2)

ggplot(grid, aes(x1, x2)) +
  geom_tile(aes(fill = pred)) +
  facet_wrap(~ model)

ggplot(grid, aes(x1, pred, color = x2, group = x2)) +
  geom_line() +
  facet_wrap(~ model)


# 17.4.4 Variables Transform ----------------------------------------------

df <- tribble(
  ~y, ~x,
  1, 1,
  2, 2,
  3, 3
)

model_matrix(df, y ~ x^2 + x)
model_matrix(df, y ~ I(x^2) + x)
model_matrix(df, y ~ ns(x, 2))

sim5 <- tibble(
  x = seq(0, 3.5 * pi, length = 50),
  y = 4 * sin(x) + rnorm(length(x))
)
ggplot(sim5, aes(x, y)) +
  geom_point()

mod1 <- lm(y ~ ns(x, 1), data = sim5)
mod <- function(N) {
    lm(y ~ ns(x, N), data = sim5)
}

mod1 <- mod(1)
mod2 <- mod(2)
mod3 <- mod(3)
mod4 <- mod(4)
mod5 <- mod(5)

grid <- sim5 %>%
  data_grid(x = seq_range(x, n = 50, expand = 0.1)) %>%
  gather_predictions(mod1, mod2, mod3, mod4, mod5, .pred = "y")

ggplot(sim5, aes(x, y)) +
  geom_point() +
  geom_line(data = grid, color = "red") +
  facet_wrap(~ model)

