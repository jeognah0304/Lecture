setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/기말고사 데이터 작업 내용")
rawdata<-read.csv("2016_panel_data.csv")
dim(rawdata) #n=18082, p=1222

# y변수 gp1510400을 일딴뺏음.
y_var<-c("gp1510399","gp1510770","gp1510400")

#x변수
x_var<-c("gp1511195","gp1511196","gp1511043","gp1511044","gp1511045","gp1511046","gp1511047","gp1511048","gp1511049","gp1511050","gp1511051","gp1510809","gp1510763","gp1510739","gp1510659","gp1510660","gp1510426","gp1510427","gp1510405","gp1510401","gp1510402")

Data<-rawdata[,c(y_var,x_var)]

dim(Data)

library(reshape)
Data<-rename(Data, c(gp1510399="com_satis",gp1510400="work_satis"))
Data<-rename(Data, c(gp1511195="parents_asset",gp1511196="income_last_year",gp1511043="satis_personal",gp1511044="satis_interaction",gp1511045
="satis_sociaty", gp1511046="feeling_joyful",gp1511047="feeling_happy",gp1511048="feeling_comfortable",gp1511049="feeling_anoying",gp1511050="feeling_negative",gp1511051="feeling_lethargic",gp1510809="language_traing_abroad",gp1510770="position",gp1510739="major_concordance",gp1510659="satis_school_major",gp1510660="satis_school_overal",gp1510426="any_problem_in_com"))
Data<-rename(Data, c(gp1510427="difficult_used_to", gp1510405="helpful_major_knowledge",gp1510401="work_my_level",gp1510402="skill_my_level"))

table(Data$com_satis)
table(Data$work_satis)

mean(Data$com_satis, na.rm=T)
mean(Data$work_satis, na.rm=T)

#반응변수들 정제하기
Data$parents_asset<-ifelse(Data$parents_asset==7,0, Data$parents_asset)
Data$parents_asset<-ifelse(Data$parents_asset==-1,NA, Data$parents_asset)
Data$income_last_year<-ifelse(Data$income_last_year==-1,NA, Data$income_last_year)
Data$helpful_major_knowledge<-ifelse(Data$helpful_major_knowledge==-1,NA, Data$helpful_major_knowledge)
Data$feeling_anoy<-(8-Data$feeling_anoy) #역변환
Data$feeling_negative<-(8-Data$feeling_negative)
Data$feeling_lethargic<-(8-Data$feeling_lethargic)
Data$any_problem_in_com<-ifelse(Data$any_problem_in_com==-1,NA, Data$any_problem_in_com)
Data$any_problem_in_com<-ifelse(Data$any_problem_in_com==2,0, Data$any_problem_in_com)

# 그냥 회귀분석 변수 다 치고 stepwise 쓰니까 p-value=NA 떠서 하나하나 선택하고
# 이상한 변수 일단 처음부터 빼고 다 넣어서 step-wise방법을 씀.
Data<-as.data.frame(Data)
regres1<-lm(com_satis~work_satis, data=Data, rm.na=TRUE)
summary(regres1)
regres4<-lm(com_satis~satis_personal, data=Data, rm.na=TRUE)
summary(regres4)
regres5<-lm(com_satis~satis_interaction, data=Data, rm.na=TRUE)
summary(regres5)
regres6<-lm(com_satis~satis_sociaty, data=Data, rm.na=TRUE)
summary(regres6)
regres7<-lm(com_satis~feeling_joyful, data=Data, rm.na=TRUE)
summary(regres7)
regres8<-lm(com_satis~feeling_happy, data=Data, rm.na=TRUE)
summary(regres8)
regres9<-lm(com_satis~feeling_comfortable, data=Data, rm.na=TRUE)
summary(regres9)
regres10<-lm(com_satis~feeling_anoying, data=Data, rm.na=TRUE)
summary(regres10)
regres11<-lm(com_satis~feeling_negative, data=Data, rm.na=TRUE)
summary(regres11)
regres12<-lm(com_satis~feeling_lethargic, data=Data, rm.na=TRUE)
summary(regres12)
regres14<-lm(com_satis~major_concordance, data=Data, rm.na=TRUE)
summary(regres14)
regres15<-lm(com_satis~satis_school_major, data=Data, rm.na=TRUE)
summary(regres15)
regres16<-lm(com_satis~satis_school_overal, data=Data, rm.na=TRUE)
summary(regres16)
regres17<-lm(com_satis~any_problem_in_com, data=Data, rm.na=TRUE)
summary(regres17)
regres18<-lm(com_satis~helpful_major_knowledge, data=Data, rm.na=TRUE)
summary(regres18)
regres19<-lm(com_satis~work_my_level, data=Data, rm.na=TRUE)
summary(regres19)
regres20<-lm(com_satis~skill_my_level, data=Data, rm.na=TRUE)
summary(regres20)

