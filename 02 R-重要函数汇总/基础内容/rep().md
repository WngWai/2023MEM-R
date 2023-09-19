 是一个函数，用于**创建重复的值或向量**。
```R
rep(x, times = 1, each = 1, length.out = NA)
```
  - `x`：要重复的值或向量。
  - `times`：（可选）重复 `x` 的**次数**，可以是一个非负整数或向量。
  - `each`：（可选）每个**元素重复的次数**，可以是一个非负整数或向量。
  - `length.out`：（可选）生成的**结果向量的长度**，可以是一个非负整数。
`rep()` 函数根据指定的参数生成重复的值或向量，并返回一个新的向量。
1. 重复单个值：
````R
   result <- rep(5, times = 3)
   print(result)  # 输出：5 5 5
````
2. 重复向量元素：
   ````R
   values <- c(1, 2, 3)
   result <- rep(values, times = 2)
   print(result)  # 输出：1 2 3 1 2 3
   ````
3. 指定每个元素的重复次数：
   ````R
   values <- c(1, 2, 3)
   result <- rep(values, each = 2)
   print(result)  # 输出：1 1 2 2 3 3
   ````
4. 指定生成结果向量的长度：
   ````R
   values <- c(1, 2, 3)
   result <- rep(values, length.out = 6)
   print(result)  # 输出：1 2 3 1 2 3
   ````
5.time和each同用
先each再time
```R
   values <- c(1, 2, 3)
   result <- rep(values, times = 3, each = 2)
   print(result) # 输出：1 1 2 2 3 3 1 1 2 2 3 3 1 1 2 2 3 3 
```
`rep()` 函数在创建重复值或向量时非常有用，可以根据不同的参数设置生成不同模式的重复数据。可以根据需要灵活地使用 `times`、`each` 和 `length.out` 参数来控制重复的方式和输出结果。