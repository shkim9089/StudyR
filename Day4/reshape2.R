##종업원팁

install.packages('reshape2')
library(reshape2)
str(tips)

unique(tips$sex)
idx <- which(tips[, 'sex'] == 'Female')
avg.female <- mean(tips[idx, 'tip'])

idx <- which(tips[, 'sex'] == 'Male')
avg.male <- mean(tips[idx, 'tip'])

avg.female
avg.male
