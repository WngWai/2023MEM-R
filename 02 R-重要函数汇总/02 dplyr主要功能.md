`对通过readr导入进的数据集进行批量清洗，合并多个数据集数据，再进行统计指标分析，最终实现指标输出。`
### 数据的基础处理
#### 筛选行/列
[filter()](dplyr/filter().md) 处理数据框数据（df），筛选满足条件的**行**

[select()](dplyr/select().md) 按照**指定列**，形成新的数据框

#### 对行/列数据进行操作
[arrange()](dplyr/arrange().md) 对df中行数据按**指定列中数据进行重新排序**

[mutate()](dplyr/mutate().md) **创建或修改**新的列（变量）

[transmute()](dplyr/transmute().md) 只**保留新列**

[lag()](dplyr/lag().md) 和[lead()](dplyr/lead().md)**偏移**函数，后移和前移

[distinct()](dplyr/distinct().md) **去除重复观测值**


### 处理关系数据
[tribble()](dplyr/tribble().md) 创建**小规模的示例数据框**，大规模用df数据框

[inner_join()](dplyr/inner_join().md) 内连接

[left_join()](dplyr/left_join().md)左连接right_join()右连接

[full_join()](dplyr/full_join().md) 全连接

[semi_join()](dplyr/semi_join().md)半连接，目的筛选**左表数据**。以右表数据作为标准，筛选左表的依据，并不会返回右表中任何数据

[anti_join()](dplyr/anti_join().md)反连接，目的是筛选坐标数据，跟半连接相反，筛选右表没有的数据


### 分组统计
[group_by()](dplyr/group_by().md) 指定列进行**分组**，分组后再summarize会**保留**分组列

ungroup() **取消**分组
<br />
<br />
[summarize()](dplyr/summarize().md) **统计分析**列数据
<br />
<br />
[n()](dplyr/n().md) 计算**行数**

[count()](dplyr/count().md)计算**唯一值**出现**次数**

[n_distinct()](dplyr/n_distinct().md)计算**唯一值数量**，注意唯一值数量指种类，跟上面的唯一值次数指频数不同
<br />
<br />
[min_rank()](dplyr/min_rank().md) 最小值**排序序号**



