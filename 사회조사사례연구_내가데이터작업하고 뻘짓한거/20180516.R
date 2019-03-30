
setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/기말고사 데이터 작업 내용")

rawdata<-read.csv("2016_panel_data.csv")
dim(rawdata)


# x변수->주성분 분석 이용
install.packages("MVA")
library(MVA)
library(psych)





#making dummy
rawdata$major<-as.factor(rawdata$major)
rawdata$school<-as.factor(rawdata$school)
rawdata$sex<-as.factor(rawdata$sex)
rawdata$graduate<-as.factor(rawdata$gp1510736)

### 모델1에 대한 반응변수
#y1 = 직장 전반적 만족도 (1부터 5까지의 값이고 그 외에는 Missing)
y1 <- "rawdata$gp1510399"



View(rawdata)


###모델1에 대한 독립변수들
#학교프로그램 참여횟수 : numbering_School 
str(rawdata)
rawdata<-as.data.frame(rawdata)


#NA <-코드북 보면 참여횟수가 0이 NA를 의미하는거라서 0으로 할당

rawdata$gp1510634[is.na(rawdata$gp1510634)]<-0
rawdata$gp1510635[is.na(rawdata$gp1510635)]<-0
rawdata$gp1510636[is.na(rawdata$gp1510636)]<-0
rawdata$gp1510637[is.na(rawdata$gp1510637)]<-0
rawdata$gp1510638[is.na(rawdata$gp1510638)]<-0
rawdata$gp1510639[is.na(rawdata$gp1510639)]<-0
rawdata$gp1510640[is.na(rawdata$gp1510640)]<-0
rawdata$gp1510641[is.na(rawdata$gp1510641)]<-0
rawdata$gp1510642[is.na(rawdata$gp1510642)]<-0



# -1: 무응답 =>NA처리
a1<-ifelse(rawdata$gp1510634==-1, NA,rawdata$gp1510634)
a2<-ifelse(rawdata$gp1510635==-1, NA,rawdata$gp1510635)
a3<-ifelse(rawdata$gp1510636==-1, NA,rawdata$gp1510636)
a4<-ifelse(rawdata$gp1510637==-1, NA,rawdata$gp1510637)
a5<-ifelse(rawdata$gp1510638==-1, NA,rawdata$gp1510638)
a6<-ifelse(rawdata$gp1510639==-1, NA,rawdata$gp1510639)
a7<-ifelse(rawdata$gp1510640==-1, NA,rawdata$gp1510640)
a8<-ifelse(rawdata$gp1510641==-1, NA,rawdata$gp1510641)
a8<-ifelse(rawdata$gp1510642==-1, NA,rawdata$gp1510642)


# 변수 하나 만들었음.
rawdata$numbering_School<-a1+a2+a3+a4+a5+a6+a7+a8

dim(rawdata)


#어학에 대한 노력=language!!!!!!!!!!!!!다시하기...ㅠㅠ

#gp1510808 어학연수 여부
#gp1510819 영어시험 치뤘냐 안치뤘냐
#gp1510842 제2외국어 시험 쳤냐 안쳤냐


out <-ifelse(rawdata$gp1510808==2,0,rawdata$gp1510808)


eng<-ifelse(rawdata$gp1510819==-1, NA,rawdata$gp1510819)
eng <-ifelse(rawdata$gp1510819==2,0,rawdata$gp1510819)

lan2<-ifelse(rawdata$gp1510842==-1, NA,rawdata$gp1510842)
lan2 <-ifelse(rawdata$gp1510842==2,0,rawdata$gp1510842)


rawdata$language<-out+eng+lan2


#학점=score

rawdata$score_1 <- ifelse(gp1510661==3, gp1510661*gp1510662, ifelse(gp1510661==-1, NA, ifelse(gp1510661==1, gp1510661*gp1510662*((4.5/4.0)^2), gp1510661*gp1510662*((4.5/4.3)^2))))

rawdata$score<-sqrt(rawdata$score_1)




#목표설정.(변수명:setting_goal, 목표를 설정했다면=1, 설정하지 않았다면=0)
rawdata$setting_goal <-ifelse(rawdata$gp1510858==2,0,rawdata$gp1510858)


#자격증개수 license
license<-"gp1510911"

#취업을위한경험활동.experience (한 프로그램당 경험이있으면1, 없으면 0으할 할당하고 다 더하기)

