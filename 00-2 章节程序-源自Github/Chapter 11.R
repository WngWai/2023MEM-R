library(tidyverse)
library(forcats)

gss_cat %>%
  count(race)
ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = F)

gss_cat %>%
  count(partyid)

gss_cat %>%
  mutate(partyid = fct_recode(partyid,
    "Republican, strong" = "Strong republican",
    "Republican, weak" = "Not str republican"
  )) %>%
  count(partyid)


library(tidyverse)
library(lubridate)
library(nycflights13)

myd("Jan/99/30st")
ydm_hms("0010Feb111111")

flights %>%
  select(year, month, day, hour, minute) %>%
  mutate(
    departure = make_datetime(year, month, day, hour, minute)
  )
make_datetime_100 <- function(year, month, day, time){
  make_datetime(year, month, day, time %/% 100, time %% 100)
}
flights_dt <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>%
  select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 86400)

flights_dt %>%
  filter(dep_time < ymd(20130102)) %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 600)

datetime <- ymd_hms("2016-07-08 12:34:56")
year(datetime)
yday(datetime)
wday(datetime, label = T)
minute(datetime)

flights_dt %>%
  mutate(minute = minute(dep_time)) %>%
  group_by(minute) %>%
  summarise(
    avg_delay = mean(arr_delay, na.rm = T),
    n = n()) 

date <- ymd_hms("2016-07-08 12:34:56")
year(datetime) <- 2020
month(datetime) <- 01
ymd("2015-02-01") %>% update(mday = 30)
ymd("2015-02-01") %>% update(hour = 400)

flights_dt %>%
  mutate(dep_day = update(dep_time, month = 1)) %>%
  ggplot(aes(dep_day)) +
  geom_freqpoly(binwidth = as.double(dweeks(1)))

one_pm <- ymd_hms("2016-03-12 13:00:00", tz = "America/New_York")
one_pm + days(1)
flights_dt <- flights_dt %>%
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )

years(1) / days(1)
