
#########################################1.번문제.
  n = rnorm(n=20, mean=2, sd=2)
  x.bar = mean(n)
  
  confint(x.bar, level=0.95) # why error?
  
  
  N=1000
  count= 0
  x.bar = mean(n)
  x.sd = sd(n)
  
  lower.con = NULL
  upper.con = NULL
  

  
  func = function(N){
    for(i in 1:N){
      x[i] = rnorm(n=20, mean=2, sd=2)
      x.bar[i] = mean(x[i])
      x.sd[i] = sd(x[i])
      
      
     lower.con[i] = x.bar[i] - (x.sd[i]/sqrt(20))*1.96 # 신뢰수준95%
     upper.con[i] = x.bar[i] + (x.sd[i]/sqrt(20))*1.96 


    if((lower.con[i]<2) & (upper.con[i] >2)){
    
      count <- count[i]+1}
    }
  }
  print(count)
  
  func(N=1000)
  
  
  
  ## 함수짜기전에 친 코드... 
  x = rnorm(20,2,2)
  x.bar = mean(x)
  x.sd = sd(x)
  
  lower.con = x.bar - (1.96*x.sd)/sqrt(20)
  upper.con = x.bar + (1.96*x.sd)/sqrt(20)
  
  lower.con
  upper.con # 2포함
  
  if(lower.con<2 & upper.con >2) {
    count = 0 
    count <- count+1
  }
  count
  ####
  
  
  ########################################2-1. 절편있는 단순선형회귀모형.
  
  x = rnorm(20)
  y = 1 + 2*x + rnorm(20)
  
  newx=NA
  plot = T
  
  
  
  my.reg.fun1 = function(x=x, y=y, newx=newx, intercept=T, plot=T){
    
    # coef
    
    Sxy = sum((x-mean(x))*(y-mean(y)))
    Sxx = sum((x-mean(x))^2)
    y.bar = mean(y) ; x.var = mean(x)
    b1 = Sxy / Sxx
    b0 = y.bar - b1*x.var
    
    Coef = c(b0,b1)
    Pred = b0+b1*x 
    Res = y - Pred 
    
    SST = sum((y-mean(y))^2)
    SSE = sum(Res^2)
    
    R2 = (SST-SSE)/SST 
    
    new.pred = b0+b1*newx

    
    
    subname = paste("y=",round(b0,2),"+",round(b1,2))
    
     if(plot=T){
       plot(x, y, xlab="independent variable(x)", ylab="dependent variable(y)", main="Scatter Plot", sub=subname) }
    
    
    resul1 = list(Coef, Pred, Res, R2, new.pred)

    if(!is.na(newx=NA)){
      new.pred = b0+b1*newx
      resul1 = list(resul1, new.pred)
      
    }
    print(resul1)
    
    names(resul1) = c("Coef", "Pred", "Res","R2","new.pred")
      
    
    
  }
  print(resul1)
  
  
  
  
  
  
  
  #########################################2-2. 절편없는. 단순선형회귀모형.
  my.reg.fun2 = function(x=x, y=y, newx=newx, intercept=T, plot=T){
    
    # coef
    
    Coef = sum(x*y)/sum(x^2)
    
    Pred = Coef*x 
    Res = y - Pred 
    
    SST = sum((y-mean(y))^2)
    SSE = sum(Res^2)
    
    R2 = (SST-SSE)/SST 
    
    new.pred = Coef*newx
    
    
    
    subname = paste("y=",round(Coef,2))
    
    if(plot=T){
      plot(x, y, xlab="independent variable(x)", ylab="dependent variable(y)", main="Scatter Plot", sub=subname) }
    
    
    resul1 = list(Coef, Pred, Res, R2, new.pred)
    
    if(!is.na(newx=NA)){
      new.pred = Coef*newx
      resul1 = list(resul1, new.pred)
      
    }
    print(resul1)
    
    names(resul1) = c("Coef", "Pred", "Res","R2","new.pred")
    
    
    
  }
  print(resul1)
  
  
  
  
  
  
  
  
  
  
  
  ######################################### 3. 회귀계수에 대한 최소제곱추정량 ->일치성 갖는지 보이기 위해 보자
  
  
  x = runif(n=100, min=0, max=1)  
  y = 3*x + rnorm(n=100, mean=0, sd=1)
    
  plot(x,y)
  

  
  func = function(n=n){ 
    
    for( i in 1:length(y)){
    Sxy = sum((x-mean(x))*(y-mean(y)))
    Sxx = sum((x-mean(x))^2)
    y.bar = mean(y) ; x.var = mean(x)
    b1 = Sxy / Sxx
    b0 = y.bar - b1*x.var
  }
    
    }