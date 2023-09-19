 是 R 语言中 `dplyr` 包提供的一个函数，用于对数据框（data frame）中的**列进行汇总统计操作**，生成汇总结果。
 `summarize()` 函数会返回一个新的数据框，其中包含汇总统计的结果。汇总结果的每个统计指标都作为新列存在，列名由用户指定。原始数据框不会被修改。
```R
summarize(.data, new_column = expression, ...)
```
`.data` 表示要进行操作的数据框；
`new_column` 是要创建的**新列**的名称；
`expression` 是用于计算新列值的**表达式**；
除了基本的统计函数（例如 `mean()`、`max()`、`min()`），在 `summarize()` 函数中还可以使用其他各种函数来进行汇总统计，甚至进行更复杂的操作。用户可以根据需要自定义表达式来生成新的汇总列。
`...` 表示其他要进行汇总统计的列。

```R
library(dplyr)

# 示例数据框
df <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                 Age = c(25, 30, 20),
                 Salary = c(50000, 60000, 45000))

# 对 Salary 列进行汇总统计，计算平均值、最大值和最小值
summary_df <- summarize(df, Average = mean(Salary), Max = max(Salary), Min = min(Salary))

# 打印汇总结果
print(summary_df)
```
在上述示例中，我们有一个数据框 `df`，包含三个列（Name、Age 和 Salary）。通过调用 `summarize()` 函数并传递数据框 `df`，以及要创建的新列名称 `Average`、`Max` 和 `Min`，以及计算表达式 `mean(Salary)`、`max(Salary)` 和 `min(Salary)` 作为参数，我们对 Salary 列进行了平均值、最大值和最小值的汇总统计。得到的汇总结果存储在 `summary_df` 中，并通过打印语句输出。

输出结果如下所示：
```R
  Average   Max   Min
1   51666 60000 45000
```
在输出结果中，我们可以看到对 Salary 列进行了平均值、最大值和最小值的汇总统计。

### ...具体参数扩展
1. 使用内置函数进行求和：
   ```R
   summarize(total_sales = sum(sales))
   ```
   上述代码将计算数据框中`sales`列的总和，并创建一个名为`total_sales`的新列，其中包含结果。

2. 使用多个汇总函数：
   ```R
   summarize(total_sales = sum(sales), average_price = mean(price), max_quantity = max(quantity))
   ```
   上述代码将同时计算总销售额、平均价格和最大数量，并创建相应的新列。

3. 使用条件函数进行计数：
   ```R
   summarize(high_sales = sum(ifelse(sales > 1000, 1, 0)))
   ```
   上述代码将计算`sales`列中大于1000的销售记录数，并创建一个名为`high_sales`的新列。

4. 使用自定义函数进行计算：
   ```R
   summarize(custom_stat = my_function(column1, column2))
   ```
   上述代码使用自定义函数`my_function()`对`column1`和`column2`进行计算，并将结果存储在名为`custom_stat`的新列中。

5. 通过分组进行汇总：
   ```R
   group_by(category) %>%
   summarize(total_sales = sum(sales))
   ```
   上述代码首先使用`group_by()`函数按`category`列分组数据，然后使用`summarize()`函数计算每个组的总销售额。

这些示例展示了`summarize()`函数中参数的用法。您可以根据需要组合使用内置函数、条件函数、自定义函数和分组来实现不同的汇总操作。

### NA缺失值导致的问题
如果在`summarize()`函数中使用`mean()`函数计算列的平均值时，最终结果显示为NA，可能有以下几种原因：
R语言对缺失值的处理结果仍为缺失值！
1. 缺失值（NA）存在：如果在`flights`数据框中的`dep_delay`列中存在缺失值（NA），那么计算平均值时会忽略这些缺失值，并将结果设为NA。在这种情况下，您可以使用`na.rm = TRUE`参数来忽略缺失值进行计算，例如：`mean(dep_delay, na.rm = TRUE)`。
2. 整列都是缺失值：如果`dep_delay`列中的所有值都是缺失值（NA），那么计算平均值时结果将是NA，因为没有可用的非缺失值进行计算。
3. 数据类型不匹配：`dep_delay`列的数据类型可能不是数值型（numeric），而是字符型（character）或因子型（factor）。在这种情况下，无法计算平均值，并且结果将为NA。您可以使用`as.numeric()`函数将列转换为数值型：`mean(as.numeric(dep_delay))`。