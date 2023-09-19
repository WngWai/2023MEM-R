library(nycflights13)
library(tidyverse)
view(flights)
#B
filter(flights, dest == "IAH"|dest=="HOU")
#E
filter(flights, arr_delay >= 120,dep_delay <= 0)
#arrange
arrange(flights,desc(year),desc(month),day)
arrange(flights,desc(arr_delay))
#select
select(flights,(year:day))
select(flights,-(year:day))
select(flights,month,everything())
select(flights, contains("TIME"))
select(flights, dep_time,dep_delay,arr_time,arr_delay)
select(flights, depTime = dep_time,dep_delay,arr_time,arr_delay)
#rename
#rename(select(flights, dep_time,dep_delay,arr_time,arr_delay),deptime=dep_time)
#mutate
flights_sml <- select(flights,year:day,ends_with("delay"),distance,air_time)
mutate(flights_sml,gain=arr_delay - dep_delay,speed = distance / air_time * 60)
transmute(flights_sml,gain=arr_delay - dep_delay,speed = distance / air_time * 60)
transmute(flights,gain=arr_delay - dep_delay,hours = air_time / 60,gain_per_hour = gain/hours)
#summarize
summarize(flights,delay = mean(dep_delay,na.rm = TRUE))
summarize(flights,delay = mean(dep_delay,na.rm = FALSE))
#group_by
by_day <- group_by(flights,year,month,day)
summarise(by_day,delay = mean(dep_delay,na.rm = TRUE))

#画板
ggplot(data = delay,mapping = aes(x = dist,y = delay)) +
  geom_point(aes(size = count),alpha = 1/3) +
  geom_smooth(se = FALSE)
ggplot(data = delay,mapping = aes(x = dist,y = delay)) +
  geom_point(aes(size = count),color="blue") +
  geom_smooth(se = FALSE)
ggplot(data = delay,mapping = aes(x = dist,y = delay)) +
  geom_point(aes(color = count)) +
  geom_smooth(se = FALSE)

#管道
by_dest <- group_by(flights,dest)
delay <- summarize(by_dest,count=n(),
                   dist = mean(distance,na.rm = TRUE),
                   delay = mean(arr_delay,na.rm = TRUE)
)
(delay <- filter(delay,count>20,dest != "HNL"))
# %>%
(delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance,na.rm = TRUE),
    delay = mean(arr_delay,na.rm = TRUE)
  ) %>%
  filter(count > 20,dest !="HNL"))
#
not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

(delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay)
  ))
ggplot(data = delays,mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10,color="red")
#每天最早最晚的航班出发时间
(flights %>%
  group_by(year,month,day) %>%
  summarise(
    min = min(dep_time,na.rm = TRUE),
    max = max(dep_time,na.rm = TRUE)
  ))
###July 4 -> DC -> delay
(flights %>%
  filter((month==7&day==4)|(month==12&day==25),(dest=="DCA"|dest=="IAD"|dest=="BWI")) %>%
  group_by(month,day,dest) %>%
  summarise(
    min = min(arr_delay,na.rm = TRUE),
    max = max(arr_delay,na.rm = TRUE),
    mean = mean(arr_delay,na.rm = TRUE),
    sd = sd(arr_delay,na.rm = TRUE),
    av =  mean(arr_time,na.rm = TRUE),
  ))
