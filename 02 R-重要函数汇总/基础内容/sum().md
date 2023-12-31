在R语言中，`sum()`函数用于计算数值向量的总和。它接受一个数值向量作为输入，并返回这些值的累加和。
```R
sum(x, na.rm = FALSE)
```

- `x`：表示要计算总和的数值向量。
- `na.rm`：一个逻辑值，表示是否在计算总和时忽略缺失值（NA）。默认为`FALSE`，即不忽略缺失值；如果设置为`TRUE`，则在计算总和时会忽略缺失值。
1. 计算向量的总和：
```R
x <- c(1, 2, 3, 4, 5)
sum(x)
```
输出示例：
```
[1] 15
```
在这个示例中，我们计算了向量`x`的总和，结果为15。

2. 忽略缺失值的总和计算：
```R
y <- c(1, 2, NA, 4, 5)
sum(y, na.rm = TRUE)
```
输出示例：
```
[1] 12
```
在这个示例中，我们使用了`na.rm = TRUE`参数，表示在计算总和时忽略缺失值。结果中的NA被忽略，计算的总和为12。

3. 对矩阵的列进行总和计算：
```R
mat <- matrix(1:9, nrow = 3)
sum(mat[, 2])
```
输出示例：
```
[1] 12
```
在这个示例中，我们计算了矩阵`mat`的第二列的总和，结果为12。

这些示例展示了`sum()`函数的一些常见用法。您可以根据需要使用`sum()`函数来计算数值向量或矩阵的总和。

希望这些示例能帮助您理解`sum()`函数的用法。如果您有任何其他问题，请随时提问。