# load package
library(tidyverse)

# 变量：一种可观测的数量，质量或者属性
# 值：变量在观测时的状态，变量值在每次测量之间可以发生改变
# 观测/个案：相同条件之下进行的一组观测
# 表格数据：一组值的集合，其中每个值都关联一个变量和一个观测

# 对分布的可视化，bar chat的横坐标为分类
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

diamonds %>%
  count(cut)


smaller <- diamonds %>%
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)


# 非叠加直方图
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1, size = 1)


# 统计
ggplot(diamonds) +
  geom_histogram(mapping= aes(x = y), binwidth = 0.5)

ggplot(diamonds) +
  geom_histogram(mapping= aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))


# 处理异常值
diamonds_NA <- diamonds %>%
  mutate(y = ifelse(y <3 | y>20, NA, y))

ggplot(data = diamonds_NA, mapping = aes(x = x, y = y)) +
  geom_point()

# 航班比较
nycflights13::flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %|% 100,
    
  )


# density
ggplot(
  data = diamonds,
  mapping = aes(x = price, y = ..density..)
) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)


# box plot
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()


# 进行重新排序
ggplot(data = mpg) +
  geom_boxplot(
    mapping = 
    x = reorder(class, hwy, FUN = median),
    y = hwy
  ) +
  coord_flip()


# 使用title
diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

# 两个连续变量
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_point(
    mapping = aes(x = carat, y = price),
    alpha = 1 / 100
  )


# geom_bin2d 和 geom_hex()
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))


ggplot(data = smaller, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))


ggplot(data = faithful) +
  geom_point(mapping = aes(x = eruptions, y = waiting))
