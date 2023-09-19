在ggplot2中，函数用于**计算和绘制统计摘要图形**。它可以用于显示数据的**汇总统计信息，例如均值、中位数、标准差等**。
```R
stat_summary(
  mapping = NULL,
  data = NULL,
  fun = NULL,
  geom = "pointrange",
  position = "identity",
  ...,
  width = NULL,
  fun.args = list()
)
```

参数说明：
- `mapping`: 用于定义数据变量与图形属性的映射关系，例如x轴、y轴、颜色等。
- `data`: 数据框，包含要绘制的变量。
- `fun`: 要应用于数据的统计函数，例如mean、median、sd等。可以是内置的函数或自定义的函数。
- `geom`: 统计摘要图形的类型，常用的有"pointrange"（点范围图）和"crossbar"（十字杆图）。
- `position`: 统计摘要图形的摆放方式，常用的有"identity"（默认，与原始数据对齐）和"dodge"（并列）。
- `width`: 统计摘要图形的宽度，可以是一个常量值或一个表示宽度的表达式。
- `fun.args`: 传递给统计函数的其他参数。

以下是一个示例，展示如何使用`stat_summary()`函数创建统计摘要图形：

```R
library(ggplot2)

# 创建一个数据框
data <- data.frame(
  category = rep(c("A", "B"), each = 10),
  value = rnorm(20)
)

# 创建统计摘要图形
ggplot(data, aes(x = category, y = value)) +
  stat_summary(fun = mean, geom = "pointrange", color = "blue") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2, color = "red")
```

在这个示例中，我们创建了一个数据框`data`，其中包含了一个类别变量`category`和一个数值变量`value`。然后，使用`ggplot()`函数创建一个基本的绘图对象，并使用`stat_summary()`函数添加统计摘要图形。

在第一个`stat_summary()`函数中，我们设置`fun`参数为`mean`，表示计算均值，并将`geom`参数设置为"pointrange"，表示使用点范围图形。通过设置`color`参数为"blue"，我们为统计摘要图形指定了颜色。

在第二个`stat_summary()`函数中，我们设置`fun.data`参数为`mean_cl_normal`，表示计算均值的置信区间，并将`geom`参数设置为"errorbar"，表示使用误差线图形。通过设置`width`参数为0.2，我们调整了误差线的宽度。通过设置`color`参数为"red"，我们为统计摘要图形指定了颜色。

这个示例将创建一个带有均值点和置信区间误差线的统计摘要图形，其中x轴表示类别，y轴表示数值。