ex1<-ifelse(rawdata$gp1510979==2,0,rawdata$gp1510979)
ex2<-ifelse(rawdata$gp1510980==2,0,rawdata$gp1510980)
ex3<-ifelse(rawdata$gp1510981==2,0,rawdata$gp1510981)
ex4<-ifelse(rawdata$gp1510982==2,0,rawdata$gp1510982)
ex5<-ifelse(rawdata$gp1510983==2,0,rawdata$gp1510983)
ex6<-ifelse(rawdata$gp1510984==2,0,rawdata$gp1510984)
ex7<-ifelse(rawdata$gp1510985==2,0,rawdata$gp1510985)
ex8<-ifelse(rawdata$gp1510986==2,0,rawdata$gp1510986)
ex9<-ifelse(rawdata$gp1510987==2,0,rawdata$gp1510987)

rawdata$experience<-ex1+ex2+ex3+ex4+ex5+ex6+ex7+ex8+ex9








#취업을 위한 정부 사업 참여정도.

# NA->0번 참여했다는 의미
rawdata$gp1511088[is.na(rawdata$gp1511088)] <-0
rawdata$gp1511089[is.na(rawdata$gp1511089)] <-0
rawdata$gp1511090[is.na(rawdata$gp1511090)] <-0
rawdata$gp1511091[is.na(rawdata$gp1511091)] <-0
rawdata$gp1511092[is.na(rawdata$gp1511092)] <-0
rawdata$gp1511093[is.na(rawdata$gp1511093)] <-0
rawdata$gp1511094[is.na(rawdata$gp1511094)] <-0
rawdata$gp1511095[is.na(rawdata$gp1511095)] <-0
rawdata$gp1511096[is.na(rawdata$gp1511096)] <-0
rawdata$gp1511097[is.na(rawdata$gp1511097)] <-0
rawdata$gp1511098[is.na(rawdata$gp1511098)] <-0
rawdata$gp1511099[is.na(rawdata$gp1511099)] <-0

#무응답을 -1처리한거임
View(rawdata)



b1<-ifelse(rawdata$gp1511088==-1, NA,rawdata$gp1511088)
b2<-ifelse(rawdata$gp1511089==-1, NA,rawdata$gp1511089)
b3<-ifelse(rawdata$gp1511090==-1, NA,rawdata$gp1511090)
b4<-ifelse(rawdata$gp1511091==-1, NA,rawdata$gp1511091)
b5<-ifelse(rawdata$gp1511092==-1, NA,rawdata$gp1511092)
b6<-ifelse(rawdata$gp1511093==-1, NA,rawdata$gp1511093)
b7<-ifelse(rawdata$gp1511094==-1, NA,rawdata$gp1511094)
b8<-ifelse(rawdata$gp1511095==-1, NA,rawdata$gp1511095)
b9<-ifelse(rawdata$gp1511096==-1, NA,rawdata$gp1511096)
b10<-ifelse(rawdata$gp1511097==-1, NA,rawdata$gp1511097)
b11<-ifelse(rawdata$gp1511098==-1, NA,rawdata$gp1511098)
b12<-ifelse(rawdata$gp1511099==-1, NA,rawdata$gp1511099)



rawdata$govorn<-b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12



View(rawdata)
dim(rawdata)


xvar<-c("numbering_School","language","score","setting_goal","gp1510911","experience","govorn","major","school","sex","graduate")
View(rawdata)
dim(rawdata)



Data$numbering_School
Data$language
Data$score
Data$setting_goal #
Data$license #

Data$experience
Data$no_paid_ex #

str(Data)
View(Data)
Data<-rawdata[,c("numbering_School","language","score","setting_goal","gp1510911","experience","govorn","major","school","sex","graduate","gp1510399")]

View(rawdata)

rawdata$major<-as.factor(rawdata$major)
rawdata$school<-as.factor(rawdata$school)
rawdata$sex<-as.factor(rawdata$sex)
rawdata$graduate<-as.factor(rawdata$gp1510736)

dim(iris)
str(iris)



regres<-lm(rawdata$gp1510399 ~ rawdata$numbering_School+rawdata$setting_goal+rawdata$experience+rawdata$major+rawdata$school+rawdata$sex+rawdata$graduate, na.rm=TRUE)
summary(regres)


pca_c<-prcomp(rawdata, na.rm=TRUE)
