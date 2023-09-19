library(nycflights13)
variable <- c(names(flights))

paste("NA_"+i)
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

