# 代码基础
# 将R语言当成计算器来使用
1 + 2
1 / 2 + 12
(1.5 ** 12) + 20
10 ** 2
10 ** 1.5
sin(10)
sin(pi / 1.3)

# 创建新的对象
x <- 3 * 4
x

# 赋值语句语法：object_name <- value
# 一个便捷的方法 alt + - 从而直接得到 <- ， <- 

# 对象名称必须使用字母开头，可以包含字母，数字，_，和.
# 推荐使用的语法 snake_game，单词全小写，并且使用_来进行隔开
this_is_a_long_name <- "Hello World"
this_is_a_long_name

# 调用函数
function_name(arg1 = val1, arg2 = val2, ...)
# 使用seq()函数
seq(1, 10)
seq(1, 30, by = 3)
seq(1, 10, length.out = 4)
seq(1, 10, length.out = 7)
# 右上角方框有环境变量

# 修改代码
library(tidyverse)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)

filter(diamonds, carat > 3)

# NA
x <- NA
x == NA  # 未知，所以是否相等也是未知的
is.na(x)  # 用is.na()函数来判断是否是NA
