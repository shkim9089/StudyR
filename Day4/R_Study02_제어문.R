##제어문
# if 문

job.type<-'A'

#= 는 쓸수없음
if (job.type == 'B') {
  bonus <- 200
} else {
  bonus <- 100
}
print(bonus)



a<-10 
b<-20

if (a>5 & b>5){
  print(a+b)
}
if (a>5 | b>30){
  print(a*b)
}


if (a>b) {
  c <-a
} else {
  c<-b
}
print(c)

c<-ifelse(a>b, a,b)
print(c)


## 반복문
for (i in 1:5){
  print(1)
}
for (i in 1:5){
  cat(i,'')
}
cat('\n')


for(y in 1:9) {
  cat('2 *', y,'=', 2*y,'\n')
}

#구구단 파이썬과 비교
for(x in 1:9) {
  for(y in 1:9) {
    cat(x,'x',y,'=',x*y,'')
  }
  cat('\n')
}

for ( i in 1:20) {
  if (i %% 2 ==0) {
    cat(i,'')
  }
}

## iris 꽃잎 크기 분류
norow <- nrow(iris) # iris의 행의 수
mylabel <- c() # 비어있는 벡터 선언
for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) # 꽃잎의 길이에 따라
    mylabel[i] <- "L"
  } else if (iris$Petal.Length[i] >= 5.1){
  mylabel[i] <- "H"
  } else {
    mylabel[i] <- "M"
  }
print(mylabel) 

print(mylabel) # 레이블 출력

newds <- data.frame('./Day4/iris$Petal.Length', rowNames = F) 
head(newds)



#while 문
sum <- 0
i <- 1
while(i <=100) {
  sum <- sum + i # sum에 i 값을 누적
  i <- i + 1 # i 값을 1 증가시킴
}
print(sum)



##사용자정의함수

mymax<-function(x,y){
  num.max <-x
  if (y>x){
    num.max<-y
  }
  return(num.max)
}
max(1,2)
mymax(1,3)


mydiv<-function(x,y=2){
  result <- x/y
  return(result)
}
mydiv(4,3)
mydiv(2)


myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  
  return(list(sum=val.sum, mul=val.mul)) 
}
result <- myfunc(5,8)

result$sum
result$mul

##내장함수 apply
apply(iris[1:4],2, max)

