
# Chapter 18 2020-01-29 ---------------------------------------------------

library(tidyverse)
library(modelr)
options(na.action = na.warn)
library(nycflights13)
library(lubridate)


# 18.2.1 Price and Weight -------------------------------------------------

ggplot(diamonds, aes(cut, price)) +
  geom_boxplot()
ggplot(diamonds, aes(color, price)) +
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
  add_predictions(mod_diamond, "lprice") %>%
  mutate(price = 2 ^ lprice)

ggplot(diamonds2, aes(carat, price)) +
  geom_hex(bins = 50) +
  geom_line(data = grid, color = "red", size = 1)

diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond, "lresid")

ggplot(diamonds2, aes(lcarat, lresid)) +
  geom_hex(bins = 50)

# 18.2.2 A more complex model ---------------------------------------------

mod_diamond2 <- lm(
  lprice ~ lcarat + color + cut + clarity,
  data = diamonds2
)

grid <- diamonds2 %>%
  data_grid(cut, .model = mod_diamond2) %>%
  add_predictions(mod_diamond2)

ggplot(grid, aes(cut, pred)) +
  geom_point()

diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond2, "lresid2")
ggplot(diamonds2, aes(lcarat, lresid2)) +
  geom_hex(bins = 50)

# 18.3.1 Day in weeks -----------------------------------------------------

daily <- flights %>%
  mutate(date = make_date(year, month, day)) %>%  #make_date生成日期
  group_by(date) %>%
  summarise(n = n())
ggplot(daily, aes(date, n)) +
  geom_line()

daily <- daily %>%
  mutate(wday = wday(date, label = T))
ggplot(daily, aes(wday, n)) +
  geom_boxplot()

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
  ggplot(aes(date, resid)) +
  geom_ref_line(h = 0) +
  geom_line()

ggplot(daily, aes(date, resid, color = wday)) +
  geom_ref_line(h = 0) +
  geom_line()

daily %>%
  ggplot(aes(date, resid)) +
  geom_ref_line(h = 0) +
  geom_line(color = "grey50") +
  geom_smooth(se = F, span = 0.1)
