setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/기말고사 데이터 작업 내용")
rawdata<-read.csv("2016_panel_data.csv")
dim(rawdata) #n=18082, p=1222


# y변수
y_var<-c("gp1510399","gp1510770","gp1510400")

#x변수
x_var<-c("gp1511195","gp1511196","gp1511043","gp1511044","gp1511045","gp1511046","gp1511047","gp1511048","gp1511049","gp1511050","gp1511051","gp1510809","gp1510763","gp1510739","gp1510659","gp1510660","gp1510426","gp1510427","gp1510405","gp1510401","gp1510402")

Data<-rawdata[,c(y_var,x_var)]
dim(Data)

library(reshape)
Data<-rename(Data, c(gp1510399="com_satis",gp1510400="work_satis"))

Data<-rename(Data, c(gp1511195="parents_asset",gp1511196="income_last_year",gp1511043="satis_personal",gp1511044="satis_interaction",gp1511045="satis_sociaty", gp1511046="feeling_joyful",gp1511047="feeling_happy",gp1511048="feeling_comfortable",gp1511049="feeling_anoying",gp1511050="feeling_negative",gp1511051="feeling_lethargic",gp1510809="language_traing_abroad",gp1510770="position",gp1510739="major_concordance",gp1510659="satis_school_major",gp1510660="satis_school_overal",gp1510426="any_problem_in_com"))

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


#회사만족도_
regres<-lm(com_satis~satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_anoying+feeling_negative+feeling_lethargic+major_concordance+satis_school_major+satis_school_overal+any_problem_in_com+helpful_major_knowledge+work_my_level+skill_my_level, data=Data)

final1<-step(regres)
summary(final1)
plot(final1)

#직업만족도 _설명력27%
regres_2<-lm(work_satis~satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_anoying+feeling_negative+feeling_lethargic+major_concordance+satis_school_major+satis_school_overal+any_problem_in_com+helpful_major_knowledge+work_my_level+skill_my_level, data=Data)
final2<-step(regres_2)
summary(final2)
plot(final2)

#  직ㅇ만족도: 불만족하는 집단=1, 만족하는 집단=2, 그외의 집단은 NA처리함.
Data$group_satis <- ifelse(Data$group_satis <= 2, 1, ifelse(is.na(Data$group_satis) == TRUE, NA, ifelse(Data$group_satis == 3, NA, 2)))

str(Data)
View(Data)

#dummy
#Data$position<-factor(Data$position) _이 코드는 잠시 보류류
logit1<-lm(group_satis~parents_asset+income_last_year+language_traing_abroad+helpful_major_knowledge+skill_my_level+position,data=Data)

summary(logit1)
step(logit1)

# 이렇게 만들어지는데 설명력은 8%밖에 안된다는게 문제
logit<-lm(group_satis~helpful_major_knowledge+skill_my_level, data=Data)
summary(logit)



#  직업만족도: 불만족하는 집단=1, 만족하는 집단=2, 그외의 집단은 NA처리함.
Data$job_satis_group <- ifelse(Data$work_satis <= 2, 1, ifelse(is.na(Data$work_satis) == TRUE, NA, ifelse(Data$work_satis == 3, NA, 2)))

str(Data)
View(Data)

#dummy
#Data$position<-factor(Data$position) _이 코드는 잠시 보류류
logit2<-lm(job_satis_group~parents_asset+income_last_year+language_traing_abroad+helpful_major_knowledge+skill_my_level+position,data=Data)

summary(logit2)
step(logit2)

# 설명력 13%
logit2<-lm(job_satis_group~helpful_major_knowledge+skill_my_level+income_last_year, data=Data)
summary(logit2)





# 직업만족도말고 회사만족도에 관해서
# 만족도 낮은 집단의 그룹과 높은집단의 그룹

job_Data1 <- Data[Data$job_satis_group==1, ]
job_Data2 <- Data[Data$job_satis_group==2, ]
job_Data1 <- com_Data1[is.na(job_Data1$job_satis_group) == FALSE, ]
job_Data2 <- com_Data2[is.na(job_Data2$job_satis_group) == FALSE, ]


# 직업 만족도 높은 집단
upper1<-lm(work_satis~parents_asset, data=job_Data1)
summary(upper1)
upper2<-lm(work_satis~satis_personal, data=com_Data2)
summary(upper2)
upper3<-lm(work_satis~satis_interaction, data=com_Data2)
summary(upper3)
upper4<-lm(work_satis~satis_sociaty, data=com_Data2)
summary(upper4)
upper5<-lm(work_satis~feeling_joyful, data=com_Data2)
summary(upper5)
upper6<-lm(work_satis~feeling_happy, data=com_Data2)
summary(upper6)
upper7<-lm(work_satis~feeling_comfortable, data=com_Data2)
summary(upper7)
upper8<-lm(work_satis~feeling_negative, data=com_Data2)
summary(upper8)
upper9<-lm(work_satis~feeling_lethargic, data=com_Data2)
summary(upper9)
upper10<-lm(work_satis~satis_school_major, data=com_Data2)
summary(upper10)
upper11<-lm(work_satis~satis_school_overal, data=com_Data2)
summary(upper11)
upper12<-lm(work_satis~any_problem_in_com, data=com_Data2)
summary(upper12)
upper13<-lm(work_satis~difficult_used_to, data=com_Data2)
summary(upper13)
upper14<-lm(work_satis~helpful_major_knowledge, data=com_Data2)
summary(upper14)
upper15<-lm(work_satis~work_my_level, data=com_Data2)
summary(upper15)
upper16<-lm(work_satis~skill_my_level, data=com_Data2)
summary(upper16)
upper17<-lm(work_satis~feeling_anoy, data=com_Data2)
summary(upper17)

analysis_upper_group<-lm(work_satis~parents_asset+satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_negative+feeling_lethargic+satis_school_major+satis_school_overal+any_problem_in_com+difficult_used_to+helpful_major_knowledge+work_my_level+skill_my_level+feeling_anoy, data=com_Data2)
analysis_upper_group<-step(analysis_upper_group)
analysis_upper_group<-lm(work_satis~satis_interaction+helpful_major_knowledge+satis_personal+difficult_used_to+feeling_lethargic, data=com_Data2)
summary(analysis_upper_group)
# 이 모델을 쓸 수는 없음.



#직업 만족도가 낮은 집ㄷ
lower1<-lm(work_satis~satis_school_major, data=com_Data1)
summary(lower1)
lower2<-lm(work_satis~satis_school_overal, data=com_Data2)
summary(lower2)
lower3<-lm(work_satis~any_problem_in_com, data=com_Data2)
summary(lower3)
lower4<-lm(work_satis~difficult_used_to, data=com_Data2)
summary(lower4)
lower5<-lm(work_satis~helpful_major_knowledge, data=com_Data2)
summary(lower5)
lower6<-lm(work_satis~work_my_level, data=com_Data2)
summary(lower6)
lower7<-lm(work_satis~skill_my_level, data=com_Data2)
summary(lower7)

analysis_lower_group<-lm(work_satis~satis_school_major+satis_school_overal+any_problem_in_com+difficult_used_to+helpful_major_knowledge+work_my_level+skill_my_level, data=com_Data1)
analysis_lower_group<-step(analysis_lower_group)
summary(analysis_lower_group)

