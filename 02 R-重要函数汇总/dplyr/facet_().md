在 `ggplot2` 包中，`facet_*()` 函数用于创建分面图，将数据根据一个或多个变量的不同水平拆分成多个子图。分面图是一种有效的数据可视化方式，可帮助我们同时观察数据在不同条件下的变化。

以下是几个常用的 `facet_*()` 函数及其参数的详细介绍和举例：

1. `facet_wrap()`
   ```facet_wrap()` 函数用于在一个特定的变量上创建网格布局的子图，每个子图显示该变量的不同水平。
   参数：
   - `facets`：指定用于分面的变量，可以是一个或多个变量名，用 `~` 分隔。

   ```R
   # 使用 facet_wrap() 创建基于 "category" 变量的网格布局子图
   ggplot(data = df, mapping = aes(x = x, y = y)) +
     geom_point() +
     facet_wrap(~ category)
   ```

2. `facet_grid()`
   ``facet_grid()` 函数用于在两个变量上创建网格布局的子图，显示这两个变量的组合。

   - `rows`：指定放置于行方向的变量名。
   - `cols`：指定放置于列方向的变量名。

   ```R
   # 使用 facet_grid() 创建基于 "category" 和 "group" 变量的网格布局子图
   ggplot(data = df, mapping = aes(x = x, y = y)) +
     geom_point() +
     facet_grid(category ~ group)
   ```

3. `facet_wrap()` 和 `facet_grid()` 的参数共享：
   - `nrow` 和 `ncol`：用于指定子图的行数和列数。
   - `scales`：控制每个子图的坐标轴刻度是否相同。可以设置为 "free"（每个子图独立刻度）、"fixed"（所有子图共享相同刻度）或 "free_x" / "free_y"（x 轴或 y 轴独立刻度）。
   - `switch`：逻辑值，用于指定是否交换行和列的顺序。
   - `labeller`：用于自定义子图的标签。
   - `drop`：逻辑值，用于指定是否删除没有数据的子图。

   ```R
   # 使用 facet_wrap() 创建 2 行 3 列的子图网格，刻度独立
   ggplot(data = df, mapping = aes(x = x, y = y)) +
     geom_point() +
     facet_wrap(~ category, nrow = 2, ncol = 3, scales = "free")

   # 使用 facet_grid() 创建子图网格，自定义标签和刻度
   ggplot(data = df, mapping = aes(x = x, y = y)) +
     geom_point() +
     facet_grid(category ~ group, labeller = label_both, scales = "free_x")
   ```

通过使用 `facet_wrap()` 和 `facet_grid()` 函数，可以根据数据的不同条件创建多个子图，以便更好地比较和分析数据。这些函数的参数可以根据需要进行调整，以满足特定的分面布局需求。