## 다중 그래프

par(mfrow=c(2,2), mar=c(3,3,4,2))

hist(iris$Sepal.Length,
     main='붓꽃 꽃받침길이',
     col = 'orange')   #히스토그램

barplot(table(mtcars$cyl),
        main = '자동차 실린더',
        col = c('red','green','blue'))

barplot(table(mtcars$gear),
        main = '자동차 기어',
        col=rainbow(3) , horiz = T)

pie(table(mtcars$cyl), # 그래프 4
    main='자동차 실린더',
    col=topo.colors(3), # to 팔레트 사용
    radius=1)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)



##LAB

install.packages('carData')
library(carData)
ds<- Chile
colors <- rainbow(20)
colors

#정책지지도 그래프
par(mfrow = c(2,3), mar=c(3,3,4,2))
ds.region<-table(ds$region) # 2700 취합 
ds.gender<- table(ds$sex)
ds.edu<- table(ds$education)
barplot(ds.region, main='지역별 분포',col = colors[1:5])
barplot(ds.gender, main='성별 분포',col = colors[5:6])
barplot(ds.edu, main='교육수준별 분포',col = colors[7:9])


hist(ds$age,breaks = 6,main = '연령별',xlab = 'ages',col = colors[10:15])

hist(ds$income, breaks = 4,main =' 수입별',col = colors[15:18])

hist(ds$statusquo, breaks = 9, main = '지지도',col = colors[11:19])

par(mfrow=c(1,1))



##종업원 팁분석
library(reshape2)
str(tips)

#색상
color.6<-rep('#a8dadc',6)
color.6[2]<-'#1d3557'
color.4<-rep('#a8dadc',4)
color.4[2]<-'#1d3557'
color.4[3]<-'#457b9d'
color.2<-c('#a8dadc','#1d3557')

par(mfrow = c(2,2))
barplot(table(tips$sex),main = '성별',col=color.2)
barplot(table(tips$day),main = '요일별',col=color.4)
barplot(table(tips$time),main = '시간대별',col =c(color.2[2],color.2[1]))
barplot(table(tips$size),main = '인원수별',col=color.6)
par(mfrow = c(1,1))


tips.new<-tips

tips.new$perHead<-tips.new$total_bill / tips.new$size

color.5<-rep('#a8dadc',5)
color.5[2]<-'#1d3557'

par(mfrow = c(1,3), mar =c(5,4,4,2)+.1) #바닥5,왼쪽,4,위4,오, 전부 .1씩 더함
hist(tips.new$perHead, main = '1인당 주문 금액', breaks = 5, 
     xlab = '단위:달러',col=color.5)
hist(tips.new[tips.new$time == 'Lunch', 'perHead'],
     main = '1인당 주문 금액(런치)', breaks = 4, xlab = '단위:달러',col=color.5)
hist(tips.new[tips.new$time == 'Dinner', 'perHead'],
     main = '1인당 주문 금액(디너)', breaks = 4, xlab = '단위:달러',col=color.5)
par(mfrow = c(1,1))



## 주문금액 대비 팁의비율
tips.new$percent<-tips.new$tip / tips.new$total_bill *100
tips.new$percent
par(mfrow = c(1,2))
res.lunch <- hist(tips.new[tips.new$time == 'Lunch', 'percent'],
                  main = '주문 금액 대비 팁의 비율(런치)',
                  xlab = 'percent(%)',
                  breaks = 5)
res.dinner <- hist(tips.new[tips.new$time == 'Dinner', 'percent'],
                   main = '주문. 금액 대비 팁의 비율(디너)',
                   xlab = 'percent(%)',
                   breaks = 10)
par(mfrow=c(1,1))


res.lunch
res.dinner

res.lunch$counts
res.dinner$counts
#런치는 5개니까 c0을해서 추가 
res <- rbind(lunch = c(0, res.lunch$counts), 
             dinner = res.dinner$counts[1:6])
#매트릭스만듦
res

colnames(res) <- res.dinner$breaks[2:7]

str(res)


barplot(res,main = '식시간에 따른 팁비율 분포',
        col=color.2, legend.text = c('Lunch','Dinner'), las=2)


