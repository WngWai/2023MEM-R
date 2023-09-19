####################PartA1#############################
#############2.1 代码基础
library(tidyverse)
library(nycflights13)
library(tibble)
1/200*30
(59+73+2)/3
sin(pi / 2)

###############2.2创建对象
(x <- 3*4+1)
this_is_a_really_long_name <- 2.5
this_is_a_really_long_name

##############2.3函数调用
(x <- seq(1,10))
x <- "weiqw"
print(x)
(y <- seq(1,10,length.out=5.01))

#####################PartA2#############################
##############15.2向量基础
typeof(letters)
typeof(1:10)
length(1:10)

##############15.3逻辑型
1:10%%3==0
m <- c(TRUE,TRUE,FALSE,NA)
x <- sqrt(2)^2
x
is.na(m)
x3 <- "weiqw"
x3 <- rep(x3)
pryr::object_size(x3)
?sample
(x4 <- sample(20,10000000,replace=TRUE))
y <- x4>10
y
######求和
sum(y)
######求平均
mean(y)

#################15.4.3tibble用法 
tibble(x=1:4,y=1:2)
tibble(x=1:4,y=rep(1:2,2))
tibble(x=1:4,y=rep(1:2,each=2))
################15.4.4向量命名
c(x=1:4,y=1:2,z=1:4)
C <- c(x=1:4)
length(C)
x <- c("one","two","three","four","five")
x[c(3,2,3)]
x[c(-1)]

################15.4.5向量取子集
x <- c(10,3,NA,5,8,1,NA)
is.na(x)
x[!is.na(x)]

####################PartB1#############################
################1.2.1 散点图
view(mpg)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="blue")
################1.5分面展示(单变量与双变量)
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy))+
  facet_wrap(~class,nrow=2)
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy))+
  facet_grid(drv ~ cyl)
###############1.6几何对象
##平滑曲线 linetype线条类型
ggplot(data = mpg,mapping=aes(x=displ,y=hwy,linetype=drv))+
  geom_smooth()+
  geom_point(mapping=aes(color=class))
##问题6
#1
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth(se=FALSE)
#2
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth(mapping=aes(lines=drv))
#3
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping=aes(color=drv,lines=drv))
#4
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth()
#5
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping=aes(lines=drv,linetype=drv))
#6
ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=drv))
####################1.7统计变换
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut))
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,y=..prop..,group=1))
ggplot(data=diamonds)+
  stat_summary(
    mapping=aes(x=cut,y=depth),
    fun.ymax = max,
    fun.ymin=min,
    fun.y=median
  )
###############1.8位置调整
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,color=cut))
###颜色填充
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,fill=cut))
###多条状图,position三个值dodge，fill,stack
ggplot(data=diamonds)+
  geom_bar(
    mapping = aes(x=cut,fill=clarity),
    position="dodge"
    )
###添加随机扰动，解决重复数据显示问题
ggplot(data=mpg)+
  geom_point(
    mapping=aes(x=displ,y=hwy),
    position="jitter"
  )
###################partB2第三章#############################
#########
library(dplyr)
library(nycflights13)
##筛选
filter(flights,month==1,day==1)
##3.2.4练习
#b
filter(flights,dest %in% c("IAH","HOU"))
filter(flights,between(arr_delay,-1,3)
#E
select(filter(flights,arr_delay>120,dep_delay<=0),year,month,day,arr_delay,dep_delay)
############3.3排序
arrange(flights,year,month,day)
####降序
arrange(flights,desc(arr_delay))
####筛选子集
select(flights,-(year:day))
select(rename(flights,tail_n=tailnum),year,tail_n)
#####添加新变量
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
)
mutate(flights_sml,gain=arr_delay-dep_delay,speed=distance/air_time*60)
transmute(flights,gain=arr_delay-dep_delay,hours=air_time/60,gain_per_hour=gain/hours,)
####偏移函数
#lag(),将向量序列往后偏移一位，最前面加上NA
#lead(),将向量序列往前偏移一位，最后面加上NA
#累加
cumsum(x)
############3.6summarize,分组摘要
summarize(flights,delay=mean(dep_delay,na.rm=TRUE))
(by_day <- group_by(flights,year,month,day))
summarize(by_day,delay=mean(dep_delay,na.rm=TRUE))
###########3.6.1管道操作
by_dest <- group_by(flights,dest)
delay <- summarize(by_dest,count=n(),dis=mean(distance,na.rm=TRUE),delay=mean(arr_delay,na.rm=TRUE))
delay <- filter(delay,count>20,dest!="HNL")
ggplot(data=delay,mapping = aes(x=dis,y=delay))+
  geom_point(aes(size=count),alpha=1/3)+
  geom_smooth(se = FALSE)
