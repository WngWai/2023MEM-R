library(data.table)
library(tidyverse)
library(nycflights13)

flights <- data.table(flights)
flights[1:2]
flights[,1:2]
flights[1:2,]

ans <- flights[order(origin, -dest)]
head(ans)
microbenchmark::microbenchmark(
date <- flights[, .(year, month, day)],
date2 <- select(flights, year, month, day))

flights[month == 3 & carrier == "EV",
        .N]
flights[, c("year", "month")]
flights[, .(year, month)]

flights[,
        .(mean(dep_delay, na.rm = T), mean(arr_delay, na.rm = T)),
        by = .(origin, dest)]
flights[,
        .(dep_delay, arr_delay, origin)
      ][,
        lapply(.SD, mean, na.rm = T),
        by = .(origin)]
keep(flights, is.numeric)[
  month == 1,
  lapply(.SD, mean, na.rm = T),
  by = .(day),
  .SDcols = !c("dep_delay", "arr_delay")
]

flights[,
       .(year, month, day, dest)
       ][,
       .(val = list(day)),
       by = month
       ]
