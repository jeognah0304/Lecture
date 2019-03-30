
N=20; 
x = rnorm(N,mean=167,sd=5)
y = 0.01 + 1.02*x + rnorm(N,sd=2)
Data = data.frame(x,y)  
print(Data)

g0 = lm(y~x, data=Data)
summary(g0)
names(g0)  
g0$coefficients  
g0$residuals  
g0$fitted.values  

x0=172
y0 = g0$coefficients[1] + g0$coefficients[2]*x0
print(y0)

sim.reg.fun(x,y,newx=c(170,167),plot=T)

sim.reg.fun = function(x=x, y=y, 
                       newx=NULL, plot=F){
  Sxy = sum((x-mean(x))*(y-mean(y)))
  Sxx = sum((x-mean(x))^2)
  
  B = Sxy / Sxx   # slope
  B0 = mean(y) - mean(x)*B  # intercept
  
  coef = c(B0,B)
  names(coef) = c("intercept","slope")
  
  pred = B0+B*x
  res  = y-pred
  
  SST = sum((y-mean(y))^2)
  SSE = sum(res^2)
  SSR = SST - SSE
  R2 = SSR/SST
  
  ### anova table
  n = length(y)
  MSE = SSE / (n-2)
  MSR = SSR / 1
  F0 = MSR / MSE
  p.value = 1-pf(q=F0,df1=1,df2=n-2)
  
  c1 = c(SSR,SSE,SST)
  c2 = c(1,n-2,n-1)
  c3 = c(MSR,MSE,NA)
  c4 = c(F0,NA,NA)
  tab = cbind(c1,c2,c3,c4)
  colnames(tab) = c("SS","DF","MS","F")
  rownames(tab) = c("Model","Error","Total")
  tab = round(tab,2)
  
  if(plot==T){
    plot(x,y,main="scatter plot",
         ylab="depedent variable",
         xlab="independent variable")
    abline(a=B0,b=B,col="red")
    R2.lab = paste("R2=",round(R2*100,2),"%",sep="")
    text(x=max(x)*0.99, y=min(y)*1.01, labels=R2.lab)
  }  
  if(!is.null(newx)){
    new.pred = B0 + newx*B
    out = list(coef=coef, res=res, 
               pred=pred, new.pred=cbind(newx,new.pred), R2=R2) 
  } else{
    out = list(coef=coef, res=res, pred=pred, R2=R2)   
  }
  return(out)
}

sim.reg.fun(x=x,y=y,newx=172)


