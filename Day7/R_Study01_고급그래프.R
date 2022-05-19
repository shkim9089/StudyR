#고급 그래프
# treemap
install.packages('treemap')
library(treemap)

data("GNI2014")
str(GNI2014)
GNI2014$country
head(GNI2014)

treemap(GNI2014,
        index = c('continent','iso3'),
        vSize ='population',vColor='GNI',
        title = '대륙간 인구수',type = 'value',
        ##bg.labels = 'yellow', 사용불가
        na.rm =T,)


##LAB 미국 주요도시 통계데이터
library(carData)
head(Ericksen)
str(Ericksen)

ds<-subset(Ericksen,city=='state')
ds

ds$stname<-rownames(ds)
treemap(ds,
        index = c('stname'),
        vSize = 'poverty',
        vColor = 'crime',
        type = 'value',
        title = '미국 범죄 도시 찾기')


##레이더차트
install.packages('fmsb')
library(fmsb)
score <- c(80,60,95,85,40,60)
max.score<-rep(100,6)
min.score<-rep(0,6)
ds <- rbind(max.score,min.score, score)
ds<-data.frame(ds)
class(ds)
ds
colnames(ds)<-c('국어','영어','수학','물리','음악','체육')
ds
radarchart(ds)

##매개변수(옵션)
#R에서는 RGB가 RRGGBB00임 #ffffff
radarchart(ds,  # 데이터프레임
           pcol = 'darkgreen',   # 다각형 선의 색
           pfcol = rgb(0.3,0.2,0.7,0.5),  # 다각형 내부 색
           plwd = 3,                      # 다각형 선의 두께
           cglcol='grey',                 #거미줄의 색
           cglty=1,                       # 거미줄의 타입
           cglwd = 0.8,                   # 거미줄의 두께
           axistype = 1,                  # 축의 레이블 타입
           seg=4,                         # 축의 눈금 분할
           axislabcol='grey',             # 축의 레이블 색
           caxislabels = seq(0,100,25)    # 축의 레이블 값
           )




##LAB 종교유무조사데이터
library(carData)
head(WVS)
str(WVS)

pop<-table(WVS$country)
pop
tmp<-subset(WVS,religion=='yes')
length(tmp$religion)

rel<-table(tmp$country)
rel

stat<-rel/pop
stat

max.score<-rep(1,4)
min.score<-rep(0,4)
ds<-rbind(max.score,min.score,stat)
ds

ds<-data.frame(ds)  #e데이터프레임
ds


radarchart(ds,
           pcol = 'red4',
           pfcol ='#337F7F7F',
           plwd = 3,
           cglcol = 'gray',
           cglty = 1,
           cglwd = 0.5,
           axistype = 1,
           seg = 3,
           caxislabels = seq(0,1,0.3),
           )



##ggplot

library(ggplot2)

month<-c(1:6)
rain<-c(55,50,45,50,60,70)
df<-data.frame(month,rain)
df

ggplot(df,aes(x=month,y=rain)) +
  geom_bar(stat = 'identity',
           width =0.7, fill = 'skyblue',
           )


##막대그래프 가로
ggplot(df,aes(x=month,y=rain)) +
  geom_bar(stat = 'identity',
           width =0.7, fill = 'skyblue',
  ) +
  ggtitle("월별 강수량(1~6월") +
  labs(x='월',y='강수량') +
  coord_flip( ) + # 그래프를 가로 방향으로 출력
   theme(plot.title = element_text(size = 25,face = 'italic',
                                   color = 'steelblue',hjust = 0.5))


##히스토그램
ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)  #binwidth breaaks 같은함수

ggplot(iris,aes(x=Sepal.Width,fill=Species,color=Species))+
  geom_histogram(positon='dodge') +   #각각으로 !
  ggtitle('붓꽃 품종별 꽃받침 넓이 히스토그램램')+
  theme(legend.position = 'bottom') 

ggplot(data = iris,aes(x=Petal.Length, y=Petal.Width,color=Species))+
  geom_point(size=3)+
  ggtitle('봇꽃 품종별 꽃잎 산점도')+
  theme(plot.title = element_text(size = 25,face = 'bold',
                                  color = 'steelblue',hjust = 0.5))

##선그래프

year <- 1937:1960
cnt <- as.vector(airmiles)
class(airmiles)

df <- data.frame(year,cnt) # 데이터 준비
head(df)
ggplot(data=df, aes(x=year,y=cnt)) + # 선그래프 작성
  geom_line(col='red',stat = 'identity')


#lab

library(ggplot2)
df<-aggregate(airquality[,'Temp'],
              by=list(month=airquality$Month),FUN=mean)
colnames(df)<-c('month','temp')

ggplot(df,aes(x=month,y=temp))+
  geom_bar(stat='identity',
           width=0.6,fill='darkgreen')+
  ggtitle('5개월 평균 기온(화씨)')


#산점도
df<-airquality[complete.cases(airquality),]
df  
ggplot(data = df, aes(x=Temp,y=Ozone,color='orange'))+
  geom_point(size=2)
cor(df$Temp,df$Ozone)


#선그래프
df.7<-subset(df,Month==7)
df.7
ggplot(data=df.7, aes(x=Day,y=Ozone)) +
  geom_line(col='red')+
  geom_point(col='orange',size=3)+
  ggtitle('일별 오존지수')+
  theme(plot.title = element_text(size = 16,face = 'bold',
                                color = 'black',hjust = 0.5))+
  labs(x= '일',y='오존지수')

##실전분석
str(UN98)
data("UN98")
df <- UN98[, c('region', 'tfr')]
df <- df[complete.cases(df),]
df <- aggregate(df[,'tfr'], by=list(region=df$region),FUN=mean)

ggplot(df, aes(x='region',y='x'))+
  geom_bar(stat = 'identity',
           width = 0.8,
           fill=rainbow(5),
           col ='#333333')+
ggtitle('대륙별 평균 여성출산율')+
  labs(x='대륙',y='평균출산율')


##나무
library(treemap) # treemap 패키지 불러오기
df.tm <- UN98[,c('region','lifeFemale','illiteracyFemale')]
df.tm <- df.tm[complete.cases(df),] # 결측값 제거
df.tm$country <- rownames(df.tm) # 국가명을 열로 추가
treemap(df.tm,
        index=c('region','country'), # 계층구조 설정(대륙-국가)
        vSize='lifeFemale', # 타일의 크기
        vColor='illiteracyFemale', # 타일의 색
        type='value', # 타일 컬러링 방법
        )     #나무지도


##산점도
df.edu<-UN98[,c('region','educationMale','educationFemale')]
df.edu
df.edu<-df.edu[complete.cases(df.edu),]

ggplot(data=df.edu, aes(x=educationMale,y=educationFemale,
       color = region))+
  geom_point(size=2)+
  ggtitle('대륙별 남성,여성 교육수준')+
  theme(plot.title = element_text(size=25,face='bold',
                                  colour = 'steelblue'))+
  labs(x='교육수준(남자)', y='교육수준(여자')
cor(df.edu$educationMale,df.edu$educationFemale)

plot(UN98)
