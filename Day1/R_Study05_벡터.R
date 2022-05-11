## 벡터 파이썬에 list와 동일

score<-c(68,95,83,76,90,80,85,91,82,70)
mean(score) #평균

score

x<-c(1,2,3)
x.1<-1:3
y<-c('a','b','c')
y
z<-c('true','false',F,T)
z

v<-c(1,2,3,4,5,'6') #문자가 하나라도있으면 문자로 바뀜
v

v.1<-c('7',8)
v.1


v1<-50:90
v1
v2<-c(1,2,3,10:20)
v2
v3<-seq(-1,100,3)
v3
##장점 시퀀스장점 라이브러리안씀
v4<-seq(0.1,1.0,0.1)
v4

v5<-rep(1,times=5)
v5

v6<-rep(1:5,times=3)
v6

v7<-rep(c(1,3,5),times=3)
v7

v8<-rep(seq(1,20,2),time=2)
v8

v9<-rep(c('a','b',3),each=4)
v9

#백터 이름 붙이기
absent<-c(8,2,0,4,1)
absent

names(absent)<-c('Mon','Tue','Wed','Thu','Fri')
absent

#R은 1부터시작
absent[1]
abesnt[2]
absent[5]
absent[6] 

#다른 정보도 있음
absent['Mon']
absent['Fri']

val.1<-10
val.1
val.1<-'10'
val.1
