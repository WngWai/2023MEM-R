library(nycflights13)
library(tidyverse)

is.na(flights$dep_time)
filter(flights, is.na(dep_time) == TRUE)
filter(flights, month == 7, day %in% c(2,3,4))
filter(flights, arr_delay < 120 & dep_delay < 120)
filter(flights, carrier %in% c("UA","AA","DL")) 
view(flights)
arrange(flights, desc(is.na(dep_time)))
arrange(flights, desc(air_time))
select(flights, contains("TIME", ignore.case =T))
vars <- c(names(flights))
flights_new <- mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
view(flights_new)
mutate(flights_sml, time = arr_time - dep_time)
flights_sml <- select(flights,year:day, dep_time, arr_time, dep_delay, arr_delay, air_time)
y <- c(4, 6, 11, 2, 8)
min_rank(y)
flights_new <- filter(flights, arr_delay >= 850)
min_rank(desc(flights$air_time))
arrange(flights, desc(arr_delay))
min_rank(flights_new$arr_delay)
filter(flights, min_rank(desc(arr_delay)) <= 10 )

# summarize
delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE)
) %>%
filter(count > 20, dest != "HML")  
ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count, alpha = 1/3)) +
  geom_smooth(se = FALSE)

day_group <- flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))
view(day_group)

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))
!is.na(flights$dep_delay)
is.na(flights$dep_delay)

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(delay = mean(arr_delay), n = n())
ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 0.1)
ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)
summary(delays)  
delays %>%
  filter(n > 23) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 0.2)


batters <- batting %>% 
  group_by(playerID) %>%
  summarize(
    ba = sum(H, na.rm = T) / sum(AB, na.rm = T),
    ab = sum(AB, na.rm = T)
  )

batters %>% 
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
    geom_jitter() +
    geom_smooth(se = F)

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first = min(dep_time),
    last = max(dep_time),
    median = quantile(dep_time, 0.5),
    median_2 = median(dep_time)
  )

not_cancelled %>% 
  group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r)) 

not_cancelled %>%
  group_by(carrier) %>%
  summarize(goal = n_distinct(dest)) %>%
  arrange(desc(goal))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(n_delay = mean(arr_delay > 60))

daily <- group_by(flights, year, month, day)
ungroup(daily)

flights_cancelled <- flights %>%
  group_by(year, month, day) %>%
  summarize(number = sum(is.na(dep_delay) == T),
            mean_delay = mean(arr_delay, na.rm = T)) %>%
  arrange(desc(number))

ggplot(flights_cancelled, aes(x = number, y = mean_delay)) +
  geom_point() +
  geom_smooth(se = F)


not_cancelled %>%
  count(is.na(arr_delay) == T)

flights %>%
  group_by(carrier, dest) %>%
  summarise(
    n(),
    delay_rate = sum(is.na(dep_delay) == T)/n()
  ) %>% arrange(desc(delay_rate))

delay_rank <- flights %>%
  group_by(year, month, day, tailnum) %>%
  summarise(
    n = n(),
    r = rank(x = time_hour),
    delay = sum(arr_delay)
  ) 

flights_sml <- select(flights,
  year : day,
  ends_with("delay"),
  distance,
  air_time)

flights_sml %>%
  group_by(year, month, day) %>%
  filter(rank(desc(arr_delay)) < 10) %>% view()

popular_dests <- flights %>%
  group_by(dest) %>%
  filter(n() > 365) 
popular_dests

flights_rank <- flights %>%
  group_by(tailnum) %>%
  mutate(r = min_rank(time_hour))

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(price), binwidth = 1000) +
  facet_wrap(~color, nrow = 2)

ggplot(data = diamonds) +
  geom_violin(mapping = aes(x = cut, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = x, y = y)) +
  coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))

ggplot(data = smaller, mapping = aes(x = carat, y = price)) +
  geom_smooth(se = F) +
  geom_bin2d()

smaller <- diamonds %>% filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

bigger <- diamonds %>% filter(carat >= 3)
ggplot(data = bigger, mapping = aes(x = carat, y = price)) +
  geom_bin2d()

