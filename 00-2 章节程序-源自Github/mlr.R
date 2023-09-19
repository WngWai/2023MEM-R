library(pacman)
p_load(mlr, mlbench)

data(BostonHousing, package = "mlbench")
head(BostonHousing)
regr.task <- makeRegrTask(id = 'bh', data = BostonHousing, target = 'medv')
regr.task

data("BreastCancer", package = "mlbench")
df <- BreastCancer
df$Id <- NULL
head(df)
class.task <- makeClassifTask(id = "BreastCancer", data = df, target = "Class",
                              positive = "malignant")
class.task

yeast <- getTaskData(yeast.task)
labels <- colnames(yeast)[1:14]
yeast.task <- makeMultilabelTask(id = "multi", data = yeast, target = labels)
yeast.task

