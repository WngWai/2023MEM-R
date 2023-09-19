是一个函数，用于**获取或设置对象的名称**（names）。`names()` 函数用于获取或设置对象的名称。如果对象具有名称，该函数将返回一个**字符型向量**，其中包含对象的名称。如果对象没有名称，则返回 `NULL`。
```R
names(object)
```
  - `object`：要获取或设置名称的对象。

1. 获取对象的名称：
   `````R
   fruits <- c("apple", "banana", "orange")
   names(fruits) <- c("A", "B", "C")
   result <- names(fruits)
   print(result)  # 输出："A" "B" "C"

   在这个示例中，我们首先使用 `c()` 函数创建了一个字符型向量 `fruits`，然后使用 `names()` 函数为向量的每个元素分配了名称。最后，使用 `names()` 函数获取向量 `fruits` 的名称。
   `````
2. 设置对象的名称：
   `````R
   nums <- c(1, 2, 3)
   names(nums) <- c("one", "two", "three")
   print(nums)  # 输出：1 2 3

   在这个示例中，我们首先使用 `c()` 函数创建了一个数值向量 `nums`，然后使用 `names()` 函数为向量的每个元素分配了名称。
   `````
3. 移除对象的名称：
   `````R
   fruits <- c("apple", "banana", "orange")
   names(fruits) <- NULL
   result <- names(fruits)
   print(result)  # 输出：NULL

   在这个示例中，我们使用 `names()` 函数将向量 `fruits` 的名称设置为 `NULL`，从而移除了向量的名称。
   `````
`names()` 函数在处理对象的名称时非常有用。可以使用 `names()` 函数获取对象的名称，也可以使用 `names()` 函数为对象分配名称或移除名称。这对于对数据进行标记、索引和引用等操作非常有帮助。