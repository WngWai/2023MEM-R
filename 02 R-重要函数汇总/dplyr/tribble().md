在函数中，通过按列指定数据来创建数据框。以下是`tribble()`函数中参数的详细介绍和示例：
```R
tribble(
  ~col1, ~col2,
  "a"  , 2,
  "b"  , 4,
  "c"  , 6
)
```
- `~`：列名和列数据之间的分隔符。它表示**将列名和列数据关联起来**。
- 列名：在`~col*`中**指定的列名**，用于标识数据框中的列。
- 列数据：在`~col*`之后指**定的列数据**，用于填充数据框中的相应列。

下面是一个更详细的示例，展示了`tribble()`函数中参数的使用：
```R
library(dplyr)

df <- tribble(
  ~name,       ~age,    ~city,
  "Alice",     25,      "New York",
  "Bob",       30,      "Chicago",
  "Charlie",   35,      "Los Angeles"
)

print(df)
```

输出：
```
# A tibble: 3 x 3
  name    age city       
  <chr> <dbl> <chr>      
1 Alice    25 New York   
2 Bob      30 Chicago    
3 Charlie  35 Los Angeles
```
在上述示例中，我们创建了一个名为`df`的数据框。通过按列指定数据，我们定义了三个列：`name`、`age`和`city`。每个列名之前都有一个`~`符号，并且列数据与列名之间用逗号分隔。数据框中的每一行由逗号分隔。
`tribble()`函数是一种方便的方法，特别适用于创建**小规模的示例数据框**。通过按列指定数据，我们可以轻松地定义数据框的结构和内容。
