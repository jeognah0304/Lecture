setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/기말고사 데이터 작업 내용")
rawdata<-read.csv("2016_panel_data.csv")
dim(rawdata) #n=18082, p=1222

# y변수 gp1510400을 일딴뺏음.
y_var<-c("gp1510399","gp1510770","gp1510400")

#x변수
x_var<-c("gp1511195","gp1511196","gp1511043","gp1511044","gp1511045","gp1511046","gp1511047","gp1511048","gp1511049","gp1511050","gp1511051","gp1510809","gp1510763","gp1510739","gp1510659","gp1510660","gp1510426","gp1510427","gp1510405","gp1510401","gp1510402")

Data<-rawdata[,c(y_var,x_var)]
str(Data)

dim(Data)

library(reshape)
Data<-rename(Data, c(gp1510399="com_satis",gp1510400="work_satis"))
Data<-rename(Data, c(gp1511195="parents_asset",gp1511196="income_last_year",gp1511043="satis_personal",gp1511044="satis_interaction",gp1511045
                     ="satis_sociaty", gp1511046="feeling_joyful",gp1511047="feeling_happy",gp1511048="feeling_comfortable",gp1511049="feeling_anoying",gp1511050="feeling_negative",gp1511051="feeling_lethargic",gp1510809="language_traing_abroad",gp1510770="position",gp1510739="major_concordance",gp1510659="satis_school_major",gp1510660="satis_school_overal",gp1510426="any_problem_in_com"))
Data<-rename(Data, c(gp1510427="difficult_used_to", gp1510405="helpful_major_knowledge",gp1510401="work_my_level",gp1510402="skill_my_level"))

str(Data)
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
Data$any_problem_in_com<-ifelse(Data$any_problem_in_com=-1,NA, Data$any_problem_in_com)
Data$any_problem_in_com<-ifelse(Data$any_problem_in_com==2,0, Data$any_problem_in_com)

# 그냥 회귀분석 변수 다 치고 stepwise 쓰니까 p-value=NA 떠서 하나하나 선택하고
# 이상한 변수 일단 처음부터 빼고 다 넣어서 step-wise방법을 씀.
Data<-as.data.frame(Data)

regres<-lm(work_satis~satis_personal+satis_interaction+satis_sociaty+feeling_joyful+feeling_happy+feeling_comfortable+feeling_anoying+feeling_negative+feeling_lethargic+major_concordance+satis_school_major+satis_school_overal+any_problem_in_com+helpful_major_knowledge+work_my_level+skill_my_level, data=Data)
final_regres<-step(regres)
summary(final_regres)

plot(final_regres)


#  불만족하는 집단=1, 만족하는 집단=2, 그외의 집단은 NA처리함.
Data$group_satis <- ifelse(Data$com_satis <= 2, 1, ifelse(is.na(Data$com_satis) == TRUE, NA, ifelse(Data$com_satis == 3, 0, 2)))

# Data_1 : 직업에 불만족하는 집단, Data_2 : 직업에 만족하는 집단
Data_1 <- Data[Data$group_satis==1, ]
Data_2 <- Data[Data$group_satis==2, ]
Data_1 <- Data_1[is.na(Data_1$group_satis) == FALSE, ] #NA처리
Data_2 <- Data_2[is.na(Data_2$group_satis) == FALSE, ] #NA처리

dim(Data_1)
dim(Data_2)

# 평균 차이있다.(분산분석 결과)
a1<-table(Data_1$satis_interaction)
b1<-table(Data_2$satis_interaction)

data1<-data.frame(a1,b1)
t.test(data1$Freq, data1$Freq.1)

# 평균차이없다.
a2<-table(Data_1$major_concordance)
b2<-table(Data_2$major_concordance)

data2<-data.frame(a2,b2)
summary(aov(Freq~Freq.1, data=data2))
t.test(data2$Freq, data2$Freq.1)
chisq.test(a2,b2)

# 평균 차이있다.(분산분석 결과)
a3<-table(Data_1$satis_school_major)
b3<-table(Data_2$satis_school_major)

data3<-data.frame(a3,b3)
summary(aov(Freq~Freq.1, data=data3))
chisq.test(a3,b3)


# 평균차이없다.
a4<-table(Data_1$any_problem_in_com)
b4<-table(Data_2$any_problem_in_com)

data4<-data.frame(a4,b4)
summary(aov(Freq~Freq.1, data=data4))
chisq.test(a4,b4)


# 평균차이없다.
a5<-table(Data_1$helpful_major_knowledge)
b5<-table(Data_2$helpful_major_knowledge)

data5<-data.frame(a5,b5)
summary(aov(Freq~Freq.1, data=data5))
chisq.test(a5,b5)

# 평균차이없다.
a6<-table(Data_1$work_my_level)
b6<-table(Data_2$work_my_level)

data6<-data.frame(a6,b6)
summary(aov(Freq~Freq.1, data=data6))
chisq.test(a6,b6)


#그 외에 평균이 차이가 있는지
#직위에 따라 만족도 평균이 차이가 잇음
a7<-table(Data_1$position)
b7<-table(Data_2$position)

