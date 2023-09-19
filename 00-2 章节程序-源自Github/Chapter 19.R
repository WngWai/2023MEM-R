library(modelr)
library(tidyverse)

data.frame(x = list(1:3, 3:5))
tibble(
  x = list(1:3, 3:5),
  y = c("1, 2", "3, 4, 5")
)

df <- tribble(
  ~x1,
  "a,b,c",
  "d,e,f,g"
)
df
df %>% 
  mutate(x2 = str_split(x1, ","))
df %>% 
  mutate(x2 = str_split(x1, ",")) %>%
  unnest()
separate_rows(list("a,b,c"), sep = ",")

sim <- tribble(
  ~f, ~params,
  "runif", list(min = -1, max = -1),
  "rnorm", list(sd = 5),
  "rpois", list(lambda = 10)
)
sim %>%
  mutate(sims = invoke_map(f, params, n = 10))

mtcars %>%
  group_by(cyl) %>%
  summarise(q = list(quantile(mpg)))

probs <- c(0.01, 0.25, 0.5, 0.75, 0.99)
mtcars %>%
  group_by(cyl) %>%
  summarise(p = list(probs), q = list(quantile(mpg, probs))) %>%
  unnest()

x <- list(
  a = 1:5,
  b = 3:4,
  c = 5:6
)
x
df <- enframe(x)

df %>% 
  mutate(
    smry = map2_chr(
      name,
      value,
      ~ str_c(.x, ":", .y[2])
    )
  )
mtcars %>% 
  group_by(cyl) %>%
  summarise_each(funs(list))

df <- tribble(
  ~x,
  list(a = 1, b = 2),
  list(a = 2, c = 4)
)
df %>% mutate(
  a = map_dbl(x, "a"),
  b = map_dbl(x, "b", .null = NA_real_)
)

