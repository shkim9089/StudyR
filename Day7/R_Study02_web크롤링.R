##웹 크롤링
install.packages('rvest')
library(rvest)
library(stringr)


#보배드림 검색- URL가져오기
url<-'https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=I&page=1&order=S11&view_size=70'
usedCar<-read_html(url)

#HTML 소스안에 mde-cell.title 안에 차이름 확인
carInfos<-html_nodes(usedCar,css='.mode-cell.title')
carInfos

##tit.ellipsis 안에 나머지 요소 제거
cartitles<-carInfos %>% html_node('.tit.ellipsis') %>% html_text()
cartitles

#불피룡한 요소 제거

cartitles<-gsub('  ', '',cartitles)

cartitles<-gsub("\r\n\t",'',cartitles)
cartitles


#연식 가져오기
caryears<-html_nodes(usedCar,css='.mode-cell.year')
caryears

#css 정보 가져오기 제외
caryears<-caryears %>% html_nodes('.text') %>% html_text()
caryears<-caryears[2:length(caryears)]
caryears

#v연료정보가져오기
carfuels<-html_nodes(usedCar,css='.mode-cell.fuel')
carfuels

#연료 css 정보 가져오고 제외
carfuels<-carfuels %>% html_nodes('.text') %>% html_text()
carfuels
carfuels<-carfuels[2:length(carfuels)]
carfuels<-factor(carfuels)
carfuels

cartitles[11]<-'랜드로버 뉴 레인지로버 스포츠 3.0 SUV6'

#합치기
carused<-data.frame(cartitles,caryears,carfuels)

#12 데이터셋작성
ds<-table(carused$carfuels)
ds<-data.frame(ds)
ds

#13 차트입력
library(ggplot2)

ggplot(ds,aes(x=Var1,y=Freq),fill=Var(1))+
  geom_bar(stat = 'identity')+
  ggtitle("보배드림 수입차 1페이지 연료별 차트")
  theme(plot.title = element_text(size=25,face='bold',
                                colour = 'steelblue'))+
  labs(x='연료별', y='차량수')

