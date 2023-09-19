install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
view(flights)
###########
filter(flights,month==1,day==1)
(dec25 <- filter(flights,month==2,day==20))
(mov_dec <- filter(flights,month %in% c(11,12)))