delays <- flights %>%
  group_by(dest)%>%
  summarize(
    count=n(),
    dist=mean(distance,na.rm=TRUE),
    delay=mean(arr_delay,na.rm=TRUE)
  )%>%
  filter(count>20,dest!="HNL")
##############3.6.4摘要函数
not_cancelled <- flights %>%
  filter(!is.na(dep_delay),!is.na(arr_delay))
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay= mean(arr_delay)
  )

ggplot(data=delays,mapping=aes(x=delay))+
  geom_freqpoly(binwith = 10)

###标准差函数
sd()
############每天最早，最晚
library(nycflights13)
library(tidyverse)
flights %>%
  group_by(year,month,day) %>%
  summarise(mindep_time=min(dep_time,na.rm=TRUE),maxdep_time=max(dep_time,na.rm=TRUE))
#######取消分组
ungroup()
#######3.6练习
(flights %>%
  filter((month==7&&day==4) | (month==12&&day==25),dest %in% c("DCA","IAD","BWI")) %>%
  group_by(month,day,dest) %>%
  summarise(
    min=min(arr_delay,na.rm=TRUE),
    max=max(arr_delay,na.rm=TRUE),
    mean=mean(arr_delay,na.rm=TRUE),
    sd=sd(arr_delay,na.rm=TRUE),
    avg_air_time=mean(air_time,na.rm=TRUE)
  ))
###############PartB3#######################
#######9.1 数据连接
library(tidyverse)
library(nycflights13)
airlines
airports
planes
weather
x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  2,"x3",
  1,"x4"
)
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2",
  3,"y3"
)
##############内链接 by参数指代连接健
inner_join(x,y,by = "key")
#############外连接
####左连接，以x为主
left_join(x,y,y="key")
####右连接，以y为主
right_join(x,y,by="key")
####全连接，所有出现的健都需要
full_join(x,y,by="key")
flights2 <- flights %>%
  select(year:day,hour,origin,dest,tailnum,carrier)
flights2 %>%
  select(-origin,-dest) %>%
  mutate(name = airlines$name[match(carrier,airlines$carrier)])

flights2 %>%
  left_join(weather)
flights2 %>%
  left_join(planes,by = "tailnum")

###########不同变量名的链接by=c(x.a=y.b)
flights2 %>%
  left_join(airports,by = c("dest"="faa"))
flights2 %>%
  left_join(airports,by = c("origin"="faa"))
##########筛选链接
#semi_join（x,y）半链接，保留x表中y匹配的观测值
airports %>%
  semi_join(flights,c("faa"="dest")) %>%
  ggplot(aes(lon,lat))+
  borders("state")+
  geom_point()+
  coord_quickmap()
#anti_join(x,y)反链接，丢弃x表中与y匹配的观测
flights %>%
  anti_join(planes,by="tailnum") %>%
  count(tailnum,sort=TRUE)
##########9.7集合操作
df1 <- tribble(
  ~x,~y,
  1,1,
  2,1
)
df2 <- tribble(
 ~x,~y,
 1,1,
 1,2
)
####返回即在x又在y的观测
intersect(df1,df2)
####返回x或y中唯一的观测
union(df1,df2)
###############PartC1####################
############14章函数,函数分行不需要逗号隔开
rscale01 <- function(x){
  rng <- range(x,na.rm = TRUE)
  x <- (x-rng[1])/(rng[2]-rng[1])
}
m <- c(1,3,4,10)
(m<-rscale01(m))
####课堂练习 
##计算三个数的平方和
squared_sum <- function(x,y,z){
  sum <- x^2+y^2+z^2
  return(sum)
}
(sum <- squared_sum(1,2,3))
