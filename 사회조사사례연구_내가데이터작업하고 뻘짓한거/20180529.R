setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/기말고사 데이터 작업 내용")
rawdata<-read.csv("2016_panel_data.csv")
dim(rawdata) #n=18082, p=1222

#making dummy
rawdata$major<-as.factor(rawdata$major)
rawdata$school<-as.factor(rawdata$school)
rawdata$sex<-as.factor(rawdata$sex)
rawdata$graduate<-as.factor(rawdata$gp1510736)

### 모델1에 대한 반응변수: 전반적인 만족도_gp1510399

###모델1에 대한 독립변수들
#1. 학교프로그램 참여횟수 : numbering_School 
str(rawdata)

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


#2. 어학에 대한 노ㄹ =language

#gp1510808 어학연수 여부
#gp1510819 영어시험 치뤘냐 안치뤘냐
#gp1510842 제2외국어 시험 쳤냐 안쳤냐

out <-ifelse(rawdata$gp1510808==2,0,rawdata$gp1510808)
eng<-ifelse(rawdata$gp1510819==-1, NA,rawdata$gp1510819)
eng <-ifelse(rawdata$gp1510819==2,0,rawdata$gp1510819)
lan2<-ifelse(rawdata$gp1510842==-1, NA,rawdata$gp1510842)
lan2 <-ifelse(rawdata$gp1510842==2,0,rawdata$gp1510842)

rawdata$language<-out+eng+lan2


#3. 학점=score
rawdata$gp1510662 #진짜학점
rawdata$gp1510661 #학교에서 몇점이 만점인지
rawdata$score <- ifelse(rawdata$gp1510661==3, rawdata$gp1510661*rawdata$gp1510662, ifelse(rawdata$gp1510661==-1, NA, ifelse(rawdata$gp1510661==1, rawdata$gp1510661*rawdata$gp1510662*((4.5/4.0)^2), rawdata$gp1510661*rawdata$gp1510662*((4.5/4.3)^2))))
rawdata$score<-sqrt(rawdata$score_1)


#4. 목표설정_재학중 목표를 설정했는가(변수명:setting_goal, 목표를 설정했다면=1, 설정하지 않았다면=0)
rawdata$setting_goal <-ifelse(rawdata$gp1510858==2,0,rawdata$gp1510858)

#5. 자격증개수 license: gp1510911

#6. 취업을위한경험활동.experience (한 프로그램당 경험이있으면1, 없으면 0으할 할당하고 다 더하기)

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


#7. 취업을 위한 정부 사업 참여정도:govern

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
dim(rawdata)

rawdata<-as.data.frame(rawdata)
xvar<-c("numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate","gp1510911")
Data<-rawdata[,c(xvar,"gp1510399")]

dim(Data)


# (첫 일자리) 전반적인 만족도
regres<-lm(gp1510399 ~ .,data=Data)
summary(regres)
step(regres)

regres_1<-lm(gp1510399 ~ sex+score+graduate+school,data=Data)
summary(regres_1)
step(regres_1)
regres_2<-lm(gp1510399 ~ score+school,data=Data)
summary(regres_2)

# 결과해석: 만족도와 대학교유형(전문대,4년제,교육대) 따라 관련있고 나머지 노력은 직업만족도와 선형적인 관계가 없어보인다.
# 주의사항 :설명력이 1퍼센트나옴.

# 회귀분석보다 anova분석이 더 나아보인다.

?anova
result1<-aov(gp1510399~school, data=Data)
summary(result1)

result2<-aov(gp1510399~score, data=Data)
summary(result2)

result3<-aov(gp1510399~score+school, data=Data)
summary(result3)



### 번외) 직장생활에서 성실도의 측면으로 직업의 전반적인 만족도에 다른 요소를 찾아보자

#일주일 근무시간:gp1510102
#월 평균 월그:gp1510107
# 전공 일치도:gp1510128
# 기업체 종사자수:gp1510301
# 사업체 형ㅌ태 gp1510307****
# 종사상 지위:gp1510308*****

rawdata$gp1510301[is.na(rawdata$gp1510301)] <-0
rawdata$company_size<-ifelse(rawdata$gp1510301==-1, NA,rawdata$gp1510301)

"gp1510399"

xvar<-c("gp1510102","gp1510107","gp1510128","company_size","gp1510307","gp1510308")
Data2<-rawdata[,c(xvar,"gp1510399")]

dim(Data2)

