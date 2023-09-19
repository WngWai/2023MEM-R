函数是R语言中的一个函数，用于在绘图中**添加平滑曲线**。
```R
geom_smooth()
```
- `method`：用于指定平滑曲线的方法。常用的方法包括"lm"（线性回归），"loess"（局部多项式回归），"gam"（广义可加模型）等。例如，`method = "lm"`将使用线性回归方法添加平滑曲线。
- `formula`：用于指定平滑曲线的公式。公式可以包含自变量和因变量，例如`formula = y ~ x`，其中`y`是因变量，`x`是自变量。
- `se`：指定是否显示平滑曲线的**置信区间**。默认值为`TRUE`，表示显示置信区间。
- `span`：用于指定局部多项式回归的平滑度。取值范围为0到1，越接近于1表示平滑度越高。

```R
library(ggplot2)

# 创建一个散点图，并添加平滑曲线
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Weight vs. MPG",
       x = "Weight",
       y = "MPG")
```

这个示例中，我们使用了`mtcars`数据集的`wt`（车重）和`mpg`（每加仑英里数）列绘制了一个散点图，并通过`geom_smooth()`函数使用线性回归方法添加了平滑曲线。