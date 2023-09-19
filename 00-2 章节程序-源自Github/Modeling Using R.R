library(tidyverse)
library(modelr)
options(na.action = na.warn)
library(lubridate)
library(nycflights13)

ggplot(sim1, aes(x, y)) +
  geom_point()
models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x, y)) +
  geom_abline(
    aes(intercept = a1, slope = a2),
    data = models, alpha = .25
  ) +
  geom_point()
model1 <- function(a, data){
  a[1] + data$x * a[2]
} #用于计算预测值，a是模型参数
model1(c(7, 1.5), sim1)

measure_distance <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  sqrt(mean(diff ^ 2))
} #用于计算模型MSE
measure_distance(c(7, 1.5), sim1)

sim1_dist <- function(a1, a2){
  measure_distance(c(a1, a2), sim1)
} #用于计算以a1,a2为参数sim1模型的MSE

models <- models %>%
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(models, rank(dist) <= 10)
  ) #选取MSE最小的十组参数

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
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))
grid

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

best <- optim(c(0, 0), measure_distance_abs, data = sim1)
best$par

measure_distance_abs <- function(mod, data){
  diff <- data$y - model1(mod, data)
  mean(abs(diff))
}

#异常值对简单线性模型的拟合效果的影响
sim1a <- tibble(
  x = rep(1:10, each = 3),
  y = x * 1.5 + 6 + rt(length(x), df = 2)
)
sim1a_mod <- lm(y ~ x, data = sim1a)
coef(sim1a_mod)
ggplot(sim1a, aes(x, y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(
    intercept = coef(sim1a_mod)[1],
    slope = coef(sim1a_mod)[2]
  )

sim1_mod <- lm(y ~ x, data = sim1)
sim1 <- sim1 %>%
  add_predictions(sim1_mod)
sim1 <- sim1 %>%
  add_residuals(sim1_mod)
sim1
predict(sim1_mod, sim1) #对比

ggplot(sim1, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)
ggplot(sim1, aes(x, resid)) +
  geom_ref_line(h = 0) +
  geom_point()

ggplot(sim2) +
  geom_point(aes(x, y))
mod2 <- lm(y ~ x, sim2)
grid <- sim2 %>%
  data_grid(x) %>%
  add_predictions(mod2) #参数为模型
grid
sim2 %>%
  group_by(x) %>%
  summarise(mean = mean(y)) 

mod1 <- lm(y ~ x1 + x2, data = sim3)
mod2 <- lm(y ~ x1 * x2, data = sim3)

grid <- sim3 %>%
  data_grid(x1, x2) %>%
  gather_predictions(mod1, mod2)
grid

mod1 <- lm(y ~ x1 + x2, data = sim4)
mod2 <- lm(y ~ x1 * x2, data = sim4)
grid <- sim4 %>%
  data_grid(
    x1 = seq_range(x1, 5),
    x2 = seq_range(x2, 5)
  ) %>%
  gather_predictions(mod1, mod2)
grid

ggplot(grid, aes(x1, pred, color = x2, group = x2)) +
  geom_line() +
  facet_wrap(~ model) #注意参数group

ggplot(diamonds, aes(cut, price)) +
  geom_boxplot()
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 50)
diamonds2 <- diamonds %>%
  filter(carat <= 2.5) %>%
  mutate(lprice = log2(price), lcarat = log2(carat))
ggplot(diamonds2, aes(lcarat, lprice)) +
  geom_hex(bins = 50)
mod_diamond <- lm(lprice ~ lcarat, data = diamonds2)
grid <- diamonds2 %>%
  data_grid(carat = seq_range(carat, 20)) %>%
  mutate(lcarat = log2(carat)) %>%
  add_predictions(mod_diamond, var = "lprice") %>%
  mutate(price = 2 ^ lprice)
grid
ggplot(diamonds2, aes(carat, price)) +
  geom_hex(bins = 50) +
  geom_line(data = grid, color = "red", size = 1)
diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond, "lresid")
diamonds2
ggplot(diamonds2, aes(cut, lresid)) +
  geom_boxplot()