reg2<-lm(gp1510399~., data=Data2, na.rm=TRUE)
step(reg2)
reg2_new<-lm(gp1510399~company_size+gp1510128+gp1510308+gp1510307,data=Data2, na.rm=TRUE)
summary(reg2_new)

#설명력이 매우 낮다->회귀모형보다 아노바분석을 해야할 것 같다
result3<-aov(gp1510399~company_size+gp1510128+gp1510308+gp1510307, data=Data2)
summary(result3)





xvar3<-c("gp1510102","gp1510107","gp1510128","company_size","gp1510307","gp1510308","numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate","gp1510911","gp1510128")


Data3<-rawdata[,c(xvar3,"gp1510399")]
dim(Data3)

reg3<-lm(gp1510399~., data=Data3)
summary(reg3)
step(reg3)

reg3_1<-lm(gp1510399~gp1510128+score+gp1510307+govorn+company_size, data=Data3)
summary(reg3_1)
step(reg3_1)



#설명력이 4퍼센트밖에 안되네
#전공일치도,학점,(첫일자리)사업형태, 정부지원프로그램참여횟수,회사크기에 따라 만족도가 좀 다를 수 있을 것 같다.


anova<-aov(gp1510399~gp1510128+score+gp1510307+govorn, data=Data3)
summary(anova)
# anova분석을 해봣는데 
#gp1510128 일과 전공일치도, 학점,gp1510307사업체의형태, 정부프로그램 참여횟수에 따라 만족도가 다르게 나옴


install.packages("agricolae")
library(agricolae)
?duncan.test
duncan.test(Data3$gp1510399, Data3$gp1510128+Data3$score+Data3$gp1510307+Data3$govorn,MSerror, TRUE,console=FALSE, alpha = 0.05)

?Mserror
boxplot(rawdata$gp1510399)
table(rawdata$gp1510399) 
# 표본에 의한 table표만 보았을때
# 응답자 중,직업을 만족하는 사람이 전체 30퍼센트밖에 되지 않는다



# 로지스틱 회귀
library(dplyr) 
library(ggplot2) 
library(ISLR) 
library(MASS) 
library(glmnet)









ㅎ





xvar4<-c("gp1510102","gp1510107","gp1510128","company_size","gp1510307","gp1510308","numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate","gp1510911","gp1510128")


xvar4<-c("gp1510102","gp1510107","gp1510128","company_size","gp1510307","gp1510308","numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate","gp1510911","gp1510128","gp1510386","gp1510387", "gp1510388","gp1510389","gp1510390","gp1510391","gp1510392","gp1510393","gp1510394","gp1510395","gp1510396","gp1510397","gp1510398","gp1510177")



rawdata$gp1510386[is.na(rawdata$gp1510386)] <-0
rawdata$gp1510387[is.na(rawdata$gp1510387)] <-0
rawdata$gp1510388[is.na(rawdata$gp1510388)] <-0
rawdata$gp1510389[is.na(rawdata$gp1510389)] <-0
rawdata$gp1510390[is.na(rawdata$gp1510390)] <-0
rawdata$gp1510391[is.na(rawdata$gp1510391)] <-0
rawdata$gp1510392[is.na(rawdata$gp1510392)] <-0
rawdata$gp1510393[is.na(rawdata$gp1510393)] <-0
rawdata$gp1510394[is.na(rawdata$gp1510394)] <-0
rawdata$gp1510395[is.na(rawdata$gp1510395)] <-0
rawdata$gp1510396[is.na(rawdata$gp1510396)] <-0
rawdata$gp1510397[is.na(rawdata$gp1510397)] <-0
rawdata$gp1510398[is.na(rawdata$gp1510398)] <-0
#무응답을 -1처리한거임


rawdata$b1<-ifelse(rawdata$gp1510386==-1, NA,rawdata$gp1510386)
rawdata$b2<-ifelse(rawdata$gp1510387==-1, NA,rawdata$gp1510387)
rawdata$b3<-ifelse(rawdata$gp1510388==-1, NA,rawdata$gp1510388)
rawdata$b4<-ifelse(rawdata$gp1510389==-1, NA,rawdata$gp1510389)
rawdata$b5<-ifelse(rawdata$gp1510390==-1, NA,rawdata$gp1510390)
rawdata$b6<-ifelse(rawdata$gp1510391==-1, NA,rawdata$gp1510391)
rawdata$b7<-ifelse(rawdata$gp1510392==-1, NA,rawdata$gp1510392)
rawdata$b8<-ifelse(rawdata$gp1510393==-1, NA,rawdata$gp1510393)
rawdata$b9<-ifelse(rawdata$gp1510394==-1, NA,rawdata$gp1510394)
rawdata$b10<-ifelse(rawdata$gp1510395==-1, NA,rawdata$gp1510395)
rawdata$b11<-ifelse(rawdata$gp1510396==-1, NA,rawdata$gp1510396)
rawdata$b12<-ifelse(rawdata$gp1510397==-1, NA,rawdata$gp1510397)
rawdata$b13<-ifelse(rawdata$gp1510398==-1, NA,rawdata$gp1510398)


