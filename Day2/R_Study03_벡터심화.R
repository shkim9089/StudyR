##벡터 산술연산

d<-c(1,4,3,7,8)
2*d
d-5
3*d+4


x<-c(1,2,3,4)
y<-c(5,6,7,8)
x+y
x*y
z<-x+y
z

#t산술연산으로 간다하게 결과
result<-deposit *(1+rate/100)^period
result
result[1]

#벡터간 길이가 같아야함 결측값때문,문자와 숫자는 더해지지않음


#벡터와 벡터 연산
m<-c(x,y)
m
n<-c(y,x)
n
p<-c(x,y,90,100)
p

#연산 더하기,빼기 안됨
Q1<-c(1,2,3)
Q1
Q2<-c('john','jane','tom')
Q2
Q3<-c(Q1,Q2)
Q3
Q4<-c(Q1,Q2,T,F)
Q4



#백터 사용 함수
datas<-1:10
sum(datas)
length(datas)
mean(datas)
max(datas)
min(datas)
sort(datas,decreasing =T)
var(datas)
sd(datas)
range(datas)


#논리 연산자
G<-1:9
G<=5
G<5
G[G>5]
sum(G[G>5])
condi<- G>4 & G<8
condi
G[condi]

##R 카페의 매출액 분석
espresso<-c(4,5,3,6,5,4,7)
americano<-c(63,68,64,58,72,89,94)
latte<-c(61,70,59,71,71,92,88)

price<-c(2000,2500,3000)
names(price)<-c('esp','ame','lat')
price

sale.espresso<-price['esp']*espresso
sale.espresso

sale.americano<-2500*americano
sale.americano
sale.latte<-3000*latte
sale.latte

sales.day<-sale.espresso+sale.americano+sale.latte
names(sales.day)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
sales.day


sum(sales.day)
cat('총매출액',sum(sales.day),'원')

sales.mean<-mean(sales.day)
sales.mean
cat('평균출액은',sales.mean,'입니다')

result<-names(sales.day[sales.day >= sales.mean])

cat('평균매출액보다 매출액이 높은 요일은',result,'입니다')
