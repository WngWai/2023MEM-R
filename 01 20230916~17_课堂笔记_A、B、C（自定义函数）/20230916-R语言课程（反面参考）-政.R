################### 20230916 ##################
# 第一部分，基础
# 第2章，基础
## 四则运算
 1/200 * 30
(59+ 73 + 2) / 3
sin(pi / 2)

## 创建对象，进行赋值
x <- 3 * 4
x
x <- 14
x

this_is_a_really_long_name <-  10
this_is_really_long_name # Error: object 'this_is_really_long_name' not found

## 函数调用
seq(1, 10)
x <- seq(1, 10)
x
x <- "hello world"
x
x <- "你好，世界！"
x

(y <- seq(1, 10, length.out = 5))
y <- seq(1, 10, by = 2)
y

# 第15章，向量
typeof(letters)
typeof(1:10)
typeof(1)

x <- list("a", "b", 1:10) # 列表可以包含多种数据类型
length(x)

## 逻辑型
1:10 %% 3 == 0



x <- c(TRUE, TRUE, FALSE, NA)
is.na(x)

## 字符型
x <- "第一堂课"
y <- rep(x, 1000)
pryr::object_size(y)

## 强制转化
x <- sample(20, 10000, replace = TRUE)
y <- x > 10
sum(y) # y中TRUE和FALSE在存储中是1和0的数值形式
mean(y) # 所以计算均值时才为0~1中的数值

## 标量与循环规则
library()
tibble(x = 1:4, y = 1:2)

## 向量命名
c(x = 1:3, y = 4:6, z = 7:9)
set_names(1:3, c("a", "b", "c"))

## 向量取子集
x <-c("a", "b", "c", "d", "e")
x[c(3, 2, 5)]

## 使用逻辑向量取子集
x <-  c(10, 3, NA, 5, 8, 1, NA)
x[!is.na(x)] # 筛选非空值

# 第8章，数据的导入
library(tidyverse)

# 第二部分
# 第1章，可视化
library(ggplot2)
# mpg数据集
ggplot2::mpg
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot2::mpg
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = class)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = drv)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), size = class)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), alpha = class)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), shape = class)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~ cyl)

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE)

ggplot(data=mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, grop = drv), se=FALSE) # 3改，添加了color=drv

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) 


## diamonds数据集
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth), fun.ymin = min, fun.ymax = max, fun.y = median)

### 上色
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

### 映射中上色
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) +
  geom_bar(
    mapping =  aes(x = cut, fill =clarity),
    position = "dodge"
  ) # 对x轴cut进行分组？？？

ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = "jitter"
  )

# 第3章,dplyr数据转换
install.packages("nycflights13")
library("nycflights13")
library("tidyverse")
nycflights13::flights

## filter筛选
filter(flights, month == 1, day == 1)

filter(flights, month == 11 | month == 12)
filter(flights, month %in% c(11, 12))

filter(flights, dest %in% c("IAH", "HOU"))
filter(flights, arr_delay > 2 & arr_time == sched_arr_time) # 还要研究下


## arrange排序
?arrange(flights, desc(arr_delay)) # 降序
print(arrange(flights, year, month, day), n = 10)

## select选择
 # filter有条件的筛选
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))
rename(flights, tail_num = tailnum) # 新名字在前，将旧名赋值给新值
select(flights, time_hour, air_time, everything())

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(c("year", "day")))

## mutate添加新变量
# sml = simulate
flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
transmute(flights, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / hours)

## summarize统计
summarize(flights, delay = mean(dep_delay, na.rm = TRUE))
summarize(flights, delay = mean(dep_delay))

by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest, count = n(), 
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
                  )
delay
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

### 管道 %>%
delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")
delays

### 计数
not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay)
  )
ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)

### 每天最早和最晚的航班何时出发？？？
flight_day <- flights %>%
  group_by(year, minth, day) %>%
  arrange("dep_time") %>%
  summarize( first_time = max(dep_time), last_time = min(dep_time))
flight_day


### 课中习题
flights %>%
  filter(month == 7 & day == 4 & dest %in% c("DCA", "IAD", "BWI")) %>%
  summarize( min_time = min(arr_delay, na.rm = TRUE), 
             max_time = max(arr_delay, na.rm = TRUE), 
             mean_time = mean(arr_delay, na.rm = TRUE),
             sd_time = sd(arr_delay, na.rm = TRUE),
             mean_air_time = mean(air_time, na.rm = TRUE)
             )

flights %>%
  filter(month == 12 & day == 25 & dest %in% c("DCA", "IAD", "BWI")) %>%
  summarize( min_time = min(arr_delay, na.rm = TRUE), 
             max_time = max(arr_delay, na.rm = TRUE), 
             mean_time = mean(arr_delay, na.rm = TRUE),
             sd_time = sd(arr_delay, na.rm = TRUE),
             mean_air_time = mean(air_time, na.rm = TRUE)
  )

# 第三部分
# 第9章，用dplyr处理处理关系数据
x <-tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
x
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)
y

left_join(x, y, by="key")

flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)

flights2 %>%
  left_join(weather)

flights2 %>%
  left_join(planes, by = "tailnum")

flights2 %>%
  select(-origin, -dest) %>%
  left_join(airlines, by="carrier")

flights2 %>%
  left_join(airports, c("dest" = "faa"))
flights2 %>%
  left_join(airports, c("origin" = "faa"))


top_dest <- flights %>%
  count(dest, sort=TRUE) %>%
  head(10)
top_dest

flights %>%
  filter(dest %in% top_dest$dest)

### 反连接
flights %>%
  anti_join(planes, by="tailnum") %>%
  count(tailnum, sort=TRUE)

# 第三部分
# 第14章，函数
### 要会自己编写函数
rescale01 <- function(x){
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))

rescale01 <- function(x){
  x[1]^2 + x[2]^2 + x[3]^2 
}

rescale01(c(0, 5, 10))



