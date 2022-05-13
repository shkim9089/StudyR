#기본그래프 그리기
#막대그래프 bar chart
favorite.season<-c('WINER','SUMMER','SUMMER','SUMMER','SUMMER','FALL',
                  'FALL','SUMMER','SPRING','SPRING')
favorite.season
ds<-table(favorite.season) # 도수분포표
ds

barplot(ds, main = '좋아하는 계절')


barplot(ds, main = '좋아하는 계절',
                      col=c('lightskyblue4','magenta','gold1','darkgray'))


barplot(ds, main = '좋아하는 계절',col=rainbow(4))

barplot(ds, main = '좋아하는 계절',col=rainbow(4),
        xlab ='계절', ylab = '빈도수' )

barplot(ds, main = '좋아하는 계절',col=rainbow(4),
        xlab ='계절', ylab = '빈도수',horiz = F,
        names=c('가을','봄','여름','겨울'), las=1)

#las 이름들이 수직



colors()
