mpg<-as.data.frame(ggplot2:mpg)
View(mpg)
library(dplyr)
mpg_diff<-mpg %>%    #compac랑 suv 명을 가진애들을 가져오는데 컬럼명은 class,cty해당 함수에 넣겠다 
  select(class,cty) %>%
  filter(class %in% c("compact","suv"))


unique(mpg_diff)

head(mpg_diff)
table(mpg_diff$class)


#t.test
t.test(data=mpg_diff,cty ~ class, var.equal = T)


##일반휘발유와 고급 휘발유의 도시 연비 t 검정
mpg_diff2<-mpg %>% 
  select(fl,cty) %>% 
  filter(fl %in% c("r","p"))

table(mpg_diff2$fl)

t.test(data=mpg_diff2,cty ~ fl, var.equal = T)


#상관계수
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

#히트맵
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2)

install.packages('corrplot')
library(corrplot)

corrplot(car_cor)
