planes %>% 
  count(tailnum) %>%
  filter(n > 1)
flights %>% 
  arrange(year, month , day, tailnum) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()
flights2 <- flights %>%
  select(year: day, hour, origin, dest, tailnum, carrier)

flights2 %>%
  select(-origin, -dest) %>%
  left_join(select(planes, tailnum, year, model), by = "tailnum")

airports_delay <- group_by(flights, dest) %>%
  summarise(
    mean = mean(arr_delay, na.rm = T)
  ) %>%
  left_join(airports, by = c("dest" = "faa"))

planes2 <- group_by(flights, tailnum) %>%
  summarise(
    mean = mean(arr_delay, na.rm = T)
  ) %>%
  left_join(filter(mutate(planes, age = 2013 - year),age < 40), by = "tailnum")

ggplot(data = filter(planes2, mean < 100), mapping = aes(mean, age)) +
  geom_jitter(na.rm = T) +
  geom_smooth(na.rm = T)
ggplot(data = planes2) +
  geom_boxplot(aes(age, mean, group = cut_width(age, 3)), na.rm = T)
  
ggplot(filter(airports_delay, min_rank(desc(mean)) <= 50), mapping = aes(lon, lat)) +
  borders("state") +
  geom_jitter(aes(size = mean), na.rm = T) +
  coord_quickmap()

weather_delay <- filter(flights, origin == "EWR") %>% 
  group_by(year, month, day) %>%
  summarise(mean = mean(dep_delay, na.rm = T)) %>%
  left_join(weather2)

weather2 <- group_by(weather, year, month, day) %>%
  summarise(
    wind_speed = mean(wind_speed, na.rm = T),
    visib = mean(visib, na.rm = T),
    temp = mean(temp, na.rm = T)
  )

ggplot(filter(weather2, wind_speed < 20), aes(wind_speed, visib)) +
  geom_point(na.rm = T) +
  geom_smooth(na.rm = T)

a <- tribble(
  ~no, ~name,
  1, "甲",
  2, "乙",
  3, "丁")
b <- tribble(
  ~no, ~name,
  1, "甲",
  2, "丙")
