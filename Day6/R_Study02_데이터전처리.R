##데이터 전처리

z<-c(1,2,3,NA,5,NA,7,8,9,10)
summary(z)
sum(z)
mean(z)
min(z)
is.na(z) #na 여부
median(z)
sum(is.na(z))
sum(z, na.rm = T) #NA 제거하고 합


#결측값 제거 또는 교체
z1<-c(1,2,3,NA,5,NA,7)
z2<-c(5,8,1,NA,3,NA,7)
z1[is.na(z1)]<-0
z1
z3<-as.vector(na.omit(z2))  #omit 생략이라는 뜻  z2에서 na생략한 새로운 벡터
z4<-z1
z4[is.na(z4)]<-ceiling(sum(z4, na.rn= T)/length((z4)))

summary(z4)


##이차원 결측값
iris


iris.na<-iris
iris.na[1,2]<-NA
iris.na[1,3]<-NA
iris.na[2,3]<-NA
iris.na[3,4]<-NA
head(iris.na)

##결측값 확인 방법 열별
for (i in 1:ncol(iris.na)) {
  this.na<-is.na(iris.na[,i]) # iris.na에서 모든열에서 i값
  cat(colnames(iris.na)[i],'\t',sum(this.na),'\n')
}


#apply 함수
col_na<-function(y) {
  return(sum(is.na(y)))
}
na_count<-apply(iris.na, 2, FUN=col_na)
na_count

##결측값 확인 행별
rowSums(is.na(iris.na))
sum(rowSums(is.na(iris.na))>0)  #결측값 포함 행의개수
sum(is.na(iris.na)) #결측값은 4개


##매트릭 결측값 제외하고 데이터셋만들기

head(iris.na)
iris.na[!complete.cases(iris.na),] #na가 없는 걸 표시
iris.na[complete.cases(iris.na)==F,]

iris.comp<-iris.na[complete.cases(iris.na),]


##LAB 전세계 통계 데이터 분석하기
library(carData)
str(UN)
levels(UN$region)
levels(UN$group)

apply(UN, 2, FUN = col_na)

mean(UN$lifeExpF,na.rm=T)
length(UN$region)

tmp<-UN[,c('pctUrban','infantMortality')]
tmp<-tmp[complete.cases(tmp),]
length(tmp$pctUrban)   #결측값 삭제
colMeans(tmp)     #모든 컬럼 평균


tmp.asia<-subset(UN,region=='Asia')
mean(tmp.asia$fertility,na.rm = T) ##결측값이 없으면 na 안해도됨



##정렬
v1<-c(1,7,6,8,4,2,3,9)
sort(v1,decreasing = F)
name<-c('정대일','강재구','신현석','홍길동')
sort(name,decreasing = T)

idx<-order(name,decreasing = T)
idx
name[idx[1]]



a<-c(1,2,3,4,5)
b<-c(11,24,55,23,9)
z<-rbind(a,b)
str(z)
colnames(z)<-c('C1','C2','C3','C4','C5')
z[,1]

##데이터프레임 정렬
iris
sort(iris$Sepal.Length)

sl.order<-order(iris$Sepal.Length)  #자리번호 order
iris[sl.order,]
iris.new<-iris[sl.order,]
iris.new<-iris[order(iris$Species, decreasing=T, iris$Petal.Length),]


##LAB 교통사고 데이터
library(carData)
str(Highway1)              

levels(Highway1$htype)

Highway1[order(Highway1$rate,decreasing = T),]
tmp<-Highway1[order(Highway1$len, decreasing=T),'len']
tmp<-Highway1[sort(Highway1$len,decreasing = T),]

sum(tmp[1:10])
tmp <- Highway1[order(Highway1$adt),c('adt','rate')]
tmp
tmp[1:10,]

tmp<-highway1[order(Highway1$slim),decreasing=T,
       c('len','adt','rate')]
          tmp
         tmp[1:5,]

    