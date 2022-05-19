##1. Oracle DB연동 
#encoring 필요 euc-kr
install.packages("RODBC")
library(RODBC)

##2.DB 연결정보
#3.ODBC (실행창에) 데이터원본(64비트)에 Scott_DSN 추가
conn1 = odbcConnect('Scott_DSN', uid='scott', pwd='tiger',
                    DBMSencoding='euc-kr',
                    believeNRows=F)
summary(conn1)

# 4.Run Query
res<-sqlQuery(conn1, 'SELECT * FROM dept')
str(res)

sqlQuery(conn1, 'SELECT * FROM emp')

sqlQuery(conn1, 'SELECT * FROM membertbl') ##영어가아닌 한글에러 멀티바이트 에러

# 5.Close
odbcClose(conn1) 
