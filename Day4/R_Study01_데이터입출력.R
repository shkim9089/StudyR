##데이터 입출력
setwd('C:/STUDY/StudyR/Day4') #working 디렉토리 지정 
print('hello R!')

# 실행결과물 저장
sink('result.txt',append = F)  #append->이전 문서 다음 뒤 , 계속 붙이기 
a<-10
b<-20
cat('a+b', a+b, '\n')
a+b
print('hey')
sink()

sink('result.txt',append = T)

iris

tail(iris)

sink() #연 파일을 반드시 닫을것
print('test')



##txt 파일 읽기/ 구분자는 탭
#setwd로 해놔서 경로가 ./
air.txt <- read.table('./airquality.txt', header=T, sep=' ') 
air.txt
#csv파일도 읽기가능, 구분자 쉼표 ,
air.csv<- read.table('../day3/airquality.csv', header = T, sep=',')
air.csv

##체질량 지수 계산2

library(svDialogs)
height <- dlgInput('키 입력(cm)')$nes
weight <- dlgInput('몸무게 입력(kg)')$nes
height <- as.numeric(height)
weight <- as.numeric(weight)
height.unit <- height /100
bmi <- weight/(height.unit^2)

sink('bmi.txt',append = F)
cat('height','weight',bmi)
cat(height.unit*100,weight,bmi)
cat('\n')
sink()


result<-read.table('./bmi.txt', header = T, sep = ' ')
result

names(result) <-c('키','몸무게','체질량지수')
result

write.table(result,'./bmi2.txt',row.names=F)



##엑셀패키지
install.packages('readxl')
library(readxl)
#엑셀 읽기용
air.xlsx<-read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages('openxlsx')
library(openxlsx)
#엑셀 쓰기용 
write.xlsx(result,'bmi_result.xlsx',rowNames=F)





##실전분석 차정보 조회

library(svDialogs)
library(readxl)
library(openxlsx)

carprice.new<- read.csv('./carprice.csv',header = T)
carprice.new
str(carprice.new)

levels(carprice.new[,1])

input.type<-dlgInput('차량 타입 입력(Compact,Large,Midsize,Midsize,Small,Sporty,Van')$nes
input.city<-dlgInput('최소 시내연비 입력')$nes
input.city<-as.numeric(input.city)

result<-subset(carprice.new, Type == input.type & MPG.city <= input.city)
print(result)


write.xlsx(result,'./van_result.xlsx', rowNames = F)


## 오라클 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

## DB 연결 설정
jdbcdriver<-JDBC(driverclass = 'oracle.jdbc.oracledriver',
                  classPath='./Day4/')