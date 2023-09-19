是 R 语言中 `dplyr` 包提供的一个函数，用于在数据框（data frame）中**创建或修改新的列（变量）**。
`mutate()` 函数会返回一个**新的数据框**，其中包含创建或修改后的列，原始数据框不会被修改。如果需要在原始数据框上进行就地修改，可以使用赋值操作符
```R
mutate(.data, new_column1 = expression1, new_column2 = expression2,...)
```
`.data` 表示要进行操作的**数据框**；
`new_column` 是要**创建或修改的新列的名称**，创建新列后会自动添加到df最后一列；
`expression` 是用于计算**新列值的表达式**；
`...` 表示其他要创建或修改的列。

```R
library(dplyr)

# 示例数据框
df <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                 Age = c(25, 30, 20),
                 Salary = c(50000, 60000, 45000))

# 创建新列 Bonus，计算 Salary 的 10% 作为 Bonus 值
df <- mutate(df, Bonus = Salary * 0.1)

# 修改 Age 列，将年龄加上 1
df <- mutate(df, Age = Age + 1)

# 打印修改后的数据框
print(df)
```

在上述示例中，我们有一个数据框 `df`，包含三个列（Name、Age 和 Salary）。通过调用 `mutate()` 函数并传递数据框 `df`、要创建的新列名称 `Bonus` 和计算表达式 `Salary * 0.1` 作为参数，我们创建了一个名为 Bonus 的新列，其值为 Salary 的 10%。接着，我们再次调用 `mutate()` 函数，并将数据框 `df`、要修改的列名 `Age` 和计算表达式 `Age + 1` 作为参数，将 Age 列中的每个值加上 1。最后，我们通过打印语句输出修改后的数据框。
输出结果如下所示：
```R
    Name Age Salary  Bonus
1  Alice  26  50000  5000
2    Bob  31  60000  6000
3 Charlie  21  45000  4500
```

在输出结果中，我们可以看到数据框 `df` 中新增了一个名为 Bonus 的列，它的值是根据 Salary 列计算得出的。同时，Age 列的值也被修改为原值加上 1。