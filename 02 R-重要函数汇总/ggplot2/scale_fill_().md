`scale_fill_*()` 函数是 `ggplot2` 包中用于修改填充颜色的函数，主要用于调整图形中填充颜色的映射和外观。这些函数用于修改图形中的填充颜色，例如柱状图的填充颜色、散点图中的点的填充颜色等。

`scale_fill_*()` 函数的具体名称取决于你要修改的图形对象，例如 `scale_fill_manual()` 用于手动设置填充颜色，`scale_fill_gradient()` 用于使用渐变色设置填充颜色等。

以下是一些常用的 `scale_fill_*()` 函数及其功能：

- `scale_fill_manual()`: 手动设置填充颜色的映射关系，可以指定特定颜色值或颜色向量。

  示例：
  `````R
  # 手动设置填充颜色为红色和蓝色
  scale_fill_manual(values = c("red", "blue"))
  ```

- `scale_fill_gradient()`: 使用渐变色设置填充颜色，可以通过不同的参数来控制渐变的类型和外观，如 `low`、`high`、`type`、`limits` 等。

  示例：
  ````R
  # 使用蓝色到红色的渐变色设置填充颜色
  scale_fill_gradient(low = "blue", high = "red")
  ```

- `scale_fill_continuous()`: 设置连续型数据的填充颜色映射，可以指定颜色空间、颜色范围等参数。

  示例：
  ````R
  # 设置填充颜色映射为蓝色调色板
  scale_fill_continuous(palette = "Blues")
  ```

- `scale_fill_discrete()`: 设置离散型数据的填充颜色映射，可以指定颜色调色板、颜色顺序等参数。

  示例：
  ````R
  # 设置填充颜色映射为默认调色板
  scale_fill_discrete()
  ```

- 其他特定的 `scale_fill_*()` 函数，如 `scale_fill_gradient2()`、`scale_fill_hue()` 等，用于特定的填充颜色需求。

通过使用适当的 `scale_fill_*()` 函数，可以修改图形中的填充颜色映射，以及外观和样式。可以根据具体的需求，调整参数值来实现所需的填充颜色效果。