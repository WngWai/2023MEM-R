函数是`dplyr`包中的一个函数，用于对数据框进行**变换和计算**，并返回一个新的数据框，其中包含特定的变换结果列。
```R
transmute(.data, ...)
```
- `.data`: 要进行变换的数据框。
- `...`: 要进行的变换操作，可以是列的**计算**、**重命名**或其他变换操作。
1. **计算**新列：
   假设有一个数据框`data`，其中包含`col1`和`col2`两列，我们想要计算它们的和并生成一个新的列`sum`
   ```R
   new_data <- transmute(data, sum = col1 + col2)
   ```
   上述代码将创建一个新的数据框`new_data`，其中包含了计算后的和存储在`sum`列中。
2. **重命名**：
   假设我们想要将数据框`data`中的`col1`列重命名为`new_col`：
   ```R
   new_data <- transmute(data, new_col = col1)
   ```
   上述代码将创建一个新的数据框`new_data`，其中包含了重命名后的列`new_col`。
3. 混合：
   `transmute()`函数还可以进行多个变换操作，例如，计算平均值并将结果乘以2：
   ```R
   new_data <- transmute(data, avg_col = mean(col1), doubled_avg = 2 * avg_col)
   ```

`transmute()`函数对于在数据框中进行变换和计算非常有用，可以根据需要生成新的列。请注意，`transmute()`函数将返回一个新的数据框，而不会修改原始数据框。
