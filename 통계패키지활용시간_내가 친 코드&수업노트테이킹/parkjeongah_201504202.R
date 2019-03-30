
  ## Regression

  N = 1000
  y = rnorm(N)
  x = y + rnorm(N)
  plot(x,y)
  cor(x,y)
  g0 = lm(y~x)
  summary(g0)
  

  
  ############## making Function ##############

  regfun = function(x=x,y=y,newx=NULL, plot=F){

    b1 = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
    b0 = mean(y) - b1*mean(x)
    
    # Output1 : simple regression estimates(b0,b1)
    coef = c(b0,b1) 
    names(coef) = c("intercept","slope")
    
    SST = sum((y-mean(y))^2)
    SSE = sum((y-(b0+b1*x))^2)
    SSR = SST - SSE
    
    # Output2 : R-squared
    R_squared = SSR / SST
    
    # Output3 : Anova table
    N = length(y)
    MSE = SSE / (N-2)
    MSR = SSR / (N-1)
    teststat.F = MSR / MSE
    p.value = 1 - pf(q=teststat.F, df1=1, df2=N-2)
    
    c0 = c("Regression","Error","Total")
    c1 = c(SSR, SSE, SST)
    c2 = c(1, N-2,N-1)
    c3 = c(MSR, MSE, NA)
    c4 = c(teststat.F, NA,NA)
    
    table = cbind(c0,c1,c2,c3,c4)
    table=as.data.frame(table)
    names(table) = c("source","SS","DF","MS","F0")
    
    # Output4 : Scatter plot
    if(plot==T){
      plot(x,y , xlab="dependent variable",ylab="independent variable")
      title(main="Scatter plot")
      model = lm(y~x)
      abline(model, lwd =0.1 , col="red")
      R2.lab <- paste("R2=", round(R_squared*100,2) , "%" , sep="")
      legend("bottomright", legend= R2.lab, pch=18, col="red")
      func = paste("y=",round(b0,2), "+", round(b1,2),"x")
      text(x=max(x)*0.77,y=median(y), labels=func, col="red")
      
    }
    
    # Output5 : Coefficient Test
    
    coef = c(b0,b1)
    se.b0 = sqrt(MSE*(1/N+mean(x)^2/sum((x-mean(x))^2)))
    se.b1 = sqrt(MSE)/sqrt(1/N+sum((x-mean(x))^2))
    se = c(se.b0 , se.b1)
    t = c(b0/se.b0, b1/se.b1)
    p.b0 = 2*pt(b0/se.b0, N-2, lower.tail=TRUE)
    p.b1 = 2*pt(b1/se.b1, N-2, lower.tail = FALSE)
    
    p = c(p.b0, p.b1)
    
    coeftab=cbind(coef, se, t, p)
    coeftab=round(coeftab, 6)
    rownames(coeftab)=c("intercept","x")
    
    # Output6 : Residuals

    res = y-(b0+b1*x)
    residual = fivenum(res)
    names(residual) = c("Min", "lower-hinge", "median", "upper-hinge", "Max")
    
    # Output7 : Predicted value
    if(!is.null(newx)){
      new.pred = b0 +b1*newx
      out = list(coef, R_squared, table, coeftab, residual, new.pred)
      names(out)= c("coefficient",  "R-squared", "ANOVA table", "coefficient table" , "Residual fivenum","new _ predictive value")
    } else{
      out = list(coef=coef, R_squared = R_squared, ANOVA = table, coef.anova = coeftab, residual = residual)
    }

     return(out)

  } 
  
  

  
  ########################################################
  
  
  y = rnorm(N)
  x = y + rnorm(N)
  
  regfun(x=x,y=y,newx=NULL, plot=TRUE)
  regfun(x=x,y=y,newx=8, plot=TRUE)
  
  regfun(x=cars$speed, y=cars$dist, newx=NULL, plot=TRUE)  
  summary(lm(cars$dist~cars$speed)  )
  regfun(x=cars$speed, y=cars$dist, newx=22, plot=TRUE)  
  
  
  iris = iris[iris$Species=="setosa",]
  regfun(x=iris$Sepal.Length, y=iris$Sepal.Width, newx=NULL, plot=T)  
  summary(lm(iris$Sepal.Length~iris$Sepal.Width)) # 구현이 잘 됬음을 확인함.
  