df<-c("b1","b2","b3","b4","b5","b7","b8","b9","b10","b11","b12","b13")






Data4<-rawdata[,c(xvar4,"gp1510399",df)]


#####variance selection_요인분석으로
fa<-Data4[,df]
fa<-na.omit(fa)
View(fa)



# 반올림해보장
round(cor(fa),digits=3)

#scatter plot matrix
plot(fa)



Data4$grat<-(rawdata$gp1510386+rawdata$gp1510387+rawdata$gp1510392+rawdata$gp1510391+rawdata$gp1510390+rawdata$gp1510389+rawdata$gp1510388+rawdata$gp1510393+rawdata$gp1510394+rawdata$gp1510396+rawdata$gp1510398+rawdata$gp1510397+rawdata$gp1510395)


dim(Data4)
View(Data4)

"gp1510177" #이직합격제의횟수

Data4$gp1510177[is.na(Data4$gp1510177)] <- 0
sum(Data4$gp1510177)

Data4$gp1510177 <- ifelse(Data4$gp1510177==-1, NA,Data4$gp1510177)
table(Data4$gp1510177)
Data4$transfer_comp<-ifelse(Data4$gp1510177>=1, 1 ,Data4$gp1510177)
table(Data4$transfer_comp)




x4_1<-c("gp1510102","gp1510107","gp1510128","company_size","gp1510307","gp1510308","numbering_School","language","score","setting_goal","experience","govorn","major","school","sex","graduate","gp1510911","gp1510128","grat","transfer_comp")



Data4$grat<-b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12+b13

Data4<-Data4[,x4_1]
View(Data4)

str(Data4)
dim(Data4)




aa<-lm(grat~.,data=Data4)
summary(aa)
step(aa)


final_regres<-lm(grat~major+gp1510307+gp1510107+school+sex+score+numbering_School+gp1510128+company_size+govorn+gp1510911,data=Data4)
summary(final_regres)
step(final_regres)



final_regres<-lm(grat~major+gp1510307+gp1510107+school+numbering_School+gp1510128+company_size+gp1510911,data=Data4)

# traing set 나눠보기



set.seed(1) ;n=nrow(Data4) ;idx <- 1:n




#idx <=몇퍼센트 뽑을지의 index임
training.idx <- sample(idx,n*.6)
idx <- setdiff(idx,training.idx)  # 나머지 
validate.idx <- sample(idx,n*.2) 
test.idx <- setdiff(idx,validate.idx)



length(training.idx) ;length(validate.idx) ; length(test.idx)



training <- Data4[training.idx,] 
validation <- Data4[validate.idx,] 
test <- Data4[test.idx,]

dim(training)








training$transfer_comp

ad_glm_full <- glm(transfer_comp~., data=training, family=binomial)
step(ad_glm_full)


dim(training)


 # 모델이 적합하지 않음














#왜 모델이 적합하지 않은가.?


oecd_data<-read.csv("2013_job_quality.csv")
str(oecd_data)

dim(oecd_data)
dim(oecd)
oecd<-na.omit(oecd_data)


fivenum(oecd$Labour.market.insecurity) #이직을 잘 하지 않고
fivenum(oecd$Earnings.quality)  # 직업의 질적인 측면이 좋지 않다.

str(oecd)
View(oecd) # compare with portugal&korea









mean(rawdata$gp1510399, na.rm=T)
boxplot(rawdata$gp1510399, na.rm=T)

table(rawdata$gp1510399)
#3점->보통
k1<-sum(350,1162,2023)
#만족하는 집단
k2<-sum(1139+231 )


#만족하지 않는 집단의 비율
p1<-k1/(k1+k2)
#만족하는 집단의 비ㅇ
p2<-k2/(k1+k2)율




# 귀무가설: p1=p2
# 대립가설 :우리나라에서 직업에 만족하지 않는 비율이 대다수이다

#아노바분석해보기

#우리나라에서 직업에 만족하지 않는 비율이 대다수이다.