mod_diamond2 <- lm(
  lprice ~ lcarat + color + cut + clarity,
  data = diamonds2
)
grid <- diamonds2 %>%
  data_grid(cut, .model = mod_diamond2) %>%
  add_predictions(mod_diamond2)
grid
ggplot(grid, aes(cut, pred)) +
  geom_point()
count(grid, cut, pred)

diamond2 <- diamonds2 %>%
  add_predictions(mod_diamond2, var = "lpred") %>%
  add_residuals(mod_diamond2, "lresid")
diamond2 <- diamond2 %>%
  mutate(pred = 2 ^ lpred, resid = 2 ^ lresid)
test <- filter(diamond2, rank(abs(resid)) >= 50000)
ggplot(test, aes(cut, resid)) +
  geom_violin()
count(test, cut)
test2 <- filter(diamond2, rank(abs(resid)) <= 5000)
ggplot(test2, aes(cut, resid)) +
  geom_dotplot()
count(test2, cut)

daily <- flights %>%
  mutate(date = make_date(year, month, day)) %>%
  group_by(date) %>%
  summarise(n = n())
ggplot(daily, aes(date, n)) +
  geom_line()
daily <- daily %>%
  mutate(wday = wday(date, label = T))
mod <- lm(n ~ wday, data = daily)

grid <- daily %>%
  data_grid(wday) %>%
  add_predictions(mod, "n")

ggplot(daily, aes(wday, n)) +
  geom_boxplot() +
  geom_point(data = grid, color = "red", size = 4)
daily <- daily %>%
  add_residuals(mod)
daily %>%
  ggplot(aes(date, resid, color = wday)) +
  geom_ref_line(h = 0) +
  geom_line()

test4 <- daily %>%
  filter(wday == daily[[5,3]])
ggplot(test4, aes(date, resid)) +
  geom_ref_line(h = 0) +
  geom_line()
ggplot(filter(daily, wday == "周一"), aes(date, resid)) +
  geom_ref_line(h = 0) +
  geom_line()
daily %>%
  filter(resid < -100)
daily %>%
  ggplot(aes(date, resid)) +
  geom_ref_line(h = 0) +
  geom_line(color = "grey50") +
  geom_smooth(se = F, span = 0.2)
daily %>%
  filter(wday == "周六") %>%
  ggplot(aes(date, n)) +
  geom_point() +
  geom_line() +
  scale_x_date(
    NULL,
    date_breaks = "1 month",
    date_labels = "%b")
term <- function(date){
  cut(date, 
      breaks = ymd(20130101, 20130605, 20130825, 20140101),
      labels = c("spring", "summer", "fall")) #连续变量离散化
}
daily <- daily %>%
  mutate(term = term(date))
daily %>%
  filter(wday == "周六") %>%
  ggplot(aes(date, n, color = term)) +
  geom_point(alpha = 0.3) +
  geom_line() +
  scale_x_date(
    NULL,
    date_breaks = "1 month",
    date_labels = "%b"
  )
daily %>%
  ggplot(aes(wday, n, color = term)) +
  geom_boxplot()

mod1 <- lm(n ~ wday, data = daily)
mod2 <- lm(n ~ wday * term, data = daily)
daily %>%
  gather_residuals(without_term = mod1, with_term = mod2) %>%
  ggplot(aes(date, resid, color = model)) +
  geom_line(alpha = 0.75)
grid <- daily %>%
  data_grid(wday, term) %>%
  add_predictions(mod2, "n")

ggplot(daily, aes(wday, n)) +
  geom_boxplot() +
  geom_point(data = grid, color = "red") +
  facet_wrap(~ term)

mod3 <- MASS::rlm(n ~ wday * term, data = daily)
daily %>%
  add_residuals(mod3, "resid") %>%
  ggplot(aes(date, resid)) +
  geom_hline(yintercept = 0, size = 2, color = "white") +
  geom_line()

compute_vars <- function(data){
  data %>%
    mutate(
      term = term(date),
      wday = wday(date, label = T)
    )
}
