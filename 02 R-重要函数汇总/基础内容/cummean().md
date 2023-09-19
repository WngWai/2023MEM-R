是 R 中的一个函数，它用于计算向量或数据框中元素的**累积均值**。它返回一个具有相同长度的向量，其中每个元素是原始向量中该位置及之前位置上元素的均值。

以下是 `cummean()` 函数的示例用法：

```R
# 使用 cummean() 计算向量的累积均值
vec <- c(2, 4, 6, 8, 10)
cumulative_mean <- cummean(vec)

print(cumulative_mean)
```

输出结果如下：

```
[1]  2.0  3.0  4.0  5.0  6.0
```

在上述示例中，我们使用 `cummean()` 函数计算了向量 `vec` 中元素的累积均值。第一个元素保持不变，第二个元素是前两个元素的均值，第三个元素是前三个元素的均值，以此类推。

`cummean()` 函数也可以应用于数据框中的列。下面是一个示例：

```R
data <- data.frame(
  category = c("A", "B", "C", "D", "E"),
  value = c(2, 4, 6, 8, 10)
)

# 在数据框中应用 cummean()
cumulative_mean_data <- data %>%
  mutate(cumulative_mean_value = cummean(value))

print(cumulative_mean_data)
```

输出结果如下：

```
  category value cumulative_mean_value
1        A     2                   2.0
2        B     4                   3.0
3        C     6                   4.0
4        D     8                   5.0
5        E    10                   6.0
```

在上述示例中，我们使用 `mutate()` 函数和 `cummean()` 函数在数据框中创建了一个新列 `cumulative_mean_value`，其中存储了 `value` 列元素的累积均值。

通过 `cummean()` 函数，你可以计算向量或数据框中元素的累积均值，这对于计算累积和、滚动平均等累积性统计量非常有用。

希望这个例子能够帮助你理解 `cummean()` 函数的作用。如果你有任何其他问题，请随时提问！