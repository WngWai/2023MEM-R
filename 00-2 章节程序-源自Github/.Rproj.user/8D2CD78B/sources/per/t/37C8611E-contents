library(tidyverse)

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

