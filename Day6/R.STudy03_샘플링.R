##샘플링
x<-1:100
y<-sample(x,size = 5,replace = F) #리플레이스 비복원
y


idx<-sample(1:nrow(iris),size = 15, replace = F)
idx
iris.15<-iris[idx,]
dim(iris.15)
head(iris.15)

sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
sample(1:20, size=5)
# set.seed( ) 함수의 효과는 샘플링을 한 번 하면 사라짐


#조합

combn(1:5,3)  #1~5까지 임의로 3개 조합 

combn(1:10,2)

x<-c('red','green','blue','black','white')
com<-combn(x,2)
com


for(i in 1:ncol(com)) {
  cat(com[,i],'\n')
}

