################################################
# 기계학습을 이용한 빅데이터 분석강좌(3주차)   #
################################################


install.packages(c("dplyr", "ggplot2", "ISLR", "MASS","glmnet",
                   "randomForest", "gbm", "rpart","boot"))

install.packages("ROCR")

library(dplyr)
library(ggplot2)
library(ISLR)
library(MASS)
library(glmnet)
library(randomForest)
library(gbm)
library(rpart)
library(boot)

library(ROCR)

adult <- read.csv("H:/SecureUSB(필요한자료만_주요작업들)_20180918/개인용무_2019/기계학습을이용한빅데이터분석강좌(2019)/오미애_3주차/adult.txt",header=FALSE, strip.white=TRUE)
names(adult) <- c('age','workclass','fnlwgt',
                  'education','education.num','marital.status',
                  'occupation','relationship','race',
                  'sex','capital.gain','capital.loss','hours.per.week','native.country','wage')

head(adult)




##################################
#  binomial_deviance            #
##################################



 binomial_deviance <- function(y_obs, yhat){ 
    epsilon = 0.0001 
     yhat = ifelse(yhat < epsilon, epsilon, yhat) 
     yhat = ifelse(yhat > 1-epsilon, 1-epsilon, yhat) 
     a = ifelse(y_obs==0, 0, y_obs * log(y_obs/yhat)) 
     b = ifelse(y_obs==1, 0, (1-y_obs) * log((1-y_obs)/(1-yhat))) 
     return(2*sum(a + b)) 
 } 
 
 
##################################
#  훈련,검증, 테스트셋 구분      #
##################################

set.seed(1)
n=nrow(adult)
idx <- 1:n

training.idx <- sample(idx,n*.6)

idx <- setdiff(idx,training.idx)  # 나머지
validate.idx <- sample(idx,n*.2)
test.idx <- setdiff(idx,validate.idx)

training <- adult[training.idx,]
validation <- adult[validate.idx,]
test <- adult[test.idx,]

################
##  Logistic
################
ad_glm_full <- glm(wage~., data=training, family=binomial)

y_obs <- ifelse(validation$wage==">50K",1,0)

yhat_lm <- predict(ad_glm_full, newdata=validation, type="response")

### performance

binomial_deviance(y_obs, yhat_lm)

pred_lm <- prediction(yhat_lm, y_obs)

slotNames(pred_lm)

pred_lm@n.pos
pred_lm@cutoffs
pred_lm@fp

dim(validation)
length(pred_lm@cutoffs[[1]])


perf_lm <- performance(pred_lm, measure = "tpr", x.measure = "fpr") 

plot(perf_lm, col='black', main="ROC Curve for GLM")
abline(0,1)
performance(pred_lm, "auc")@y.values[[1]]


#############
# lasso     #
#############

xx <- model.matrix(wage~.-1, adult)
x<- xx[training.idx,]
y <- ifelse(training$wage == ">50K",1,0)

ad_cvfit <- cv.glmnet(x,y,family="binomial")
plot(ad_cvfit)

yhat_glmnet <- predict(ad_cvfit, s="lambda.1se", newx=xx[validate.idx,], type='response')
yhat_glmnet <- yhat_glmnet[,1]

### performance

binomial_deviance(y_obs, yhat_glmnet)

pred_glmnet <- prediction(yhat_glmnet, y_obs)

perf_glmnet <- performance(pred_glmnet, measure = "tpr", x.measure = "fpr") 

plot(perf_lm, col='black', main="ROC Curve ")
plot(perf_glmnet, col='blue', add=TRUE)
abline(0,1)
legend('bottomright', inset=.1,
       legend=c("GLM","glmnet"),
       col=c('black','blue'),lty=1,lwd=2)

performance(pred_glmnet, "auc")@y.values[[1]]



########################
#   Decision Tree      #
########################

cvr_tr <- rpart(wage~. , data=training)

yhat_tr <- predict(cvr_tr, validation)
head(yhat_tr)
yhat_tr <- yhat_tr[,">50K"]

### performance

binomial_deviance(y_obs, yhat_tr)

pred_tr <- prediction(yhat_tr, y_obs)

perf_tr <- performance(pred_tr, measure = "tpr", x.measure = "fpr") 

plot(perf_lm, col='black', main="ROC Curve ")
plot(perf_glmnet, col='blue', add=TRUE)
plot(perf_tr, col='pink', add=TRUE)
abline(0,1)
legend('bottomright', inset=.1,
       legend=c("GLM","glmnet","Decision Tree"),
       col=c('black','blue','pink'),lty=1,lwd=2)

performance(pred_tr, "auc")@y.values[[1]]



########################
#   Random Forest      #
########################

set.seed(1)
ad_rf <- randomForest(wage~., training)
ad_rf

yhat_rf  <- predict(ad_rf, validation, type='prob')[,'>50K']

### performance

binomial_deviance(y_obs, yhat_rf)

pred_rf <- prediction(yhat_rf, y_obs)

perf_rf <- performance(pred_rf, measure = "tpr", x.measure = "fpr") 

plot(perf_lm, col='black', main="ROC Curve ")
plot(perf_glmnet, col='blue', add=TRUE)
plot(perf_tr, col='pink', add=TRUE)
plot(perf_rf, col='red', add=TRUE)
abline(0,1)
legend('bottomright', inset=.1,
       legend=c("GLM","glmnet","Decision Tree","Random Forest"),
       col=c('black','blue','pink','red'),lty=1,lwd=2)

performance(pred_rf, "auc")@y.values[[1]]



########################
#   Boosting           #
########################
set.seed(1)
adult_gbm <- training %>% mutate(wage=ifelse(wage==">50K",1,0))

ad_gbm <- gbm(wage~., data=adult_gbm,
              distribution="bernoulli",
              n.trees=20000, cv.folds=3, verbose=TRUE)
best_iter <- gbm.perf(ad_gbm, method="cv")

best_iter # 20000

yhat_gbm  <- predict(ad_gbm,n.trees=best_iter, newdata= validation, type='response')

### performance

binomial_deviance(y_obs, yhat_gbm)

pred_gbm <- prediction(yhat_gbm, y_obs)

perf_gbm <- performance(pred_gbm, measure = "tpr", x.measure = "fpr") 

plot(perf_lm, col='black', main="ROC Curve ")
plot(perf_glmnet, col='blue', add=TRUE)
plot(perf_tr, col='pink', add=TRUE)
plot(perf_rf, col='red', add=TRUE)
plot(perf_gbm, col='light blue', add=TRUE)
abline(0,1)
legend('bottomright', inset=.1,
       legend=c("GLM","glmnet","Decision Tree","Random Forest", "Boosting"),
       col=c('black','blue','pink','red','light blue'),lty=1,lwd=4)

performance(pred_gbm, "auc")@y.values[[1]]

##############################################
##############################################

binomial_deviance(y_obs, yhat_lm)
binomial_deviance(y_obs, yhat_glmnet)
binomial_deviance(y_obs, yhat_tr)
binomial_deviance(y_obs, yhat_rf)
binomial_deviance(y_obs, yhat_gbm)

performance(pred_lm, "auc")@y.values[[1]]
performance(pred_glmnet, "auc")@y.values[[1]]
performance(pred_tr, "auc")@y.values[[1]]
performance(pred_rf, "auc")@y.values[[1]]
performance(pred_gbm, "auc")@y.values[[1]]

