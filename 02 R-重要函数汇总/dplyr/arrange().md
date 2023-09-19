是 R 语言中 `dplyr` 包提供的一个函数，用于对数据框（data frame）中的**观测值按照指定的变量进行排序**。
```R
arrange(.data, ...)
```
`.data` 表示要排序的数据框；
`...` 表示**一个或多个要排序的变量**。
`arrange()` 函数默认使用升序排序（从小到大）。如果需要降序排序，则可以在变量名前加上负号（例如，`arrange(df, -Age)`）。

```R
library(dplyr)

# 示例数据框
df <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                 Age = c(25, 30, 20),
                 Salary = c(50000, 60000, 45000))

# 按照 Age 变量进行升序排序
sorted_df <- arrange(df, Age)

# 打印排序结果
print(sorted_df)
```

在上述示例中，我们有一个数据框 `df`，包含三个变量（Name、Age 和 Salary）。通过调用 `arrange()` 函数并传递数据框 `df` 和要排序的变量 `Age` 作为参数，我们将数据框按照 Age 变量进行升序排序。排序结果存储在 `sorted_df` 中，并通过打印语句输出。

输出结果如下所示：
```R
    Name Age Salary
1 Charlie  20  45000
2   Alice  25  50000
3     Bob  30  60000
```

除了单个变量，我们也可以指定多个变量进行排序。例如，可以使用 `arrange(df, Age, Salary)` 对 Age 变量进行升序排序，对于相同 Age 值的观测值，再按照 Salary 变量进行升序排序。