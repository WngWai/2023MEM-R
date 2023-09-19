library(tidyverse)
read_csv("a, b, c
         1, 2, 3
         4, 5, 6")
read_csv("1, 2, 3\n4, 5, 6", col_names = c("x", "y", "z"))
read_csv("a, b\n1, 2\na, b")

parse_logical(c("TRUE", "FALSE", "NA"))
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))

parse_date("01/02/15", format = "%m/%d/%y")
