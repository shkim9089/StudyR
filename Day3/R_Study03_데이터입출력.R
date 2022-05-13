##데이터 입출력

# 데이터 입력
age <- c(28, 17, 35, 46, 23, 67, 30, 50)
class(age)
str(age)

# 정보 추출
min(age)
young <- min(age)
max(age)
old <- max(age)

# 처리 결과 출력 cat을 쓰는 이유는 print는 하나만 나옴
cat('가장 젊은 사람의 나이는 ', young, '세이고,')
cat('가장 고령의 나이는', old, '세입니다. ')



##화면에서 데이터 입력받기
install.packages('svDialogs')
library(svDialogs)
user.input <- dlgInput('수입을 입력하세요')$res
user.input
income <- as.numeric(user.input)
income
tax<-income * 0.05
cat('세금 :',tax)


10
100
1000
10000
100000
#10^5승부터 1000000ㅡ로 변경하는 옵션 
options(scipen=1)
cat('세금 :',tax,'원')

##프린트,캣
x<-1
print(x)
cat(x)
print(iris[1:6,])
head(iris)
cat(iris[1:6,])

height<-dlgInput('키를 입력하세요(cm)')$res
weight<-dlgInput('몸무게를 입력하세요(kg)')$res
height<-as.numeric(height)
weight<-as.numeric(weight)


height.res<-height/100
bmi<-weight/(height.res^2)

cat('입력한 키는 ',height,'cm,몸무게는',weight,'kg 입니다')
cat('BMI는',bmi,'입니다','BMI 25이상 과체중 30이상 비만')



install.packages('formattable')
library(formattable)


num.data<-c(1250000,22500,123.456,123.444,1739.34)
num.data #벡터의 트징
comma(num.data)

#파일출력
getwd() # 현재 작업 폴더 알아내기
#setwd('C:/Rworks’) # 작업 폴더 변경하기


#csv 파일 읽기

air.quality<-read.csv('./day3/airquality.csv',header = T) #헤더가 있다T,없다F
air.quality
head(air.quality)
tail(air.quality)
str(air.quality)


setosa.iris<-my.iris<-subset(iris,Species =='setosa')
str(setosa.iris)
#row.names=F
write.csv(setosa.iris,'./day3/setosa_iris.csv',row.names = F)

##엑셀 읽고 쓰기

library(xlsx) # 패키지 불러오기
air.name <- read.xlsx('./day3/airquality.xlsx', header=T,
                 sheetIndex=1) # .xlsx 파일 읽기
head(air)

##LAB3 다이아몬드정보

library(ggplot2)
diamonds
str(diamonds)

levels(diamonds$cut)
levels(diamonds$color)
levels(diamonds$clarity)


diamonds.new <- subset(diamonds, cut == 'Premium' & carat >= 2)
str(diamonds.new)

write.csv(diamonds.new,'./day3/shiny_diamonds.csv',row.names = F)

diamonds.new.without.DH<-subset(diamonds.new,color != 'D' & color != 'H')

write.csv(diamonds.new.without.DH,'./day3/shiny_diamonds_without_DH.csv',row.names = F)
