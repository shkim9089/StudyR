#소금 50g과 물 100g을 섞었을 때 소금물의 농도(%) 

salt <- 50
water <- 100
mix <- salt / (water+salt) *100
cat("소금=",salt,'g','물',water,'ml','의 소금물의 농도는',mix,'%','입니다')



absent<-c(8,2,0,4,1)
F<-absent
names(absent)<-c('a','b','c','d','e')
names(absent)

 
sale<-c(600,500,400,500)
names(sale)<-c('a','b','c','d')
sale
sale[1]
sale[seq(2,4,2)]

a<-'나의 나이는'
b<-20
c<-'입니다'

paste(a,b,c,sep = ' ')


a<-1:12
b<-'월'
c<-paste(a,b, sep = ' ')
c


# 카페 일간 매출분석 벡터사용

es<-c(4,5,3,6,5,4,7)
am<-c(63,68,64,68,72,89,94)
la<-c(61,70,59,71,71,92,88)

names(es)<-c('월','화','수','목','금','토','일')
names(am)<-c('월','화','수','목','금','토','일')
names(la)<-c('월','화','수','목','금','토','일')

es.day<- 1.5 * es
am.day<- 2.0 * am
la.day<- 2.5 * la

cf.day<-es.day + am.day + la.day
names(cf.day)<-c('월','화','수','목','금','토','일')
cf.day                 
sum(cf.day)
sale.mean<-mean(cf.day)
names(cf.day[cf.day>sale.mean])

coffee<-list(es = c(4,5,3,6,5,4,7),
             am = c(63,68,64,68,72,89,94),
             la = c(61,7059,71,71,92,88),
             price = c(2.0,2.5,3.0),
             menu = c('es','am','la'))
coffee
coffee$menu<-factor(coffee$menu)
coffee$menu
names(coffee$price)<-coffee$menu
coffee$price


h.list<-c('game','poker','eating')
minwook<-list(name='기미눅',age=34,hobby=h.list,bestfriend='공성원')
minwook


laon<-matrix(1:4, nrow=2,ncol=2)
laon[1,1]<-'이건건'
laon[1,]


burger <- matrix(c (514, 917, 11,
                    533, 853, 13,
                    566, 888, 10),
                 nrow = 3,
                 byrow = T)

rownames(burger)<-c('M','L','B')
burger
colnames(burger)<-c('kcal','na','fat')
burger

burger['M','na']
