##다른 강사님 마지막 실전데이터

install.packages('HSAUR')
library(HSAUR)
data('Forbes2000')
ds<-Forbes2000
ds[!complete.cases(ds),] #결측값 확인

str(ds)
head(ds)
View(ds)

##막대그래프 
table(ds$country)
tmp<-sort(table(ds$country),decreasing = T)
top.10.country <- tmp[1:10]
top.10.country  #상위 10개국

par(mar=c(8,4,4,2)) #그래프 여백 조정
barplot(top.10.country,
        main='기업수 상위 10개국',
        col=rainbow(10),   #레인보우
        las=2
        )
par(mar=c(5,4,4,2))

#업종별 기업분포
table(ds$category)
tmp<-sort(table(ds$category), decreasing = T)
top.10.category <- tmp[1:10]
top.10.category # 상위 10개 업종

par(mar=c(10,4,4,2)) 
barplot(top.10.category,
        main='기업수 상위 10개 업종',
        col='pink',
        las=2)
par(mar=c(5,4,4,2))


##업종별 기업자산 분포
tmp<-ds[ds$category %in% names(top.10.category),]   ## A %in% B  A안에서 B라는 조건을 만족하는 것
levels(tmp$category)
tmp$category<-factor(tmp$category)
levels(tmp$category)

par(mar=c(10,4,4,2))
boxplot(assets~category,data=tmp,
        ylimm=c(0,100),
        xlab=' ',
        las=2
        )
par(mar=c(5,4,4,2))


##기업가치 상위 10대 기업
tmp<-ds[order(ds$marketvalue,decreasing = T),]
tmp[1:10,c('name','country','category','marketvalue')]  #,c컬럼명이나옴

##한국 기업정보
korea<-subset(ds, country=='South Korea')
korea[,c('rank','name','category','marketvalue')]


##기업가치와 타변수 상관관계

tmp<-ds[,5:8]
tmp<-tmp[complete.cases(tmp),]       #결측치 제거
str(tmp)
plot(tmp,lower.panel=NULL)           #산점도
cor(tmp)                             



##
setwd('C:/STUDY/StudyR/Day8')
getwd()
files<-c('ds.2015.csv','ds.2016.csv','ds.2017.csv','ds.2018.csv','ds.2019.csv')

ds<-NULL
for (f in files) {
  tmp<-read.csv(f,header=T)
  ds<-rbind(ds,tmp)
  print(f)
}


str(ds)
head(ds)
unique(ds$loc) # 관측 장소
range(ds$mdate) # 측정 기

#열별 결측값 확인
for (i in 3:8) {
   cat(names(ds)[i], sum(is.na(ds[,i])), 
        sum(is.na(ds[,i]))/nrow(ds), '\n')
  }
ds <- ds[,-8] # PM25 열 제거
ds <- ds[complete.cases(ds),] # 결측값 포함 행 제거

##그룹정보 추가  
mdate <- as.character(ds$mdate) #문자열로 변환
head(mdate)
ds$year <- as.numeric(substr(mdate, 1,4)) #d연도 
ds$month <- as.numeric(substr(mdate, 5,6)) # 월
ds$hour <- as.numeric(substr(mdate, 9,10)) # 시간
unique(ds$loc) #열 확인
ds$locname <- NA # locname 열을 추가
ds$locname[ds$loc==111123] <- '서울' # 도시
ds$locname[ds$loc==336111] <- '목포' # 도시
ds$locname[ds$loc==632132] <- '강릉' # 도시
unique(ds$locname) 


##지역별 pM10 농도 분포
boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100)
)

#연도별 pm농도

library(ggplot2)
tmp.year <- aggregate(ds[,7], 
                      by=list(year=ds$year,loc=ds$locname), FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)
ggplot(tmp.year, aes(x=year,y=x, colour=loc, group=loc))+
  geom_line( )+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
 ylab('농도')

#월별 pm농도
tmp.month <- aggregate(ds[,7], 
                       by=list(month=ds$month,loc=ds$locname),
                       FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)
ggplot(tmp.month, aes(x=month,y=x, colour=loc, group=loc))+
  geom_line( )+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
 ylab('농도')

#시간별 pm농도
tmp.hour <- aggregate(ds[,7], 
                      by=list(hour=ds$hour,loc=ds$locname), FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)
ggplot(tmp.hour, aes(x=hour,y=x, colour=loc, group=loc))+
  geom_line( )+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('시간별 PM10 농도 변화')+
 ylab('농도')
 
#오염물질간 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])


##미세먼지 최고,최저

tmp.yml <- aggregate(ds[,7], 
                     by=list(year=ds$year,month=ds$month,
                             loc=ds$locname), FUN='mean')

# 가장 미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x)) #가장 큰 순번을 idx
tmp.yml[idx,]  #행을 보여주는것
# 가장 미세먼지가 적었던 달
idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]


