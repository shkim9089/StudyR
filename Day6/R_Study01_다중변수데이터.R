##다중변수 데이터
head(cars)

#산점도 작성
plot(cars$speed,
     cars$dist,
     main = '자동차 속도와 제동거리',
     xlab = '속도',ylab = '제동거리',
     )

cor(cars$speed,cars$dist) # 속도와 제동거리 상관관계

st<-data.frame(state.x77)
head(st)

plot(st)

cor(st$Life.Exp,st$Murder)
cor(st$Illiteracy,st$Murder)
cor(st$Area,st$Frost)



##LAB 경제지표 데이터분석

str(longley)

df<-longley[,c('GNP','Unemployed','Armed.Forces',
               'Population','Employed')]
df
plot(df)
cor(df)

getwd()
load('./result_sales_dt.RData')
#DATA 저장
save(result_sales_dt,file='./result_dt.RData')


##LAB 주택담보대출
install.packages('Ecdat')
library(Ecdat)
str(Hdma)

tbl<-table(Hdma$deny)
tbl2<-tbl/sum(tbl)

names(tbl)<-c('승인','거절')
tbl
names(tbl2)<-c('승인','거절')

barplot(tbl, main = '주택담보대출 승인/거절 건수',
        col = c('green','red'),
        ylab = '건수',las=1, ylim = c(0,2500))

barplot(tbl2, main = '주택담보대출 승인/거절 비율',
        col = c('green','red'),
        ylab = '비율',las=1, ylim = c(0,1))

hist(Hdma$lvr, main='LTV',
    col=rainbow(3),ylim = c(0,1200))

##수입대비 보증금 비율(dir), 수입대비 주택유지비용 비율(hir) 
##고객 신용등급(ccs), 대출 신용등급(mcs) 

df<-Hdma[,c('dir','hir','ccs','mcs')]
point.col<-c('green','red')  #승인,거절 알파벳순
plot(df,col=point.col[Hdma$deny])

cor(df)
