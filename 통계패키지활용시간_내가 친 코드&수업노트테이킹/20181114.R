


  
  mu = 0 ; S = 2   # mean and standard error
  alpha = 0.05     #significant level
  
  N = 20
  x = rnorm(N, mean = mu, sd = S) # sampling data

  x.bar = mean(x)
  help(qnorm)
  
  qnorm(p=alpha/2)    # -1.96 나옴
  q.val = qnorm(p=alpha/2, lower.tail=F)   
  se = S/sqrt(N)
  
  CI = c(x.bar-q.val*se,x.bar+q.val*se )   
  CI  # 0을포함했네, 
  
  
  
  
  
  mu = 1 ; S = 2   # mean and standard error
  alpha = 0.05     #significant level
  
  N = 20
  x = rnorm(N, mean = mu, sd = S) # sampling data
  
  x.bar = mean(x)
  help(qnorm)
  
  qnorm(p=alpha/2)    # -1.96 나옴
  q.val = qnorm(p=alpha/2, lower.tail=F)   
  se = S/sqrt(N)
  
  CI = c(x.bar-q.val*se,x.bar+q.val*se )   
  CI  # 0을포함안했네
  
  
  
  
  
  # for문을 써보면 위 작업을 100번 할 수 있다.
  # 그래서 신뢰구간을 저장 할 수 도 있고
  # 신뢰구간이 0을 포함하는지 안하는지를 저장할 수도 있다.
  
  

  
  
  nrep = 10
  res.mat = matrix(0, nrow=nrep , ncol=3) # 신뢰상한,하한,0포함여부 :3
  colnames(res.mat) = c("Low", "Upper", "Success")

  count=0
  x = rnorm(N, mean = mu, sd = S)
  Low = x.bar-q.val*se,x
  Upper = x.bar+q.val*se
  if (mu = Low & Upper= mu) (count = count+1)
  count; count/N
  
  
  
  
  
  
  
  ## 종이에 수식 쓰고 그거 보고 코딩하면 됨 ##
  #1 . sigma 제곱 알때(정규분포, 대칭 ㅎ)
  
  nrep = 1000
  for(i in 1:nrep){
    x = rnorm(N, mean=mu, sd=S)

    x.bar = mean(x)
    help(qnorm)
    
    qnorm(p=alpha/2)    # -1.96 나옴
    q.val = qnorm(p=alpha/2, lower.tail=F)   
    se = S/sqrt(N)
    
    CI = c(x.bar-q.val*se,x.bar+q.val*se ) 
    
    res.mat[i,1:2] = CI
    res.mat[i,3] = CI[1] <mu & CI[2] > mu
  }
  
  mean(res.mat[,3])
  
  
  
  
  ## 모분산을 모른다고 하고 신뢰구간을 구한다 하면
  
  #2 . sigma 제곱 모를때, t분포로 사용함(T분ㅍ, 대칭 ㅎ)
  nrep = 1000
  for(i in 1:nrep){
    x = rnorm(N, mean=mu, sd=S)
    
    x.bar = mean(x)
    help(qnorm)
    
    qnorm(p=alpha/2)    # -1.96 나옴
    q.val = qt(p=alpha/2, df = N-1,lower.tail=F)   
    se = sd(x)/sqrt(N)
    
    CI = c(x.bar-q.val*se,x.bar+q.val*se ) 
    
    res.mat[i,1:2] = CI
    res.mat[i,3] = CI[1] <mu & CI[2] > mu
  }
  
  mean(res.mat[,3])

  
  
  
  
  
  
  
  nrep = 100
  res.mat0 = matrix(0, nrow=nrep , ncol=3) 
  res.mat1 = matrix(0, nrow=nrep , ncol=3) 
  
  colnames(res.mat0) = c("Low", "Upper", "Success")
  colnames(res.mat1) = c("Low", "Upper", "Success")
  
  count=0

  for(i in 1:nrep){
    x = rnorm(N, mean=mu, sd=S)
    
    x.bar = mean(x)
    help(qnorm)
    
    qnorm(p=alpha/2)    # -1.96 나옴
    q.val = qt(p=alpha/2, df = N-1,lower.tail=F)   
    se = sd(x)/sqrt(N)
    
    CI = c(x.bar-q.val*se,x.bar+q.val*se ) 
    
    res.mat0[i,1:2] = CI
    res.mat0[i,3] = CI[1] <mu & CI[2] > mu
    
    
    res.mat1[i,1:2] = CI
    res.mat1[i,3] = CI[1] <mu & CI[2] > mu
  }
  
  mean(res.mat0[,3])
  mean(res.mat1[,3])
  
  # 결과가 나와도 나온 결과를 의심한다. 95%가 나오야함
  # t분포와 정규분포를 비교해 보았을 때, t분포가 좀 더 길기 때문에, diffterenc를 비교해보자.

  
  diff(res.mat0[,1:2])
  diff(res.mat1[,1:2])
  
  
  a = res.mat0[,2] - res.mat0[,1]
  b = res.mat1[,2]- res.mat1[,1]
  
  
  
  
  # 강의노트_ 이론을 알아야 읽을 수 있는 코드.
  
  alpha = 0.05
  N= 20
  n=27
  mu=2.5
  sigma=1.3
  count=0
  for(i in 1: N){
    x=rnorm(n,mu,sigma)
    conf_limit_lower = mean(x) - qnorm(1-alpha/2)*sigma/sqrt(n)
    conf_limit_upper = mean(x) + qnorm(1-alpha/2)*sigma/sqrt(n)
    if(mu <= conf_limit_upper & mu >= conf_limit_lower){count=count+1}
  }
  count; count/N   
  
  
  
  
  
  
  
  plot(c(0, 5), c(1, N), 
       xlab = "confidence interval", 
       ylab = "simulation freqneucy", 
       type = 'n') # 빈공간 범위 지정. ->남의 코드를 뜯어보는 작업을 해보자
  abline(v=mu, col="blue", lty=2) # verticalline 그려보기.
  
  
  within_yn <- 0
  
  # 선은 반복의 개수만큼 그려봄.
  # 빗나간건 빨간색으로, 이거 95%의 신뢰구간이라 데이터 20개썻넹..
  for(i in 1 : N) {
    x = rnorm(n, mu, sigma)
    conf_limit_lower = mean(x) - qnorm(1-alpha/2)*sigma/sqrt(n)
    conf_limit_upper = mean(x) + qnorm(1-alpha/2)*sigma/sqrt(n)
    within_yn_eval = mu <= conf_limit_upper & mu >= conf_limit_lower
    if(within_yn_eval) within_yn = within_yn + 1  #within_yn = within_yn + 1 true면 1, false면 2의 output.
    segments(conf_limit_lower, i, conf_limit_upper, i, col=(! within_yn_eval)+1, lty=(! within_yn_eval)+1)
  } 
  
  
  fit <- lm(100/mpg ~ disp + hp + wt + am, data = mtcars)
  confint(fit)
  summary(fit)
  
  counts <- c(18,17,15,20,10,20,25,13,12)
  outcome <- gl(3, 1, 9); treatment <- gl(3, 3)
  glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
  confint(glm.D93) # needs MASS to be installed
  confint.default(glm.D93)  # based on asymptotic normality
    
  
  
  
  
  
  
  
  # 가설검정 시뮬레이션해보기
 t.test(x, alternative = c("two.sided"), mu=63, conf.level=0.95)
 
 
  mu = 63 
  sigma = 8 
  n = 100
  nreps = 100  
  
  inout = rep(0, nreps)  
  
  for( i in 1:nreps){
    x = rnorm(n, mu, sigma)
    lower = t.test(x, alternative = c("two.sided"), mu=mu)$conf.int[1]
    upper = t.test(x, alternative = c("two.sided"), mu=mu)$conf.int[2]
    inout[i] = ifelse(63>=lower & 63<=upper,1,0)

  }
  inout
  
  
  mean(1-inout)

  
  p.value에
  
  
  # p-value를 구하는 방법으로 짜보기
  # 답은 분포가정이 맞다는 가정 하에 위의 결과와 같게 나와야겠지? 0.05에 가까운 값을 구할 수 있어야 함.
  
  
  install.packages("fdrtool")
  library(fdrtool)
  p <- scan("D:\\adnoctum_desktop\\pvalue\\GSE5364.pvalue.txt", what=numeric(0))
  pval.estimate.eta0(p, method="bootstrap")
  
  
  
  
  
  # p-value는 귀무가설(H0)가 옳
  
  
  
  
  
  
  # 대수의법칙(Law of Large number)
  # iid샘플에서 n이 커질때. 표본평균은 mu로 수렴한다.
  
  
  # 동전던지기 
  
  x.vec = sample(c(1,0), size=n, replace=T)
  x.bar = mean(x.vec)  
  
  # 시뮬레이션
  n.seq = 1:5000
  p.vec = rep(0, length(n.seq))
  
  for( i in 1:length(n.seq)){
    n = n.seq[i]
    
    x.vec = sample(c(1,0), size=n, replace=T)
    xbar = mean(x.vec)  
    xbar
    p.vec[i] = xbar
    
  }
  plot(n.seq,p.vec, type="l", ylim = c(0.45,0.55))
  abline(h=.5, col="red")
  
  
  
  
  
  
  
  
  x.vec = sample(c(1,0), size=n, replace=T)
  x.bar = mean(x.vec)  
  
  n.seq = 1:5000
  p.vec = rep(0, length(n.seq))
  
  x = NULL
  for( i in 1:length(n.seq)){
    x = c(x, sample(c(1,0), size=1, replace=T)) # 이런 코딩은 x를 미리 써놔야함.
    xbar = mean(x)
    n = n.seq[i]
    
    x.vec = sample(c(1,0), size=n, replace=T)
    xbar = mean(x.vec)  
    xbar
    p.vec[i] = xbar
    
  }
  plot(n.seq,p.vec, type="l", ylim = c(0.45,0.55))
  abline(h=.5, col="red")
  
