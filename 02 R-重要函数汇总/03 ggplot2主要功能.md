`对处理后的数据进行可视化操作，选择合适的图形，直观展示数据分布特点，提供决策依据。`
### 容器层
[ggplot()](ggplot2/ggplot().md) 创建一个基本的绘图对象，指定**数据**集，设置数据和图形的整体属性。在上面可以叠加多个图形

### 辅助显示层
`theme()`: 设置图形的主题，包括背景、标题、轴标签、图例等的外观和样式。

`scale_*()`: 设置图形的比例尺，调整轴刻度、标签、颜色和形状等属性。其中 * 表示具体的比例尺，如 `scale_x_continuous()`、`scale_color_manual()` 等。

`scale_fill_*()`, `scale_color_*()`: 设置图形中填充颜色和边框颜色的属性。

`labs()`: 设置图形的标签，包括标题、轴标签、图例标题等。

### 图像层：
[aes()](ggplot2/aes().md) x,y轴映射关系，定义图形的映射关系。指定数据的变量与图形的视觉属性之间的对应关系，如 x 轴位置、y 轴位置、颜色、形状等。

[geom_point()](ggplot2/geom_point().md) 画散点图，**数据映射**

[geom_line()](ggplot2/geom_line().md) 画折线图

[geom_smooth()](ggplot2/geom_smooth().md)画创建平滑拟合曲线

[geom_bar()](ggplot2/geom_bar().md) 画柱状图

geom_text() 在图形中添加文本标签


---

[facet_grid()](ggplot2/facet_grid().md) 在gglot创建画布的基础上创建多个绘图区

[facet_wrap()](ggplot2/facet_wrap().md) 

`facet_*()`: 创建**分面绘图**，将数据根据一个或多个变量的不同水平拆分成多个子图。其中 * 表示具体的分面方式，如 `facet_wrap()`、`facet_grid()` 等。

[stat_summary()](ggplot2/stat_summary().md) ?用到再补充


