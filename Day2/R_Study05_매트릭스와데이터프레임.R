#매트릭스 만들기

z<-matrix(1:20,nrow = 4,ncol = 5)
z

z2<-matrix(1:20,nrow = 4,ncol = 5,byrow=T)
z2

z[1,3]
z[4,5]

z2
z2[3,1]

# x,y 같을것
x<-1:4
y<-5:8
z3<-matrix(1:20,nrow = 4, ncol = 5, byrow=T)
z3

m1<-cbind(x,y)
m1
m2<-rbind(x,y)
m2
m3<-rbind(m2,x)
m3
m3<-cbind(m2,x)
m4<-cbind(z,x)
m4

z
z[2,]
z[,3]
