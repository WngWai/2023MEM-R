# 创建脚本方法一：File按钮，New File，R Script

# 创建脚本方法二：CTRL + SHIFT + N


library(dplyr)
library(tidyverse)

library(nycflights13)

flights

view(flights)  # 可以查看完整的数据集

not_cancelled <- flights %>%  # 如果被cancel了，则值为NA，所以这里考虑所有没有被cancelled的情况
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

# 不要在分享给别人的script中包含 install.packages()函数 或者 setwd()函数

# RStudio会提供一些自动诊断的提示
3 == NA  # 这里会有红色波浪线

