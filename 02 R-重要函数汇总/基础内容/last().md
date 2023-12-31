在 R 中，`last()` 函数用于返回向量、列表或数据框的**最后一个元素或行**。
以下是 `last()` 函数的一般语法：
```R
last(x, n = 1)
```
参数说明：
- `x`：要提取最后元素的向量、列表或数据框。
- `n`：要返回的元素或行数，默认为 1，表示返回最后一个元素或行。如果设置为大于 1 的整数，则返回最后 n 个元素或行。
下面是一些示例，演示如何使用 `last()` 函数：
```R
# 示例1：向量
x <- c(3, 1, 4, 1, 5, 9)

# 提取向量的最后一个元素
last_element <- last(x)
print(last_element)

# 示例2：列表
my_list <- list(a = 1, b = 2, c = 3, d = 4)

# 提取列表的最后一个元素
last_element <- last(my_list)
print(last_element)

# 示例3：数据框
my_df <- data.frame(x = c(1, 2, 3), y = c("a", "b", "c"))

# 提取数据框的最后一行
last_row <- last(my_df)
print(last_row)
```

输出结果为：

```R
[1] 9

$a
[1] 4

  x y
3 3 c
```

在上述示例中，我们使用了不同类型的数据结构。首先，我们创建了一个向量 `x`，然后使用 `last()` 函数提取了向量的最后一个元素，并将结果存储在 `last_element` 中。接下来，我们创建了一个列表 `my_list`，使用 `last()` 函数提取了列表的最后一个元素，并将结果存储在 `last_element` 中。最后，我们创建了一个数据框 `my_df`，使用 `last()` 函数提取了数据框的最后一行，并将结果存储在 `last_row` 中。
总结来说，`last()` 函数用于提取向量、列表或数据框的最后一个元素或行。你可以根据需要调整参数来获取最后一个元素或多个元素。
