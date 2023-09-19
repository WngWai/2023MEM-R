library(tidyverse)
#1.6练习1
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy),color="black") +
  geom_point() +
  geom_smooth(se = FALSE)
#1.6练习2
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy, group = drv),color="black") +
  geom_point() +
  geom_smooth(se = FALSE)
#1.6练习3
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy, group = drv)) +
  geom_point() +
  geom_smooth(mapping = aes(color = drv),se = FALSE)
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy)) +
  geom_point(color="black") +
  geom_smooth(mapping = aes(color = drv),se = FALSE)
#1.6练习4
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se = FALSE)
#1.6练习5
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth( mapping = aes(linetype = drv),se = FALSE)
#1.6练习6
ggplot(data = mpg,  mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv))