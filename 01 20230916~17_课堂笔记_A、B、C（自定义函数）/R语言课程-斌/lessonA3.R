library(tidyverse)
view(mpg)
#这个代码段使用ggplot2包来创建一个散点图。数据集为mpg，其中包含汽车的燃油经济性数据。
#使用geom_point()函数来绘制散点，其中x轴为displ（排量），y轴为hwy（公路英里/加仑）。
#aes()函数用来将变量映射到图形属性，指定x和y变量的映射关系
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy,color = manufacturer))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy,size = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy,alpha = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy,shape = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy),color = "blue")
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy,color = "blue"))
#这段代码使用 ggplot2 包中的 ggplot() 函数创建了一个空白的绘图对象，
#然后使用 geom_point() 函数添加了散点图层。geom_point() 中的 mapping 参数指定了散点图的x轴为displ变量，y轴为hwy变量，即排量和公路里程。color 参数设置所有散点的颜色为蓝色。
#接下来，facet_wrap() 函数用于拆分数据并在一个绘图中创建多个子图，~class 表示按照 class 变量的不同取值来创建子图。nrow=2 参数指定每行两个子图。
#因此，该代码的功能是根据 mpg 数据集中的 class 变量的不同取值，创建一个包含多个散点图子图的图形，其中每个子图的x轴为排量（displ），y轴为公路里程（hwy）。每个子图的散点颜色都是蓝色。
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy),color = "blue") + facet_wrap(~class,nrow = 2)
#这段代码使用ggplot2绘制了一个散点图，并通过facet_grid函数将图形分成多个面板展示。
#data = mpg：指定要使用的数据集为mpg，即数据集中的汽车燃油经济性相关的变量。
#geom_point：指定使用散点图作为几何对象来绘制图形。
#mapping = aes(x = displ, y = hwy)：指定数据集中的displ变量作为x轴，hwy变量作为y轴的取值。
#color = "blue"：将散点的颜色设定为蓝色。
#此外，facet_grid(drv ~ cyl)函数将图形按照drv和cyl两个变量进行分面展示。drv变量决定分面的行，cyl变量决定分面的列。这样，通过面板的方式，可以同时展示不同驱动方式和汽缸数量下的数据分布情况。
ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y = hwy),color = "blue") + facet_grid(drv~cyl)
###
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ,y = hwy),color = "orange") + facet_grid(drv~cyl)
#
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ,y = hwy,linetype = drv),color = "orange") + facet_grid(drv~cyl)
#
ggplot(data = mpg,mapping = aes(x = displ,y = hwy)) + geom_point(mapping = aes(color = class))   + geom_smooth()
#
ggplot(data = mpg,mapping = aes(x = displ,y = hwy)) + geom_point(mapping = aes(x = displ,y = hwy)) + geom_smooth(mapping = aes(x = displ,y = hwy))
                                                                                                
                                                                                                
                                                                                                
                                                                                                