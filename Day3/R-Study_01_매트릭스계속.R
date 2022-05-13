##매트릭스 계속

z<-matrix(1:20,nrow = 4,ncol = 5,byrow = T)
z

x <- c(20, 25, 30, 35)
x

m1<-cbind(z,x)  # 열기준 결합방식
m1

y<-c(36:41)
y
m2<-rbind(m1,y) # 행기준 결합방식
m2

#값추출
m2[1,3]
m2[1,6]
m2[1,7]

z
z[1,6]
z[1,5]
z[4,5]
z[,5]

z[2,1:3] #2행에 1~3열까지
z[2,c(1,2,4)] #2행에 1,2,4열자리
z[1:2,] #1부터2행까지 모든 행
z[,2:4] #2부터4열까지 모든열
z[1:2,c(1,2)]
z


#매트릭스 이름붙이기
score<-matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),nrow=4)
score
rownames(score)<-c('John','Tom','Mark','Jane')
colnames(score)<-c('English','Math','Science')
score

score['John','Math']
score['John',]
score[,'Math']
rownames(score)
colnames(score)[2]


##LAB 햄버거 영양성분제공

buger<-matrix(c(514,917,11,533,853,13,566,888,10),nrow=3,byrow = T)
buger
rownames(buger)<-c('Mcdonald','lotteria','bugerking')
colnames(buger)<-c('kcal','na','fat')
buger
buger["Mcdonald",'na']
buger['Mcdonald',]
buger[,'kcal']


#데이터프라임
#숫자형+범주형을 같이 나타낼수 있는게 데이터프레임

physicals<-matrix(c(168.4,169.5,62.4,65.3,'M','F'),nrow= 2)
physicals

city<-c('seoul','tokyo','washington')
rank<-c(1,3,2)
city.info<-data.frame(city,rank)
city.info


#아이리스 데이터셋
iris
head(iris)
tail(iris)
str(iris)  #어떤 타입인지 나타냄 
str(z)
str(buger)
str(city)

iris[140,]
iris[,5]
levels(iris[,5])
iris[,c("Sepal.Length","Species")] 
head(iris[,c("Sepal.Length","Species")])


#LAB2 햄버거 2
kcal <- c(514, 533, 566)
na <- c(917, 853, 888)
fat <- c(11, 13, 10)
menu <- c('새우버거', '불고기버거', '치킨버거거')

burger2<-data.frame(kcal,na,fat,menu)
burger2
rownames(burger2)<-c('M','L','B')
burger2

burger2[,'na']
burger2['M','menu']

dim(iris) #행수,열수
dim(buger)
nrow(iris)
colnames(burger2)
rownames(burger2)
head(iris,n=2)
tail(iris,n=2)
str(iris)
iris$Sepal.Length
table(iris[,"Species"])
iris[149,1]

#d열별,헹별 합계,평균
colSums(iris[,-5]) #품종때문에 안됨 
colMeans(iris[,-5])
rowSums(iris[,-5])
rowMeans(iris[,-5])
#최소 두개이상의 열이 선택되어야함 행도 마찬가지

z<-matrix(c(1:20),nrow = 4,ncol = 5)
z
t(z)

#데이터프레임을 바꾸면 매트릭스화
burger2
t(burger2)

iris.subset1<-subset(iris, Species=='setosa')
iris.subset1

iris.subset2<-subset(iris, Sepal.Length>5.0 & Sepal.Width>4.0)
iris.subset2
str(iris.subset2)


a<-matrix(1:20,4,5)
a
b<-matrix(21:40,4,5)
b
a+b

a<-a*2
a


class(iris)
str(iris)
class(z)
str(z)
is.matrix(iris) #데이터 프레임 숫자+범주,, 데이터 자체 모음 데이터셋
is.data.frame(iris)



##LAB3

trees
class(trees)
str(trees)

Girth.mean<-mean(trees[,1])
Girth.mean
girth.mean <- mean(trees$Girth)
girth.mean

candidate <- subset(trees, Girth >= girth.mean & Height > 80 & 
                      Volume > 50)
candidate
nrow(candidate)

#종업원 팁계산
install.packages("reshape2")

library(reshape2)

tips
is.matrix(tips)
is.data.frame(tips)
class(tips)
str(tips)

levels(tips$day)

table(tips$day)
class(table(tips$day))

dinner<-subset(tips, time=='Dinner')
dinner
lunch<-subset(tips, time=='Lunch')
lunch
table(dinner$day)
table(lunch$day)

dinner.data<-dinner[c('total_bill','tip','size')]
lunch.data<-lunch[c('total_bill','tip','size')]
colSums(dinner.data)                  
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)


tips.rate<-tips$tip/tips$total_bill
mean(tips.rate)*100
