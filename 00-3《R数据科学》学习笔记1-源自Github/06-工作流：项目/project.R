# 不要认为 environment 是“真实的”，而是认为 script和data file是真实的

# 将主要的步骤保存在script中而不是交互中

# 使用：
#  1. ctrl + shift + F10来重启RStudio
#  2. ctrl + shift + S 来重新运行当前的脚本

# 获得当前的路径
getwd()
# 设置当前的路径
setwd("C:/Users/yinia/Desktop/RForDataScienceNotes/06-工作流：项目")  # 或者可以使用\\而不是/，但是单纯的\会报错，因为\有转义符的作用
getwd()
