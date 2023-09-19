library(tidyverse)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
diamonds %>% count(cut)
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))
unusual <- diamonds %>% filter(y < 3 | y > 20)

diamonds %>% count(cut_width(y, 0.5))
ggplot(data = diamonds, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.5)
ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.1)
ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 200) +
  coord_cartesian(ylim = c(0, 2000))
diamonds %>% count(x)
unusual2 <- diamonds %>% filter(y < 2 | y > 20)
filter(diamonds, carat == 1) %>% arrange(desc(price)) 
ggplot(data = diamonds, mapping = aes(x = price, y = ..density.., color = cut)) +
  geom_freqpoly(binwidth = 1000)


diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))
ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = T)
