#wmj R语言 初体验 -2023/9/16

#A模块：2、15、18（NA)
#工作流：基础
#a. 将 R 当作计算器来使用
1 / 200 * 30  #[1] 0.15
(59 + 73 + 2) / 3   #[1] 44.66667
sin(pi / 2)  #[1] 1
#b. 可以使用 <- 来创建新对象
x <- 3 * 4
#c. 函数调用
seq(1, 10)  # [1]  1  2  3  4  5  6  7  8  9 10
#如果进行了一次赋值，R 不会显示出赋值结果,需要检查
y <- seq(1, 10, length.out = 5)
y
#[1]  1.00  3.25  5.50  7.75 10.00
#这种常用的操作可以简化一下，用括号将赋值语句括起来。
(y <- seq(1, 10, length.out = 5))
#[1]  1.00  3.25  5.50  7.75 10.00

#向量基础
#原子向量，其共有 6 种类型：逻辑型、整型、双精度型、字符型、复数型和原始型。
#整型和双精度型向量又统称为数值型向量。
#a. 每个向量都有两个关键属性。
#类型。你可以使用 typeof() 函数来确定向量的类型：
typeof(letters)  #[1] "character"
#长度。你可以使用 length() 函数来确定向量的长度：
x <- list("a", "b", 1:10)
length(x)
#[1] 3
#b. 4 种最重要的原子向量类型是逻辑型、整型、双精度型和字符型。
#1. 逻辑型向量.只有 3 个可能的取值：FALSE、TRUE 和 NA。
1:10 %% 3 == 0 #[1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
#%%是求余；==是判断
#还可以通过 c() 函数来手工创建逻辑向量：
c(TRUE, TRUE, FALSE, NA)  #[1]  TRUE  TRUE FALSE    NA
#2. 数值型向量。整型与双精度型向量统称为数值型向量。R 中默认数值是双精度型的。
typeof(1)  #[1] "double"  #双精度
typeof(1L)  #[1] "integer"  #如果想要创建整型数值，可以在数字后面加一个 L
1.5L  #[1] 1.5
x <- sqrt(2) ^ 2
x
#[1] 2  #双精度型是近似值。
x - 2
#3. 字符型向量。
#其每个元素都是一个字符串，而字符串可以包含任意数量的数据。
#4. 缺失值 NA
#5. 强制转换(显式强制转换/隐式强制转换)
#当调用 as.logical()、as.integer()、as.double() 或 as.character()这样的函数进行转换时，使用的就是显式强制转换。
x <- sample(20, 100, replace = TRUE)
y <- x > 10
sum(y) # 大于10的数有多少个？
#[1] 59
mean(y) # 大于10的数的比例是多少？
#[1] 0.59
#6. 标量与循环规则
sample(10) + 100  # [1] 102 106 103 104 101 107 110 109 105 108
runif(10) > 0.5  # [1]  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
1:10 + 1:2  #[1]  2  4  4  6  6  8  8 10 10 12
1:10 + 1:3  #[1]  2  4  6  5  7  9  8 10 12 11
#7. 向量取子集
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]
#[1] "three" "two"   "five" 
x <- c(10, 3, NA, 5, 8, 1, NA) 
x[!is.na(x)]  # x中的所有非缺失值
#[1] 10  3  5  8  1

#B模块：1、3、9
#使用readr进行数据导入
#a.安装
install.packages("tidyverse")
library(tidyverse)
view(mpg)
#b. 创建ggplot图形，将 displ 放在 x 轴，hwy 放在 y 轴：
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy))
#c. 可以向二维散点图中添加第三个变量，比如 class，方式是将它映射为图形属性。
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy, color = class)) #增加颜色 
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy, size = class)) #增加大小
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy, alpha = class)) #增加透明度
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy, shape = class)) #增加形状
#d. 手动为几何对象设置图形属性
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy), color = "pink") 
#e. 是将图分割成多个分面，即可以显示数据子集的子图
#要想通过单个变量对图进行分面，可以使用函数 facet_wrap()。
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy)) +facet_wrap(~ class, nrow = 2)
#f. 要想通过两个变量对图进行分面，需要在绘图命令中加入函数 facet_grid()。
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy)) +facet_grid(drv ~ cyl)
#g. 几何对象
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy))  #二维散点图
ggplot(data = mpg) +geom_smooth(mapping = aes(x = displ, y = hwy)) #曲线图
ggplot(data = mpg) +geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) 
#h. 按照不同的线型绘制出不同的曲线，每条曲线对应映射到线型的变量的一个唯一值：
ggplot(data = mpg) +geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) 
#i. 要想在同一张图中显示多个几何对象，可以向 ggplot() 函数中添加多个几何对象函数
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy)) +geom_smooth(mapping = aes(x = displ, y = hwy))
#j. 将一组映射传递给 ggplot() 函数
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +geom_point() +geom_smooth()
#k. 在不同的图层中显示不同的图形属性：
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +geom_point(mapping = aes(color = class)) +geom_smooth()
#练习题 
#se = FALSE表示去掉置信区间
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+geom_smooth(mapping = aes(x=displ,y=hwy),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+geom_smooth(mapping = aes(x=displ,y=hwy,group=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy,color=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))
#l.统计变换
#用 geom_bar() 函数就可以绘制的基本条形图
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut))
#几何对象函数和统计变换函数可以互换使用
ggplot(data = diamonds) +stat_count(mapping = aes(x = cut))
#覆盖从统计变换生成的变量到图形属性的默认映射
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
#强调统计变换，使用 stat_summary() 函数将人们的注意力吸引到你计算出的那些摘要统计量上
ggplot(data = diamonds) +stat_summary(mapping = aes(x = cut, y = depth), fun.ymin = min,fun.ymax = max,fun.y = median)
#位置调整：可以使用 color 或者 fill（这个更有用）图形属性来为条形图上色
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, fill = cut))
#如果将 fill 图形属性映射到另一个变量（如 clarity），那么条形会自动分块堆叠起来。
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, fill = clarity))
#position = "dodge" 将每组中的条形依次并列放置
ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut, fill = clarity),position = "dodge")
#将位置调整方式设为“抖动”，可以避免这种网格化排列
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy),position = "jitter")

