# 需要一个数据集
# install.packages("nycflights13")  # 这个数据集包括了2013年从纽约市出发的所有336776次航班
library(nycflights13)  # 导入这个数据集
library(tidyverse)  # 使用tidyverse包

?flights  # 查看数据集的信息

flights  # tibble是一种数据框，更加方便在tidyverse中进行使用
# 336,776 x 19 336776行，19列
# int 整数类型，dbl 双精度浮点数，char 字符向量或者字符串，dttm为日期时间（日期+时间）

# 5个dplyr的核心函数
# 1.按照值进行栓选 filter()
# 2.对行进行重新排序 arrange()
# 3.按名称选取变量 select()
# 4.使用现有变量的函数创建新变量 mutate()
# 5.将多个值总结为一个摘要计量 summarize()

# 上述的5个函数可以使用group_by()函数联合起来使用

# 使用filter()进行筛选
filter(flights, month == 1, day == 1)  # 所有一月一日的数据都被选择了出来

# 我们可以保存上面的代码返回的结果
flight_month_day <- filter(flights, month == 1, day == 1)
flight_month_day

# 某一个日期
Dec25 <- filter(flights, month == 12, day == 25)  
Dec25  # 可以发现所有月份为12，并且日期为25的数据都被筛选了出来

# 赋值的同时进行打印，在整个语句外面加一个括号
(Dec25 <- filter(flights, month == 12, day == 25))


# 使用arrange来进行排序
arrange(flights, year, month, day)  # 对flights数据集进行排序，先按照year来排序，然后再按照month排序，最后按照day来进行排序

# desc()来进行逆排序
arrange(flights, desc(arr_delay))  # 按照arra_delay来进行排序，逆排序

# 让缺失值出现在最开始
arrange(flights, desc(is.na(arr_delay)))  # arr-delay为na的排在最前面


# mutate()用来添加新的变量
flights_sml <- select(flights,  # data set为flights
                      year:day, # year到day之间的列，包括year和day
                      ends_with("delay"),  # 以delay为结尾的名字
                      distance,
                      air_time
                      ) 

flights_sml  # 年，月，日，起飞延迟，到达延迟，距离，时间

# 开始添加新列
mutate(flights_sml,
       gain = arr_delay - dep_delay,  #  到达延迟和起飞延迟
       speed = distance / air_time * 60  # 计算速度
       )  # 运行可以发现多出了 gain和speed

flights_sml  # 可以发现，原先的变量没有发生改变。

# 如果只要保留新变量，可以使用transmute()函数：
transmute(flights_sml,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours)

flights_sml <- mutate(flights_sml,
                      gain = arr_delay - dep_delay,
                      speed = distance / air_time * 60)

flights_sml


# 模运算符
10 %/% 3  # 取整
10 %% 3 # 取余

# group_by
by_day <- group_by(flights, year, month, day)
by_day
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

# 研究：目的地的距离 和 平均延误时间 之间的关系
by_dest <- group_by(flights, dest)  # 按照目的地来进行分组
delay <- summarize(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)

delay <- filter(delay, count > 20, dest != "HNL")
delay
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1 / 3) +
  geom_smooth(se = FALSE)


view(flights)


# 使用 pipe line
delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")


ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1 / 3) +
  geom_smooth(se = FALSE)

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

view(not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean(mean(dep_delay))))

# group_by获得数据框
test_df <- data.frame(
  group = c("A", "A", "B", "B"),
  value = c(1, 2, 3, 4)
)

# 按照group来进行分组
test_df %>%
  group_by(group)  %>%
  summarize(mean = mean(value))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))


# 查看具有最常平均延误时间的飞机
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay)
  )

delays

ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)


# 散点图
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1 / 10)  # 可以发现当航班数量非常少的时候，延误的波动非常的大

# 可以去掉那些航班非常少的情况，因为样本数量少不具有统计意义
delays %>%
  filter(n > 30) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1 / 10)

# median()函数
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    avg_delay1 <- mean(arr_delay),
    avg_delay2 <- mean(arr_delay[arr_delay > 0])
  )

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )
