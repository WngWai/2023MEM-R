`typeof()`是一个在R语言中用于确定**对象类型**的函数。它返回一个代表对象类型的字符串。
以下是一些常见的R对象类型及其对应的`typeof()`返回值：
- 数值（Numeric）：包括整数和实数。
  - `typeof(5)` 返回 "double"。
- 字符串（Character）：表示文本或字符数据。
  - `typeof("Hello")` 返回 "character"。
- 逻辑值（Logical）：表示真或假的值。
  - `typeof(TRUE)` 返回 "logical"。
- 复数（Complex）：包含实数和虚数部分的复数。
  - `typeof(1 + 2i)` 返回 "complex"。
- 列表（List）：包含多个元素的对象。
  - `typeof(list(1, 2, 3))` 返回 "list"。
- 函数（Function）：表示可调用的代码块。
  - `typeof(mean)` 返回 "function"。
- 数据框（Data frame）：包含多个变量的表格型数据结构。
  - `typeof(data.frame(x = 1:3, y = c("a", "b", "c")))` 返回 "list"。
- 矩阵（Matrix）：具有行和列的二维数组。
  - `typeof(matrix(1:4, nrow = 2, ncol = 2))` 返回 "double"。
- 因子（Factor）：表示离散分类变量的对象。
  - `typeof(factor(c("A", "B", "A", "C")))` 返回 "integer"。
- 数组（Array）：具有多个维度的数据结构。
  - `typeof(array(1:6, dim = c(2, 3)))` 返回 "integer"。

需要注意的是，`typeof()`函数返回的是对象的基本类型信息，而不是对象的详细结构或类别。如果想要获取更详细的对象类型信息，可以使用其他函数，如`class()`、`str()`等。