#使用dplyr进行数据转换
#a.安装
install.packages("nycflights13")
library(nycflights13)
View(nycflights13::flights)
#b.基础
#1.按值筛选观测（filter()）。
filter(flights, month == 1, day == 1)
#找出 11 月或 12 月出发的所有航班：
filter(flights, month == 11 | month == 12)
#x %in% y
nov_dec <- filter(flights, month %in% c(11, 12))
#找出延误时间（到达或出发）不多于 2 小时的航班
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)
#练习：飞往休斯顿（IAH 机场或 HOU 机场）的航班。
filter(flights, dest == "IAH" | dest == "HOU")
#到达时间延误超过 2 小时，但出发时间没有延误的航班。
filter(flights, arr_delay > 120, dep_delay <= 0)
#2.对行进行重新排序（arrange()）。
#排序
arrange(flights, year, month, day)
#使用 desc() 可以按列进行降序排序
arrange(flights, desc(arr_delay))
#3.按名称选取变量（select()）。
# 按名称选择列
select(flights, year, month, day)
#rename() 函数来重命名变量
rename(flights, tail_num= tailnum)
#将 select() 函数和 everything() 辅助函数结合起来,将几个变量移到数据框开头时
select(flights, time_hour,air_time,everything())
#4.使用现有变量的函数创建新变量（mutate()）。
#使用mutate()添加新变量
flights_sml <- select(flights,year:day,ends_with("delay"),distance,air_time)
mutate(flights_sml,gain = arr_delay - dep_delay,speed = distance / air_time *60)
#如果只想保留新变量，可以使用 transmute() 函数
transmute(flights,gain = arr_delay - dep_delay,hours = air_time / 60,gain_per_hour = gain / hours)
#偏移函数,lead() 和 lag() 函数可以返回一个序列的领先值和滞后值。
(x <- 1:10)
#[1]  1  2  3  4  5  6  7  8  9 10
lag(x)
#[1] NA  1  2  3  4  5  6  7  8  9
lead(x)
#[1]  2  3  4  5  6  7  8  9 10 NA
#累加和滚动聚合
# 提供了计算累加和、累加积、累加最小值和累加最大值的函数：cumsum()、cumprod()、commin() 和 cummax()；dplyr 还提供了 cummean() 函数以计算累加均值。
x
#[1]  1  2  3  4  5  6  7  8  9 10
cumsum(x)
#[1]  1  3  6 10 15 21 28 36 45 55
cummean(x)
#[1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5
#5.将多个值总结为一个摘要统计量（summarize()）。
summarise(flights, delay = mean(dep_delay, na.rm = TRUE)) #na.rm = TRUE表示忽略缺失值
summarise(flights, delay = mean(dep_delay)) #若不加na.rm = TRUE，则结果显示NA
#group_by() 可以将分析单位从整个数据集更改为单个分组
by_day <- group_by(flights, year, month, day) 
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))
#使用管道组合多种操作(pipe)
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,count = n(),dist = mean(distance, na.rm = TRUE),delay = mean(arr_delay,na.rm = TRUE))
delay
delay <- filter(delay, count > 20, dest != "HNL")
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +geom_point(aes(size = count), alpha = 1/3) +geom_smooth(se = FALSE)
#使用管道，%>%,在阅读代码时，%>%最好读作“然后.语言：分组，然后摘要统计，然后进行筛选。ctrl+shift+m
delays <- flights %>% group_by(dest) %>% summarize(count = n(),dist = mean(distance, na.rm = TRUE),delay = mean(arr_delay, na.rm = TRUE)) %>%filter(count > 20, dest != "HNL")
delay
#缺失值表示取消的航班
not_cancelled <- flights %>% filter(!is.na(dep_delay),!is.na(arr_delay))
not_cancelled %>% 
group_by(year,month,day) %>% 
summarize(mean = mean(dep_delay))
delays <- not_cancelled %>%
group_by(tailnum) %>%
summarize(delay = mean(arr_delay))
ggplot(data = delays, mapping = aes(x = delay)) +geom_freqpoly(binwidth = 10)
# 每天最早和最晚的航班何时出发？
not_cancelled  %>% group_by(year, month, day) %>% summarize(first=min(dep_time),last=max(dep_time))
#数据轮廓：sum、mean(均值)、variance(方差)、standard deviation(标准差)、min、max、medium
#每年7月4日华盛顿机场延误时间的min、max、mean、sd、平均飞行时间
#每年12月25日华盛顿机场延误时间的min、max、mean、sd、平均飞行时间
flights %>%  filter((month == "7" & day == "4")|(month == "12" & day == "25"),dest == "DCA"|dest == "IAD"|dest =="BWI") %>% 
group_by(month,day,dest) %>% 
summarize(min=min(arr_delay,na.rm=TRUE),max=max(arr_delay,na.rm=TRUE),mean=mean(arr_delay,na.rm=TRUE),sd=sd(arr_delay,na.rm=TRUE),av=mean(arr_time,na.rm=TRUE))
