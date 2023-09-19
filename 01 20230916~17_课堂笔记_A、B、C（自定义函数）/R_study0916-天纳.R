#####课后习题答案：https://jrnold.github.io/r4ds-exercise-solutions/data-visualisation.html
#####考试要求：考试可联网，带着平时代码考试

#计算器
1/200*30
#0.15
(59+73+2)/3
#44.6667
sin(pi/2)
#1
1+2

#向量（变量） 
# <- 变量赋值，快捷键 alt- 
# =也可以赋值(不推荐) 空格不敏感
# 变量名大小写敏感
x<-3*4 #x=12
x*2 #24
y <- 3
x
this_is_a_value <- 2
this_is_a_value <- 3

#函数调用
seq(1,10) 
x <- "hello word"
y <- seq(1,10)
x <- "hello
# > x <- "hello
# +  没打全引号可继续输入
y <- seq(1,10,length.out=5) # 1-10五等分
y # 再调用一次变量可查看变量的值
(y <- seq(1,11,length.out=5)) #最外面加括号直接输出结果

#向量
#向量的类型主要有两种。
#• 原子向量，有 6 种类型：逻辑型、整型、双精度型、字符型、复数型和原始型。整型和双精度型向量又统称为数值型向量。
#• 列表，有时又称为递归向量，因为列表中也可以包含其他列表或原子向量

typeof(letters) # "character"
typeof(1:10) #"integer"
z <- list("a","b",1:10)
length(z) #3

#逻辑型向量:只有 3 个可能的取值：FALSE、TRUE 和 NA
1:10%%3==0 #[1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
c(TRUE,FALSE,FALSE,NA) #combine 
x <- c(TRUE,FALSE,FALSE,NA)
x

#整型与双精度型向量统称为数值型向量。R 中默认数值是双精度型的。如果想要创建整型数值，可以在数字后面加一个 L
typeof(1) #double
typeof(1L) #integer
x <- sqrt(2)^2
x-2 #4.440892e-16
c(-1,0,1)/0 #-Inf  NaN  Inf
x <- c(TRUE,FALSE,FALSE,NA) #is.finite()、is.infinite() 和is.nan()
is.na(x)
x <- "This is a reasonably long string."
pryr::object_size(x) #查询向量占用的内存
y <- rep(x,1000)
pryr::object_size(y)

# y所占用的内存不是 x 的 1000 倍，因为 y 中的每个元素都只是指向一个字符串的指针。因为一个指针占 8 个字节，
# 所以 1000 个指针以及一个 136 字节的字符串所占用的内存空间是 8 * 1000 + 136 = 8.13KB

x <- sample(20,100,replace = TRUE) #均匀的随机抽样分布
y <- x>10 #y为逻辑型
#y <- sum(x>10) # 大于10的数有多少个
sum(y) #将逻辑型的y隐式转换为整型之后计算和
mean(y) # 大于10的数的比例是多少
sample(10)+100 #1-10抽样
runif(10)>0.5 #随机取10个[0,1]之间的数 遍历判断是否大于0.5

#random 随机 uniform均匀分布 1-10抽样 

#向量循环：R 会扩展较短的向量，使其与较长的向量一样长，要求整数倍
1:10+1:2 #2  4  4  6  6  8  8 10 10 12
tibble(x = 1:4, y = rep(1:2, each = 2)) #必须一样长才能用tibble
c(x=1,y=2,z=3)
set_names(1:3, c("a", "b", "c"))
x <- c("fdsc","dfd","fsd")
x[c(1,3)] # x[]取向量中指定位置的元素
x[c(-1, -3, -5)] #用负整数取子集时，会丢弃相应位置的元素
x <- c(0,1,3,NA,5,6,NA) 
x[!is.na(x)] 
!is.na(x)

#library导包
library(tidyverse) #先导入数据 下面才能用mpg
mpg#每加仑英里数
install.packages("mpg")
view(mpg) #view查看表

#ggplot拟合生成图
ggplot(data=mpg) + #引用mpg的数据源来作图 + 散点图
geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,color=drv))
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,color=class))#颜色
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,size=class)) #点大小
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,alpha=class))#透明度
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,shape=class)) #6种形状
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy,shape=class,color=class,size=class))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy),color="pink")
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,color="blue"))

#单变量分面 facet_wrap ~指定引用的属性，nrow指定图的行数
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=class))+facet_wrap(~class,nrow = 2)

#双变量分面 facet_grid
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=class))+facet_grid(drv~cyl)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=class))+facet_grid(.~class) #行数为1的单变量分面

#平滑曲线：曲线代表标准差standard error，灰影代表95%的置信区间confident interval
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy))
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy),se=FALSE) #去掉置信区间
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy,color=class))
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv))

