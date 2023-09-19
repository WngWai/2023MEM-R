ncol() 是 R 语言中的一个函数，用于**获取矩阵或数据框的列数**。ncol() 函数返回指定对象的列数。
```R
ncol(x)
```
- `x`：要获取列数的对象，可以是矩阵或数据框。

示例 1：获取矩阵的列数
```R
mat <- matrix(1:6, nrow = 2, ncol = 3)
num_cols <- ncol(mat)
print(num_cols)
```
输出结果为：
```R
[1] 3
```

示例 2：获取数据框的列数
```R
df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
num_cols <- ncol(df)
print(num_cols)
```
输出结果为：
```R
[1] 3
```

非常抱歉给您带来的困扰，我会尽力确保提供正确的代码格式。如果您有其他问题，请随时告诉我。