regres<-lm(com_satis~satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_anoying+feeling_negative+feeling_lethargic+major_concordance+satis_school_major+satis_school_overal+any_problem_in_com+helpful_major_knowledge+work_my_level+skill_my_level, data=Data)

final1<-step(regres)
summary(step(regres))
plot(final1)

regres_2<-lm(work_satis~satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_anoying+feeling_negative+feeling_lethargic+major_concordance+satis_school_major+satis_school_overal+any_problem_in_com+helpful_major_knowledge+work_my_level+skill_my_level, data=Data)
final2<-step(regres_2)
summary(final2)

#  불만족하는 집단=1, 만족하는 집단=2, 그외의 집단은 NA처리함.


Data$group_satis <- ifelse(Data$com_satis <= 2, 1, ifelse(is.na(Data$com_satis) == TRUE, NA, ifelse(Data$com_satis == 3, 0, 2)))




Data_1 <- Data[Data$group_satis==1, ]
Data_2 <- Data[Data$group_satis==2, ]
Data_1 <- Data_1[is.na(Data_1$group_satis) == FALSE, ]
Data_2 <- Data_2[is.na(Data_2$group_satis) == FALSE, ]


dim(Data_1)
dim(Data_2)
View(Data_1)
View(Data_2)
str(Data_1)
str(Data_2)

# 만족도 낮은 집단.
str(Data_1)

table(Data_1$position)

table(Data_1$parents_asset)
mean(Data_1$parents_asset, na.rm=T)

table(Data_1$income_last_year)
mean(Data_1$income_last_year, na.rm=T)

table(Data_1$satis_personal)
mean(Data_1$satis_personal, na.rm=T)

table(Data_1$satis_interaction)
mean(Data_1$satis_interaction)

table(Data_1$satis_sociaty)
mean(Data_1$satis_interaction)

table(Data_1$language_traing_abroad)
mean(Data_1$language_traing_abroad, na.rm=T)

table(Data_1$helpful_major_knowledge)
mean(Data_1$helpful_major_knowledge, na.rm=T)

table(Data_1$skill_my_level)
mean(Data_1$skill_my_level)

table(Data_1$feeling_anoy)
mean(Data_1$feeling_anoy)

table(Data_1$feeling_happy)
mean(Data_1$feeling_happy)


# 만족도 높은 집단
analysis_upper_group<-lm(work_satis~., data=Data_2)

table(Data_2$position)

table(Data_2$parents_asset)
mean(Data_2$parents_asset, na.rm=T)

table(Data_2$income_last_year)
mean(Data_2$income_last_year, na.rm=T)
fivenum(Data_2$income_last_year, na.rm=T)

table(Data_2$satis_personal)
mean(Data_2$satis_personal)

table(Data_2$satis_interaction)
mean(Data_2$satis_interaction)

table(Data_2$satis_sociaty)
mean(Data_2$satis_sociaty)

table(Data_2$language_traing_abroad)
mean(Data_2$language_traing_abroad, na.rm=T)

table(Data_2$helpful_major_knowledge)
mean(Data_2$helpful_major_knowledge, na.rm=T)

table(Data_2$skill_my_level)
mean(Data_2$skill_my_level)

table(Data_2$feeling_anoy)
mean(Data_2$feeling_anoy)

table(Data_2$feeling_happy)
mean(Data_2$feeling_happy)




# 만족도 높은 집단과 낮은 집단간의 분석해볼 것: parents_asset, income_last_year, language_traing_abroad, helpful_major_knowledge, skill_my_level

?chisq.test()
aov(Data_1$parents_asset,Data_2$parents_asset)


a<-table(Data_1$parents_asset)
b<-table(Data_2$parents_asset)

chisq.test(a,b)

mean(Data_1$parents_asset, na.rm=T)

table(Data_1$income_last_year)
mean(Data_1$income_last_year, na.rm=T)


a<-table(Data_1$income_last_year)
b<-table(Data_2$income_last_year)

plot(a, xlim = c(0, 10000))
plot(b, xlim = c(0, 10000))




##### 어학연수의 숫자가 유의함.
a<-table(Data_1$language_traing_abroad)
mean(Data_1$language_traing_abroad, na.rm=T)

b<-table(Data_1$helpful_major_knowledge)
mean(Data_1$helpful_major_knowledge, na.rm=T)

install.packages("gmodels")
library(gmodels) 


