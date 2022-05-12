#팩터와 리스트

bt<-c('A','B','B','O','AB','A')
bt
bt.new<-factor(bt)
bt.new
bt[5]
bt.new[7]
levels(bt.new)
as.integer(bt.new)
bt.new[7]<-'B'
as.integer(bt.new)
bt.new[8]<-'C'  # 리벨에 없어서 NA
bt.new


#리스트 ->파이썬에서 딕셔너리
h.list<-c('balling','tennis','ski')
person<-list(name='Tom',age=25,student=T,hobby=h.list)
person

person[[1]]
person[['name']]
person$hobby
person$age
person$student
person$hobby[1]

##카페 매출 분석2
cafe <- list(espresso = c(4, 5, 3, 6, 5, 4, 7),
             americano = c(63, 68, 64, 68, 72, 89, 94),
             latte = c(61, 70, 59, 71, 71, 92, 88),
             price = c(2.0, 2.5, 3.0),
             menu = c('espresso','americano','latte'))

cafe
cafe$menu <- factor(cafe$menu)

names(cafe$price)<-cafe$menu

sale.espresso <- cafe$price['espresso'] * cafe$espresso
sale.americano <- cafe$price['americano'] * cafe$americano
sale.latte <- cafe$price['latte'] * cafe$latteo


sale.day <- sale.espresso + sale.americano + sale.latte # 요일별 매출액
names(sale.day) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
sum(sale.day) # 총 매출액
sale.mean <- mean(sale.day) # 평균 매출액
names(sale.day[sale.day >= sale.mean] ) # 평균 매출액 이상인 요일 추출

#월별감전사고통계
accident<-c(31,26,42,47,50,54,70,66,43,32,32,22)
accident
names(accident)<-c('M1','M2','M3','M4','M5','M6',
                   'M7','M8','M9','M10','M11','M12')
accident

mon<-1:12
mon.name<-paste('M',mon,sep='')
mon.name
names(accident)<-mon.name
sum(accident)
max(accident)
min(accident)
accident*0.9 #사고율 10%감소하면 사고수예측
accident[accident>=50]
mean(accident)
accident[accident>= mean(accident)]

