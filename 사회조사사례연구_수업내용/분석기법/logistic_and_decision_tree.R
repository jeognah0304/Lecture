library(dplyr) #we will present the visualization.
library(ggplot2) 
library(ISLR) 
library(MASS) 
library(glmnet)
library(rpart)
library(boot) 

setwd("C:/Users/parkjeongah/Desktop/working/studying major/사회조사분석사례연구/수업내용/")


adult <-read.csv("adult.txt",header=FALSE, strip.white=TRUE)

str(adult)
View(adult) # variables have no names.

# seting the variable's names
names(adult) <- c('age','workclass','fnlwgt', 'education','education-num','marital-status', 'occupation','relationship','race', 'sex','capital-gain','capital-loss','hours-per-week','native-country','wage')


head(adult)
# we can see the data's information
glimpse(adult)

summary(adult)

levels(adult$wage)


levels(adult$race)
levels(adult$sex)



# we made design matrix.

x <- model.matrix(~race + sex + age, adult)

#x라는 변수명에 matrix집어넣으면, list값으로 나옴
#dummy변수 만들때 자동으로 만드는 코드가 model.matrix임.

head(x)






# traing, validat, test

set.seed(1) ;n=nrow(adult) ;idx <- 1:n

#idx <=몇퍼센트 뽑을지의 index임
training.idx <- sample(idx,n*.6)
idx <- setdiff(idx,training.idx)  # 나머지 
validate.idx <- sample(idx,n*.2) 
test.idx <- setdiff(idx,validate.idx)



?setdiff 
#나머지 설명: trainding.idx중 뽑히지 않은 40퍼센트를 idx로 다시 덮어씌운 행동임.
# 그 나머지를 idx로 저장한거고, 40퍼센트의 인덱스만 idx로 남아있는거고
#거기서 전체의 20퍼센트를 validation index로 줄것임.
#나머지 또 차이를 test.idx로 줌.


length(training.idx) ;length(validate.idx) ; length(test.idx)



# selecing.

training <- adult[training.idx,] 
validation <- adult[validate.idx,] 
test <- adult[test.idx,]


# we will have to do this work over 100 times




# visualization. 구분자는 wage임.
training %>%
  ggplot(aes(age,fill=wage)) +  geom_density(aplha=.5)





#logistic. training set이용.
ad_glm_full <- glm(wage~., data=training, family=binomial)
summary(ad_glm_full)

#summary가지고 변수의 유의성과 모델에 대한 걸 다 분석해보면됨.
# 변수선택 하고싶다? stepwise방법쓰면되여

summary.glm(ad_glm_full)



#예측을 해보자
predict(ad_glm_full, newdata=adult[1:5,], type="response")
# 확률값으로 값이 나오는데 이 확률값을 가지고 어떻게 판단을 할까요??? 몇을 기준으로 0과 1을 나눌까 판단해야해

#adult데이터에서 1번째부터 5번째 행까지 x변수를 집어넣었고
#그랬더니 각각 확률값이 이런식으로 나옴.

#모형을 구축할때는 validat. test셋을 쓰지 않았어여
#뒷부분 validat set으로 실제값과 예측값의 차이를 볼거구여
#그럴려면 valdiat set의 wage라는 값을 가지고 50k보다 클때는1 아니면 0인걸 부여할거얌

y_obs <- ifelse(validation$wage==">50K",1,0)
print(y_obs)

# 확률값 나올거야.
yhat_lm <- predict(ad_glm_full, newdata=validation, type="response")



#분류하는 과정임
pre_y_obs <-(yhat_lm >= 0.5)*1


# we will present table
table(y_obs, pre_y_obs)

#y_obs :real data, pre_y_obs:predicted data

dim(validation) 

#accuracy계싼?
(4571+951)/6512














#deicision tree
cvr_tr <- rpart(wage~. , data=training)
cvr_tr

 # 몇으로 어떻게 쪼갰는지 step별로 다 나옴

summary(cvr_tr) #node number, observation 다 나옴

# drawing decision tree graph
opar <- par(mfrow=c(1,1),xpd=NA)
plot(cvr_tr) 
text(cvr_tr, use.n=TRUE) 
par(opar)


# decision tree -> 일관적인 결과를 얻기 어렵다.
# seed값을 일정하게 둬야 일관적인 결과를 얻을 수 있다(고정시켜야함)





# 목적이 예측이라고 하면, 로지스틱회귀분석이든 y값이 연속형이면 회귀분석이 더 나을 수 있고
# deicision tree 적용해서 비교해보는 것도 좋은 방법중에 하나.


