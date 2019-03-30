
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
y1 <- "gp1510399"



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
a9<-ifelse(rawdata$gp1510642==-1, NA,rawdata$gp1510642)


# 변수 하나 만들었음.
rawdata$numbering_School<-a1+a2+a3+a4+a5+a6+a7+a8+a9

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
rawdata$gp1510662
rawdata$gp1510661

rawdata$score_1 <- ifelse(rawdata$gp1510661==3, rawdata$gp1510661*rawdata$gp1510662, ifelse(rawdata$gp1510661==-1, NA, ifelse(rawdata$gp1510661==1, rawdata$gp1510661*rawdata$gp1510662*((4.5/4.0)^2), rawdata$gp1510661*rawdata$gp1510662*((4.5/4.3)^2))))

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

rawdata$gp1510911

xvar<-c("numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate")

#gp1510911 -> licence 개수
View(rawdata)
dim(rawdata)


Data<-rawdata[,c(xvar,"gp1510399","gp1510911")]

dim(Data)




# (첫 일자리) 전반적인 만족ㄷ
regres<-lm(gp1510399 ~ .,data=Data, na.rm=TRUE)
summary(regres)



reg<-lm(gp1510399~gp1510911, data=Data)
summary(reg)


?step
step(regres)

summary(step(regres))

#회귀식보다는 anov를 쓰는것이 더 나을것같다
#고졸, 대졸, 대학교졸, 대학원졸에 따라 만족도가 다르다는 결과를 얻을 수 있다.
#첫 직장 만족도는 대학생활에서 어떤 노력을 했는가와는 크게 설명력을 가지지 않는다고 볼 수 있을 것 같다.





reg<-lm(gp1510399~school, data=Data)
summary(reg)







# 로지스틱 회귀
library(dplyr) 
library(ggplot2) 
library(ISLR) 
library(MASS) 
library(glmnet)










# gp1510386	D31) (첫 일자리) 일자리 만족도_임금 또는 소득
# gp1510387	D31) (첫 일자리) 일자리 만족도_고용의 안정성
# gp1510388	D31) (첫 일자리) 일자리 만족도_근무환경
# gp1510389	D31) (첫 일자리) 일자리 만족도_일하는 시간
# gp1510390	D31) (첫 일자리) 일자리 만족도_개인의 발전가능성
# gp1510391	D31) (첫 일자리) 일자리 만족도_인간관계
# gp1510392	D31) (첫 일자리) 일자리 만족도_복리후생제도
# gp1510393	D31) (첫 일자리) 일자리 만족도_인사체계(승진제도)
# gp1510394	D31) (첫 일자리) 일자리 만족도_하고 있는 일에 대한 사회적 평판
# gp1510395	D31) (첫 일자리) 일자리 만족도_하고 있는 일의 자율성과 권한
# gp1510396	D31) (첫 일자리) 일자리 만족도_일자리에 대한 사회적 평판
# gp1510397	D31) (첫 일자리) 일자리 만족도_하는 일과 자신의 적성,흥미의 일치
# gp1510398	D31) (첫 일자리) 일자리 만족도_직무관련 교육 또는 훈련








# 경제적만족도 gp1510386+gp1510387
# 직장환경만족도  gp1510392+gp1510391+gp1510390+gp1510389+gp1510388+gp1510393
# 사회적만족도gp1510394+gp1510396
# 적성적만족ㄷ gp1510398+gp1510397+gp1510395



rawdata$grat_eco<-rawdata$gp1510386+rawdata$gp1510387
rawdata$grat_envir<-rawdata$gp1510392+rawdata$gp1510391+rawdata$gp1510390+rawdata$gp1510389+rawdata$gp1510388+rawdata$gp1510393
rawdata$grat_soci<-rawdata$gp1510394+rawdata$gp1510396
rawdata$grat_my<-rawdata$gp1510398+rawdata$gp1510397+rawdata$gp1510395



"gp1510177" #이직합격제의횟수

rawdata$gp1510177[is.na(rawdata$gp1510177)] <- 0
sum(rawdata$gp1510177)

rawdata$gp1510177 <- ifelse(rawdata$gp1510177==-1, NA,rawdata$gp1510177)
table(rawdata$gp1510177)
rawdata$transfer_comp<-ifelse(rawdata$gp1510177>=1, 1 ,rawdata$gp1510177)
table(rawdata$transfer_comp)


Data<- rawdata[,c("grat_eco","grat_envir","grat_soci","grat_my",xvar,"transfer_comp")]


table(Data$transfer_comp)


# traing set 나눠보기
set.seed(1) ;n=nrow(Data) ;idx <- 1:n




#idx <=몇퍼센트 뽑을지의 index임
training.idx <- sample(idx,n*.6)
idx <- setdiff(idx,training.idx)  # 나머지 
validate.idx <- sample(idx,n*.2) 
test.idx <- setdiff(idx,validate.idx)



length(training.idx) ;length(validate.idx) ; length(test.idx)



training <- Data[training.idx,] 
validation <- Data[validate.idx,] 
test <- Data[test.idx,]

dim(training)
table(training$transfer_comp)

?glm
ad_glm_full <- glm(transfer_comp~., data=training, family=binomial)
summary(ad_glm_full)



step(ad_glm_full)

ad_glm <- glm(transfer_comp~major+grat_soci, data=training, family=binomial)
summary(ad_glm)
summary.glm(ad_glm_full)


# prediction
predict(ad_glm_full, newdata=Data[1:1000,], type="response")