#散点图结合曲线图
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy))+geom_point(mapping = aes(x=displ,y=hwy))
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy,color=drv))+geom_point(mapping = aes(x=displ,y=hwy,color=drv))
ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ,y=hwy,color=drv,linetype=class))+geom_point(mapping = aes(x=displ,y=hwy,color=drv))

#P46练习6
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+geom_smooth(mapping = aes(x=displ,y=hwy),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy))+geom_smooth(mapping = aes(x=displ,y=hwy,group=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy,color=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv),se=FALSE)
ggplot(data=mpg)+geom_point(mapping = aes(x=displ,y=hwy,color=drv))

#直方图 分布 
#pdf概率密度函数probability density function 频数count 比例prop
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut))
ggplot(data=diamonds)+stat_count(mapping=aes(x=cut)) #几何对象函数和统计变换函数可以互换使用
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,color=cut))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=cut))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity))#每个彩色矩形表示 cut 和 clarity 的一种组合

#比例直方图
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,y=..prop..,group=1))# group基数为1

#stat_summary() 函数为 x 的每个唯一值计算 y 值的摘要统计
ggplot(data=diamonds)+stat_summary(mapping=aes(x=cut,y=depth),fun.ymin = min,fun.ymax = max,fun.y=median)

#position = "dodge" 将每组中的条形依次并列放置，这样可以非常轻松地比较每个条形表示的具体数值
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity),position="dodge")

#position = "fill" 的效果与堆叠相似，但每组堆叠条形具有同样的高度，因此这种条形图可以非常轻松地比较各组间的比例
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity),position = "fill")

#position = "jitter" 为每个数据点添加一个很小的随机扰动，这样就可以将重叠的点分散开来,可以展示出所有的点
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity),position = "jitter")
ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy,color=class),position = "jitter")
ggplot(data = mpg)+geom_jitter(mapping = aes(x = displ, y = hwy,color=class))
#position_dodge、position_fill、position_identity、position_jitter、position_stack

###dplyr
install.packages("nycflights13") #下载包
library(nycflights13)
view(nycflights13::flights) #查看包里的一部分数据

#比较浮点数是否相等时，不能使用 ==，而应该使用 near()
sqrt(2) ^ 2 == 2
near(sqrt(2) ^ 2, 2)

#过滤filter
filter(flights,month==1,day==1) #且
(dec25 <- filter(flights,month==12,day==25))
filter(flights,month==11,month==12)
nov_dec <- filter(flights,month%in% c(11,12))#同上
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)#同上
filter(flights,dest=="IAH"|dest=="HOU")
filter(flights,arr_delay>120 &dep_delay<=0)
filter(flights,between(arr_delay,0,120))

#排序arrange desc降序 默认升序
arrange(flights,desc(arr_delay))
arrange(flights,year,month,day)

#按名称选取变量select
select(flights,year,month,day)
select(flights,year:day)#选择“year”和“day”之间的所有列（包括“year”和“day”）
select(flights,-(year:day))
select(flights,arr_time,everything()) #列排序
rename(flights,tail_num=tailnum)
select(flights,contains("TIME")) #contains()大小写不敏感
x <- c("dep_time","dep_delay","arr_time" ,"arr_delay")
select(flights,x)#可通过c组合字段名来查询

#NA缺失值默认最大，与任何数加减乘除运算结果都为NA
NA == NA

#mutate mutate() 总是将新列添加在数据集的最后
flights_sml <- select(flights,year:day,ends_with("delay"),distance,air_time) #将查询结果保存在变量中作为结果集
mutate(flights_sml,gain=arr_delay-dep_delay,speed=distance/air_time*60) #mutate应用结果集中的数据计算，并将计算后的结果字段添加到前面的结果集
#如果只想保留新变量，可以使用 transmute() 函数
transmute(flights,gain=arr_delay,hours = air_time / 60,gain_per_hour = gain/hours)

#lead() 和 lag() 函数可以返回一个序列的领先值和滞后值，可计算出序列的移动差值（如 x – lag(x)）或发现序列何时发生了变化（x != lag(x)）。常与group_by()一起用

#cdf 累计密度函数 cumulative density function

#mean均值 variance方差 standard deviation标准差 min max median

#summarize() summarise()摘要 
summarize(flights,delay=mean(dep_delay,na.rm=TRUE)) #忽略缺失值 NA remove,只要有NA参与运算结果就是NA
by_day <- group_by(flights,year,month,day) #先分组
summarise(by_day,delay=mean(dep_delay,na.rm=TRUE)) #再求均值