data7<-data.frame(a7,b7)
summary(aov(Freq~Freq.1, data=data7))
chisq.test(a7,b7)

# 평균차이 있음
a8<-table(Data_1$parents_asset)
b8<-table(Data_2$parents_asset)

data8<-data.frame(a8,b8)
summary(aov(Freq~Freq.1, data=data8))
chisq.test(a8,b8)

#### # 평균차이없음.
a9<-Data_1$income_last_year #1512개
b9<-Data_2$income_last_year #1370개
b9_1<-c(b9,rep(NA,142))

data9<-data.frame(a9,b9_1)
summary(aov(a9~b9_1, data=data9))
t.test(a9, b9_1, data=data9)


#### # 분산분석결과 유의한 차이가 있다.
a10<-table(Data_1$satis_personal)
b10<-table(Data_2$satis_personal)
data10<-data.frame(a10,b10)

summary(aov(Freq~Freq.1, data=data10))


#### # 분산분석결과 유의한 차이가 있다.
a11<-table(Data_1$satis_sociaty)
b11<-table(Data_2$satis_sociaty)
data11<-data.frame(a11,b11)

summary(aov(Freq~Freq.1, data=data11))



#### # 분산분석결과 유의한 차이가 있다.
a12<-table(Data_1$feeling_joyful)
b12<-table(Data_2$feeling_joyful)
data12<-data.frame(a12,b12)

summary(aov(Freq~Freq.1, data=data12))



### 분산분석결과 유의한 차이가 있다.
a13<-table(Data_1$feeling_happy)
b13<-table(Data_2$feeling_happy)
data13<-data.frame(a13,b13)

summary(aov(Freq~Freq.1, data=data13))





### 분산분석결과 유의한 차이가 있다.
a14<-table(Data_1$feeling_comfortable)
b14<-table(Data_2$feeling_comfortable)
data14<-data.frame(a14,b14)

summary(aov(Freq~Freq.1, data=data14))




### 분산분석결과 유의한 차이가 있다.
a15<-table(Data_1$feeling_anoying)
b15<-table(Data_2$feeling_anoying)
data15<-data.frame(a15,b15)

summary(aov(Freq~Freq.1, data=data15))






### 분산분석결과 유의한 차이가 있다.
a16<-table(Data_1$feeling_negative)
b16<-table(Data_2$feeling_negative)
data16<-data.frame(a16,b16)

summary(aov(Freq~Freq.1, data=data16))








### 분산분석결과 유의한 차이가 있다.
a17<-table(Data_1$feeling_lethargic)
b17<-table(Data_2$feeling_lethargic)
data17<-data.frame(a17,b17)

summary(aov(Freq~Freq.1, data=data17))










### 분산분석결과 유의한 차이가 있다.
a18<-table(Data_1$language_traing_abroad)
b18<-table(Data_2$language_traing_abroad)
data18<-data.frame(a18,b18)

t.test(data18$Freq, data18$Freq.1)

### 분산분석결과 유의한 차이가 없다.
a19<-table(Data_1$satis_school_overal)
b19<-table(Data_2$satis_school_overal)
data19<-data.frame(a19,b19)

t.test(data19$Freq, data19$Freq.1)
summary(aov(Freq~Freq.1, data=data19))

### 분산분석결과 유의한 차이가 없다.
a20<-table(Data_1$difficult_used_to )
b20<-table(Data_2$difficult_used_to )
data20<-data.frame(a20,b20)

t.test(data20$Freq,data20$Freq.1)

### 분산분석결과 유의한 차이가 있다..
a21<-table(Data_1$skill_my_level)
b21<-table(Data_2$skill_my_level)
data21<-data.frame(a21,b21)

t.test(data21$Freq, data21$Freq.1)

### 분산분석결과 유의한 차이가 있다..
a22<-table(Data_1$feeling_anoy )
b22<-table(Data_2$feeling_anoy )
data22<-data.frame(a22,b22)

summary(aov(Freq~Freq.1, data=data22))




boxplot(a1,b1)
boxplot(a2,b2)
boxplot(a3,b3)
boxplot(a4,b4)
boxplot(a5,b5)
boxplot(a6,b6)
boxplot(a7,b7)
boxplot(a8,b8)
boxplot(a9,b9)
boxplot(a10,b10)
boxplot(a11,b11)
boxplot(a12,b12)
boxplot(a13,b13)
boxplot(a14,b14)
boxplot(a15,b15)
boxplot(a16,b16)
boxplot(a17,b17)
boxplot(a18,b18)
boxplot(a19,b19)
boxplot(a20,b20)
boxplot(a21,b21)
boxplot(a22,b22)


oecd_data<-read.csv("2013_job_quality.csv")
str(oecd_data)
print(oecd_data)
dim(oecd_data)
oecd<-na.omit(oecd_data)

View(oecd_data)


fivenum(oecd$Labour.market.insecurity) #이직을 잘 하지 않고
fivenum(oecd$Earnings.quality)  # 직업의 질적인 측면이 좋지 않다.
str(oecd)
View(oecd) # compare with portugal&korea