rm(list=ls())  
  
  ##################### weak law of large number
  x = NULL
  p.vec = NULL
  eps = 0.001
  n = 0
  
  # 안의 조건이 True면 계속 돌아가는것임.
  # 근데, 거기서 if문을 걸어서 break하면 빠져나와라!
  
  # for문도 이렇게 쓸수는 있음.
  
  while(T){
    n = n+1
  
    x =  c(x, sample(c(1,0), size=1, replace=T))
    xbar = mean(x)
    p.vec = c(p.vec, xbar)
    
    if(n>3000 & abs(xbar - 0.5) < eps) break
  }
plot(p.vec, type="l")
abline(h =0.5, col="red")

  

  con = !(n>3000 & abs(xbar - 0.5) < eps)
  x = NULL
  p.vec = NULL
  eps = 0.001
  n = 0
  xbar=0
    while(con){
      n = n+1
      
      x =  c(x, sample(c(1,0), size=1, replace=T))
      xbar = mean(x)
      p.vec = c(p.vec, xbar)
      con = !(n>3000 & abs(xbar - 0.5) < eps) # condition을 계속 업데이트시켜야하니까, condition이 TRUE, TURE, .... 조건이 만족하는게 FALSE고 그때 break!
      
    }
  p.vec
  plot(p.vec, type="l")
  abline(h =0.5, col="red")
  
  

  
  
  
  
  # 확률론: 수렴속도 계산하기
  
  x = NULL
  p.vec= NULL  
  eps =1e-20  
  n = 0   
  xbar = 0  

  
  while(T){
    n = n+1
    
    x =  c(x, sample(c(1,0), size=1, replace=T))
    xbar = mean(x)
    p.vec = c(p.vec, xbar)
    if(n>3000 & abs(xbar - 0.5) < eps) break # condition을 계속 업데이트시켜야하니까, condition이 TRUE, TURE, .... 조건이 만족하는게 FALSE고 그때 break!
    
  } 
  plot(p.vec)
  