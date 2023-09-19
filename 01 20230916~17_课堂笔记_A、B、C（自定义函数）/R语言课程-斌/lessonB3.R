#连接
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
  2,"y2"
)
left_join(x,y,by = "key")
right_join(x,y,by="key")
inner_join(x,y,by="key")
##########
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)

head(planes)

flights2 %>%
  left_join(planes,by = "tailnum") %>%
  select(tailnum,carrier)

head(airports)

flights2 %>%
  left_join(airports,c("dest" = "faa"))

(top_dest <- flights %>%
  count(dest,sort = TRUE) %>% 
  head(10))

flights %>%
  semi_join(top_dest)

flights %>%
  anti_join(planes,by = "tailnum") %>% 
  count(tailnum,sort = TRUE)
