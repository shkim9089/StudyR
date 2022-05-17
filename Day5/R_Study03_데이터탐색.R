## 데이터탐색
#단일범주

library(carData)
str(TitanicSurvival)

tData2<- TitanicSurvival

#데이터 분석
room.class<-TitanicSurvival$passengerClass
str(room.class)

tbl<-table(room.class)
sum(tbl)

# (3) 막대그래프 작성
barplot(tbl, main='선실별 탑승객',
        xlab='선실 등급',
        ylab='탑승객수',
        col=c('blue','green','yellow')
        )
 
#(4) 원그래프 작성
tbl/sum(tbl) # 선실별 탑승객 비율
par(mar=c(1,1,4,1))
pie3D(tbl, main='선실별 탑승객', explode = 0.1,
      col=c('blue','green','yellow'))
par(mar=c(5.1,4.1,4.1,2.1)
)

##단일변수 수치형
str(state.x77)
grad<-state.x77[,'HS Grad']
str(grad)

summary(grad)
var(grad)
sd(grad)
median(grad)
table(grad)

hist(grad,main='주별 졸업률', xlab = '졸업률',ylab='주의 개수',
     col = 'orange')

boxplot(grad, main='주별 졸업률',col = 'green')

idx<-which(grad==min(grad))
grad[idx]

idx<-which(grad==max(grad))
grad[idx]

idx<-which(grad<mean(grad))
grad[idx]


##1974년부터~1977년까지 영국 폐질환 사망자
getwd()
ds<-read.csv('./Day5/fcsv.csv', header = T,
             row.names = 'year')
ds

my.col<-c('orange','blue','red','green','purple','darkgray')
my.lty<-1:6

par(mfrow=c(1.0))
plot(1:12,                       #x축데이터
     ds[1,],                     #Y축데이터
     main = '월별 사망자 추이',  #그래프 제목
     type = 'b',                 # 그래프 종류
     lty= my.lty[1],             # 선의 종류
     lwd = 5,                    # 라인 두께께
     xlab = '월',                # x축 레이블
     ylab = '사망자수',          # Y축 레이블
     ylim = c(300,1200),         # Y축 범위 
     col=my.col[1],              # 선 색
     las = 1,                    # Y축 가로쓰기기
     )

for (i in 2:6) {
  lines(1:12,  # x data)
        ds[i,],
        type='b',
        lty=my.lty[i],
        lwd=2,
        col=my.col[i],
  )
}


legend(x='topright',
       lty = my.lty,
       lwd = 2,
       col = my.col,
       legend = rownames(ds),
       inset = c(0,0))


##LAB 미국 자동차 판매가격
library(DAAG)
str(carprice)

carprice$price
range(carprice$Price)
summary(carprice$Price)

hist(carprice$Price,main = '자동차 가격 뷴포',
     xlab = '가격대(1,000$)',ylab = '빈도수',col = rainbow(8))

tbl<-table(carprice$Type)
tbl

barplot(tbl,main = '차종별 빈도수', xlab = '차종',ylab = '빈도수',
        col = rainbow(length(tbl)))

summary(tbl)

idx<-which(carprice$Price == max(carprice$Price)) 
carprice[idx,c('Type','Price')]





##다중변수탐색
pressure
str(pressure)

plot(pressure$temperature,   #x축
     pressure$pressure,      #y축
     main = '온도와 기압',   #그래프 제목
     xlab = '온도 섭씨',     #x축 제목 
     ylab = '기압',          #y축 제목목
     )
