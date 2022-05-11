#패키지설치 및 로드
install.packages()
'hellow world'
install.packages("ggplot2")
library(g.data)
library(ggplot2)
ggplot(data = iris,aes(x = Petal.Length, y = Petal.width)) + geom_point()


#cowsay 함수
install.packages('cowsay')
library(cowsay)
say('hello world!',by='cat')


#시스템 함수
?sort
help(sort)



#생일 맞추기 (m * 4 + 9)*25 + d
#소윤 주연 민철 석준 현석
#931 754 1029 1139 1442
# 100m+225+d
# 소윤 일/월
(931-225)%%100
((931-225)-((931- 225)%%100))/100
val<-931
d<-(val-225)%%100
m<-((val-225)-((val-225)%%100))/100
cat(m,'월',d,'일')

