


# Simulation

N = 20; P=3
x = matrix(rnorm(N*P), N,P)
tB = c(1, -1, 0.5, 0) #0이 계수인것: 노이즈변수.
X = cbind(1,x) # design matrix
Y = X %*% tB + rnorm(N) #(n개의 직선위에서의 값. 에러더해져서 나온 것)


#REAL
data= data.frame(Y,X)
g0 = lm(Y~., data=data)
summary(g0)  


N = 100000; P=3 # N의개수가 작아서 제대로 분석했는지 알 수 없거든 그래서 데이터갯수를 늘려봐야함.
x = matrix(rnorm(N*P), N,P)
tB = c(1, -1, 0.5, 0) #0이 계수인것: 노이즈변수.
X = cbind(1,x) # design matrix
Y = X %*% tB + rnorm(N)
#REAL
data= data.frame(Y,X)
g0 = lm(Y~., data=data)
summary(g0)  




# 계속 데이터 돌리면서 R이 뭘 하고 있나
# 항상 데이터부터 생각하는게 아니라 Population을 생각해야해.
# 여기서 beta hat. R-squared 등등을 구할 수 있음.
# 계속 샘플링 할때마다 데이터는 달라지겠지.

#n이 커지면 beta hat으로 간다. 그 부분에 대한 시뮬레이션으로 위의 N을 키우면 더 true Beta에 가까워짐.
# 너무 단순한 data structure라서 100개만 되도 간단하게나옴.
# ->x간의 correlation이 거의 없는 데이터라서 그래, 원ㄹ는 데이터 사이즈가 커야함.



# input :::  X = including intercept
#       :::  Y =


r2.fun = function(X,Y){
    N = length(Y)
    P = ncol(X)-1
    hB = solve(t(X)%*%X)%*%t(X)%*%Y # Modeling

    # adjusted R-square 구해보자 N = 20; P=3
    H = X %*% solve( t(X)%*%X )%*%t(X) #idempotent, symetrix, positive semi matrix(모든 eigenvalue >=0 ), singular matrix
    solve(H)
    eigen(H) #0보다 큰 eigen value 4개.

    one = rep(1,N)
    Hx = X %*% solve( t(X)%*%X )%*%t(X) 
    H1 = one %*% solve( t(one)%*%one )%*%t(one)
    I = diag(1,N)


    SST = t(Y) %*%(I - H1)%*%Y # y-y.bar의 편차벡터를 I-H1로 표현, 정사영개념을 이용.
    SSR = t(Y) %*%(Hx - H1)%*%Y
    SSE = t(Y) %*%(I - Hx)%*%Y

    R2 = 1 - SSE/SST
    adj.R2 = 1 - (SSE/(N-P-1))/(SST/(N-1))
    
    
    out = c(R2, aR2)
    names(out) = c("R2", "adj-R2")
    return(out)
}


r2.fun(iris$Sepal.Length, iris$Sepal.Width) 


## R-squared






## For 문 돌려보기.
N = 100; P=10
x = matrix(rnorm(N*P), N,P)
tB = c(1,c(1,1,1)/2, rep(0,P-3)) #0이 계수인것: 노이즈변수.
X = cbind(1,x) # design matrix 
dim(X)
Y = X %*% tB + rnorm(N)


res = matrix(Inf, P, 2) # R-squared가 0일수도 있어서 default로 Inf,NA로 만들며 됨.
for(i in 2:(P+1)){
  tmp = r2.fun(X[,1:i], Y) # i-th 모델
  res[(i-1),] = tmp
}


## => r2.fun =>Error in solve.default(H) : 
# system is computationally singular: reciprocal condition number = 8.31363e-21

# error고치기.


# 그래서 adj-R2와 R2를 비교해보면서 해야 함.
# 변수선택하는 개념 -> 얼만큼 퍼포먼스가좋아지는지 거기서 변수선택을 체크해야함.