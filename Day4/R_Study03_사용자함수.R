##외부파일함수설정
getwd()
setwd('../Day4')
getwd()
#함수파일 호출
source('myfunc.R')

result<-mydiv(109,6)
result


## 자격증 합격여부
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1, sub2, sub3)
score

result<-determine(score)
source('Determine.R')
result<-determine(score)
result


##데이터 조건에 맞는 데이터 위치 리턴 함수
score.two<-c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
score.two

which(score.two==69) # 성적이 69인 학생은 몇 번째에 있나?
which(score.two>=85) # 성적이 85 이상인 학생은 몇 번째에 있나?
max(score.two) # 최고 점수는 몇 점인가?
which.max(score.two) # 최고 점수는 몇 번째에 있나?
min(score.two) # 최저 점수는 몇 점인가?
which.min(score.two) # 최저 점수는 몇 번째에 있나?


idx <- which(score.two<=60) # 성적이 60 이하인 값들의 인덱스
score.two[idx] <- 61 # 성적이 60 이하인 값들은 61점으로 성적 상향조정
score.two # 상향조정된 성적 확인
idx <- which(score.two>=80) # 성적이 80 이상인 값들의 인덱스
score.high <- score.two[idx] # 성적이 80 이상인 값들 순번 추출하여 저장
score.high # score.high의 내용 확인


##iris 꽃잎의 길이가 5.0잉상인건
idx<-which(iris$Petal.Length>5.0)
idx
iris.big<-iris[idx,]
iris.big

subset(iris,iris$Petal.Length>5.0)



#언어발달 상황진단 프로그램

install.packages('Stat2Data')
library(Stat2Data)
data("ChildSpeaks")
str(ChildSpeaks)

idx <- which(ChildSpeaks$Age < 9)
ChildSpeaks[idx, 'm1'] <- 5
idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 15 )
ChildSpeaks[idx, 'm1'] <- 4
idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21 )
ChildSpeaks[idx, 'm1'] <- 3
idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27 )
ChildSpeaks[idx, 'm1'] <- 2
idx <- which(ChildSpeaks$Age >= 27 )
ChildSpeaks[idx, 'm1'] <- 1

#언어이해력점수 등급환산
idx<-which(ChildSpeaks$Gesell<70)
idx
ChildSpeaks[idx,'m2']<-1
idx<-which(ChildSpeaks$Gesell>=70 & ChildSpeaks$Gesell <90)
idx
ChildSpeaks[idx,'m2']<-2
idx<-which(ChildSpeaks$Gesell>=90 & ChildSpeaks$Gesell <110)
idx
ChildSpeaks[idx,'m2']<-3
idx<-which(ChildSpeaks$Gesell>=110 & ChildSpeaks$Gesell <130)
idx
ChildSpeaks[idx,'m2']<-4
idx<-which(ChildSpeaks$Gesell>=130 )
idx
ChildSpeaks[idx,'m2']<-5


ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2
idx<-which(ChildSpeaks$total<3)
ChildSpeaks[idx,'result']<-'매우 늦음'
ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2
idx<-which(ChildSpeaks$total>=3 & ChildSpeaks$total <5)
ChildSpeaks[idx,'result']<-'늦음'
ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2
idx<-which(ChildSpeaks$total>=5 & ChildSpeaks$total <7)
ChildSpeaks[idx,'result']<-'보통'
idx<-which(ChildSpeaks$total>=7 & ChildSpeaks$total <9)
ChildSpeaks[idx,'result']<-'빠름'
idx<-which(ChildSpeaks$total>=9)
ChildSpeaks[idx,'result']<-'매우 뺴름'

ChildSpeaks
ChildSpeaks[which.min(ChildSpeaks$total),]