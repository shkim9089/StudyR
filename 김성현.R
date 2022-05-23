##함수를 사용하여 아래의 벡터를 만들어 보세요
#결과1
# 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8. 3.0

res1<-seq(1,3,0.2)
res1

#x<-1:11에서 아래의 결과가 나오게 만들어보세 단순 인덱스는 아닙니다.
x<-1:11
res2<-x[rep(c(1,2,3),time=3)]
res2


#아래를 확인
#월요일부터 일요일까지 최고기온 데이터
#기본적인 막대그래프
max.temp<-c(22,27,26,24,23,26,28)
str(max.temp)

barplot(max.temp,
        main='주간최대기온',
        ylab='섭씨',xlab = '요일',col = rainbow(7),
        horiz = T, #가로
        names=c('일','월','화','수','목','금','토'),las=2)


#아래를 확인
#trees 데이터셋을 사용해 아래와 같은 산점도
str(trees)

t.girth<-trees$Girth #둘레
t.girth
t.vol<-trees$Volume #용적
t.vol

plot(t.girth,t.vol,
     main='나무 둘레*용적 산점도',
     xlab = '둘레',ylab = '용적',
     col='skyblue')


##아래를 확인
#airquality 데이터셋 다중 히스토그램
str(airquality)

color.1<-rep('#a8dadc',9)
color.1[1]<-'#1d3557'

color.2<-rep('#a8dadc',5)
color.2[4]<-'#1d3557'

color.3<-rep('#a8dadc',8)
color.3[6]<-'#1d3557'

color.4<-rep('#a8dadc',5)
color.4[2]<-'#1d3557'


par(mfrow=c(2,2), mar=c(4,5,4,2))

hist(airquality$Ozone, #오존
     main='오존분포', 
     xlab = '오존',
     col = color.1)

hist(airquality$Temp, #기온
     main='기온분포', breaks = 5,
     xlab = '기온',
     col = color.2)

hist(airquality$Solar.R, #자외선
     main='자외선분포',
     xlab = '자외선',
     col = color.3)

hist(airquality$Wind,  #풍량
     main='풍량분포',breaks = 5,
     xlab = '풍량',
     col = color.4)
par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)



#아래르 확인
#carData에 TitanicSurvaival 데이터셋
#나이 결측값제거 하면 총데이터 1046개
#생존자와 사망자의 선실 (1st 1등실,2nd 2등실 ,3rd 3등실)별 차트

library(carData)
library(ggplot2)

str(TitanicSurvival)
t.new<-TitanicSurvival

t<-t.new[complete.cases(t.new),] #결측값제거 1046개
head(t)
str(t)
ggplot(t,aes(x=passengerClass,fill=survived))+
  geom_bar(position='stack')+
  ggtitle('타이타닉 클래스별 생존자')+
  theme(plot.title = element_text(size = 15,face = 'bold',
                                  hjust = 0.5),
                      legend.title = element_blank(),  #범례제목없앰
                      legend.position=c(0.1,0.8))+    #범례위치
  scale_fill_discrete(labels = c("사망자", "생존자"))
        