#研究每个目的地的距离和平均延误时间之间的关系
by_dest <- group_by(flights,dest) #按照到达地分组 105个到达地
delay <- summarise(by_dest,count=n(),dist=mean(distance,na.rm=TRUE),delay=mean(arr_delay,na.rm=TRUE)) #统计各到达地飞过多少次，及他们的平均距离和平均延误
delay <- filter(delay,count>20,dest!="HML") #过滤除HML以外的飞20次以上的到达地
ggplot(data=delay,mapping = aes(x=dist,y=delay))+geom_point(aes(size=count),alpha=1/3)+geom_smooth(se=FALSE)

#管道连接符 %>% Ctrl+Shift+M
(
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(ct=n(),dist=mean(distance,na.rm=TRUE),delay=mean(arr_delay,na.rm = TRUE)) %>% 
  filter(ct>20 | dest!="HNL") %>% 
  ggplot(data=delay,mapping = aes(x=dist,y=delay))+geom_point(aes(size=count),alpha=1/3)+geom_smooth(se=FALSE)
)

#处理NA，做临时表，提高代码复用性
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay),!is.na(arr_delay))

not_cancelled %>% 
  group_by(year,month,day) %>% 
  summarise(avg=mean(dep_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(delay=mean(arr_delay))

#频度多边形图:Frequency Polygon 
ggplot(data=delays,mapping = aes(x=delay))+geom_freqpoly(binwidth=10)() #宽度

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(avg_delay=mean(arr_delay,na.rm = TRUE),n=n()) %>%  
  select(tailnum,avg_delay)

# 每天最早最晚航班
flights %>% 
  filter(!is.na(dep_time)) %>% 
  group_by(year,month,day) %>% 
  summarise(first=min(dep_time),last=max(dep_time)) 

#ungroup 取消分组

# 7.4和12.25飞DCA的航班延误时间的max min avg sd 平均飞行时间
flights %>% 
  filter((month==7 & day==4 | month==12 & day==25 )& (dest %in% c("DCA","IAD","BWI"))) %>% 
  group_by(dest,dt=paste(month,"-",day)) %>% 
  summarise(min=min(arr_delay,na.rm=TRUE),max=max(arr_delay,na.rm=TRUE),avg_delay=mean(arr_delay,na.rm=TRUE),sd_delay=sd(arr_delay,na.rm=TRUE),avg_fly=mean(arr_time,na.rm=TRUE)) %>% 
  arrange(dt,dest)


############关联

#建表 ~字段名，创建字段并插入数据
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

#关联类型
x %>% inner_join(y,by="key") 
x %>% left_join(y,by="key") 
x %>% right_join(y,by="key") 
x %>% full_join(y,by="key") 
x %>% inner_join(y,by=NULL) #自然连接
x %>% semi_join(y,by="key") #取x中与y能关联上的行，仅展示x的列

#其他连接写法
inner_join(x, y) # merge(x, y)
left_join(x, y)  # merge(x, y, all.x = TRUE)
right_join(x, y) # merge(x, y, all.y = TRUE)
full_join(x, y)  # merge(x, y, all.x = TRUE, all.y = TRUE)
semi_join(x,y) 
anti_join #反连接 只筛选没关联上的行，列仍然是两个表的全部列

#多键连接 若不写连接条件则自动按照相同字段名连接
by = c("a" = "b")

#筛选连接
semi_join(x, y) #保留 x 表中与 y 表中的观测相匹配的所有观测。
anti_join(x, y) #丢弃 x 表中与 y 表中的观测相匹配的所有观测。

view(flights)
view(airlines)
view(airports)
view(planes)
view(weather)

weather %>%
  count(year, month, day, hour, origin) %>% #count自带group by 
  filter(n > 1)

flights %>% 
  count(year, month, day,tailnum,flight) %>% 
  filter(n>1)

flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(tailnum, sort = TRUE)

#代理键：如果一张表没有主键，有时就需要使用 mutate() 函数和 row_number() 函数为表加上一个主键?
# A$xx: $代表引用A表中的xx字段

#######自定义函数

#rnorm函数是R语言中用于生成正态分布随机数的函数
#range()函数用于获取作为参数传递给它的向量的最小值和最大值
#标准化数据：将数据的范围对应在[0,1]之间
rescale01 <- function(x){
  rng <- range(x,na.rm=TRUE)
  (x-rng[1])/rng[2]-rng[1]
}
rescale01(c(0,1,4,6,7,10))

#编写自定义函数，输入xyz,输出三者平方和
rescale02 <- function(x,y,z){
  x^2+y^2+z^2
  }
rescale02(1,2,3)

rescale02 <- function(x){
  x[1]^2+x[2]^2+x[3]^2
}
rescale02(c(1,2,3))
