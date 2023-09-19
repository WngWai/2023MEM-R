url <- "https://mimno.infosci.cornell.edu/b/articles/ml-learn/"
download.file(url,"C:/Users/13522/Desktop/machine learning.html")

rm(list = ls())

library(rvest)
data <- rbind()
for (i in 1:50) {
url <-paste0("http://www.letpub.com.cn/index.php?page=grant&name=&person=&no=&company=&startTime=2010&endTime=2019&money1=&money2=&subcategory=&addcomment_s1=G&addcomment_s2=G02&addcomment_s3=G0206&addcomment_s4=&currentpage=",i)
web <- read_html(x = url)
x <- web %>% html_nodes(css = ".table_yjfx td+ td , tr:nth-child(48) td , tr:nth-child(43) td , tr:nth-child(38) td , tr:nth-child(33) td , tr:nth-child(28) td , tr:nth-child(23) td , tr:nth-child(18) td , tr:nth-child(13) td , tr:nth-child(8) td , .table_yjfx tr:nth-child(3) td") %>% html_text() %>% unlist()
data1 <- matrix(x,ncol = 11,byrow = T)
data <- rbind(data,data1)
}
write.csv(data,file = "C:/Users/13522/Desktop/jijin.csv")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ,y = hwy,colour = class)) +
  facet_wrap(~class,ncol = 2)

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ,y = hwy,linetype = drv)) +
  geom_point(mapping = aes(x = displ,y = hwy,colour = class))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ,y = hwy,color = drv),show.legend = FALSE) 

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ,y = hwy))+
  geom_point(mapping = aes(x = displ,y = hwy))

ggplot(data = mpg,mapping = aes(x = displ,y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"),se = FALSE)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy,group = drv,linetype = drv),se = FALSE)

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~a,     ~b,
  "bar_1",20,
  "bar_2",30,
  "bar_3",40
)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = clarity))

ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth),
  fun.ymin = min,
  fun.ymax = max,
  fun.y = median
)

ggplot(data = demo) +
  geom_col(mapping = aes(x = a, y = b),stat = "identity")

ggplot(data = diamonds, mapping = aes(x= cut, fill = clarity)) +
  geom_bar(position = "stack")

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

