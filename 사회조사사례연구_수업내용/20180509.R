install.packages("dplyr")
library("dplyr")

install.packages("gapminder")
install.packages("DBI")
library("DBI")
library("gapminder")
install.packages("lazyeval")
library("lazyeval")

i2 <-tbl_df(iris)
gapminder %>% filter(country=='korea, Rep.' & year==2007)
gapminder %>% arrange(year, country)
gapminder %>% select(pop, gdpPercap)


data <- gapminder %>%
  mutate(total_gdp=pop*gdpPercap,
         le_gdp_ratio = lifeExp/gdpPercap,
         lgrk = le_gdp_ratio*100)

glimpse(gapminder)
head(data)
dim(data) #variable 9


# summary_statistics
gapminder %>%
  summarise(n_obs=n(), 
            n_country=n_distinct(country),
            n_year=n_distinct(year),
            med_gdpc=median(gdpPercap),
            max_gdpc=max(gdpPercap))

# Random sampling
sample_n(gapminder, 10)
sample_frac(gapminder, 0.01) #0.01percent ->17

distinct(select(gapminder, year))

gapminder %>%
  filter(year==2002 %>%
         group_by(continent) %>%
         summarise(median(lifeExp)))








## 메모장의 요구에 대한 코딩답안.
# 역변환 in R

locationDay<-"C:/Users/3f14/Downloads"

rawdata<-read.csv("C:/Users/3f14/Downloads/data.csv")
glimpse(rawdata)


rawdata$y1 <- (6-rawdata$h_med2)
rawdata$y2 <- (5-rawdata$h_eco2)

#making dummy.
rawdata$ecoBB <- as.factor(rawdata$ecoB) 
rawdata$jobb1_2013 <- as.factor(rawdata$job1_2013) 
rawdata$h_g3 <- as.factor(rawdata$h_g3) 
rawdata$h_g10 <- as.factor(rawdata$h_g10) 
rawdata$h_reg7 <- as.factor(rawdata$h_reg7) 

#이제 필요한 변수만 뽑는 작업을 해보자!
#edu ->연속형으로 보겠다는 의미
# dummy가 너무 많아지면 해석하기 너무 어려워짐

xvar <- c("h_din","asset","debt","h07_9",
          "edu","ecoBB", "jobb1_2013",
          "h_g3","h_g10","h_reg7","y2",
          "h_g9_1")

Data <- rawdata[,c("y1",xvar)]

head(Data)
str(Data)

# 필요한 x변수 다 뽑은거니까요 x변수 다 쓰셔도 되용.
olsreg<-lm(y1 ~., data=Data)
summary(olsreg)


#봐야할 부분, 주관적근로능력정도 - ecoBB1, ecoBB2, ... ecoBB5
# jobb1_20131 <-1이 붙은 이유가ㅡ, 취업자의 경우의 coefficient임.
# h_g3 <-성별이거든요? 뒤에 2라는 숫자가 붙었는데, 이 의미는 남자가 defalt이고
#여자의 경우 coefficient 값 곱해주시면 되는 겁니다



# 그리고 설명변수가 많아질수록 multiple_R_squared가 증가하지.
# 그래서 adjusted R 값을 봐야하구요(회귀분석 돌리면(
# 회귀직전식이 전체 데이터를 26퍼센트 설명하는 것임.
# 설명력이 낮음에도 모델링을 해야하기에, 실제 실생활의 survey자료에서
#survey자료가 0.3~0.4만되도 꽤나 높다고 생각함
#실제 배우는, 데이터는 정말 잘 만들어진 거라 설명력이 8~90프로인거지
#서베이 자료에 이정도면 그냥 씀. 근데 알아야 하는 건, 회귀모형을 돌렸잖아요
#모형에 대해서 충분히 정보를 주어야합니다(상대방한테)

#설명력이 26퍼센트밖에 안된다는 설명을 꼭 해줘야합니다


aaa <- round(summary(olsreg)$coefficients, 10)


# 안에 summary(회귀분석)$ 회귀계수검정한것, 10재짜리까지
#왜 aaa라고 저장했냐? table같은거 보고서 쓸때 유용하거든

# 저장디렉토리 썻잖아요

write.table(aaa, paste(locationDay, "aaa.csv", sep =""), sep=",", 
            col.names = NA, row.names = T )