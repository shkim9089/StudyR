## 원그래프
# 원그래프 pie 그래프

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
ds <- table(favorite) # 도수분포 계산
ds
pie(ds, main='선호 계절', # 원그래프 작성
    radius=1,col = rainbow(4))

#원그래프 2
install.packages('plotrix')
library(plotrix)
pie3D(ds,main='선호 계절절',labels = names(ds),
      labelcex = 1.0, labelcol ='yellow',explode = 0.1, 
      radius=1.5, col =c('brown','Lightgreen','skyblue','white'))


#선그래프

month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)

#x축,y축 따로 plot(x,y)
plot(month, late, 
     main = '지각생 통계',
     type='l',lty=1,lwd=2,
     xlab='Month', ylab ='late cnt'
)

#선그래프 2개이상

late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
#x축,y축 따로 plot(x,y)
plot(month, late1, 
     main = '지각생 통계2',
     type='o',lty=1,lwd=2,
     xlab='월', ylab ='지각생수',col='red',
     ylim=c(0,15)
     )

lines(month,late2,
      main ='지각생 통계2',
      type='o',lty=1,lwd=2,
      xlab='월',ylab='지각생수',col='blue'
    )

##LAB
install.packages('DAAG')
library(DAAG)

ds<-table(science$like)
pie(ds,radius = 1, main = '선호점수별 비율',
    col = rainbow(length(ds)))

pie3D(ds,main='선호점수별 비율',explode = 0.1,
      labels = names(ds), labelcex = 1.0, radius = 1.5,
      labelcol = 'white')

## 산점도

wt<-mtcars$wt
wt
mpg<-mtcars$mpg
mpg

plot(wt,mpg,
     main = '중량-연비 산점도',
     xlab='중량',ylab='연비(mpg',las=1,
     col= 'red', pch=19)


plot(mtcars$wt, mtcars$mpg)
plot(mtcars[,c('wt', 'mpg')])
plot(mpg~wt, data=mtcars)

##
vars <- c('mpg','disp','drat','wt') # 대상 변수
target <- mtcars[,vars] # 대상 데이터 생성
plot(target, main = '다중산점도')
head(target)


## iris

iris.2 <- iris[,3:4] # 데이터 준비
iris
iris.2
levels(iris$Species) # 그룹 확인
group <- as.numeric(iris$Species) # 점의 모양과 색
group # group 내용 출력 세토사1,버지컬러2,버지니카3
color <- c('red','green','blue') # 점의 컬러
plot(iris.2,
     main='붓꽃 꽃잎길이,넓이 산점도',
     pch=group, col=color[group], xlab=='꽃잎길이',ylab='꽃잎 넓이',las=1)
legend(x='bottomright',legend =levels(iris$Species),
       col= c('red','green','blue'),
       pch = (1:3))



#LAB 자동차 선팅분석
library(DAAG)
str(tinting)

plot(tinting$it,tinting$csoa)

group<-as.numeric(tinting$tint)
levels(group)
color<-c('red','green','blue')

plot(tinting$it,tinting$csoa,col=color[group],
     pch=c(group))

group <- as.numeric(tinting$agegp)
color<-c('red','blue')
plot(tinting$it,tinting$csoa,
     pch=c(group),col=color[group])



##호주의 사회 복지 서비스와 만족도
library(DAAG)
str(socsupport)


ds<-table(socsupport$age)
ds
pie3D(ds,main = '연령분포',
      labels = names(ds),
      labelcex = 1.0,radius = 1.5,
      explode= 0.1,
      col=rainbow(length(ds)))




group<-as.numeric(socsupport$gender)
color<-c('blue','red')
plot(socsupport,c('emotionalsat','tangiblesat','age'),
     pch=group,col=color[group])
