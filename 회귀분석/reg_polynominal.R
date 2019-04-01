# 다항회귀분석 손으로 직접 선 피팅시키는 방법


x = 1:16
y = rnorm(16)

d = data.frame(input,incre)
plot(x,y)


x = cbind(1,x,x^2,x^3,x^4)
B = solve(t(x)%*% x)%*% t(x) %*% y
          B

          
x.vec = seq(0,20,length=20)
newX = cbind(1, x.vec, x.vec^2, x.vec^3, x.vec^4)
f.vec = drop(newX%*%B)


lines(x.vec, f.vec, col="red")


# 그래서 여기서 우리는 몇차까지의 문제를 해결해야 하는지 해보자.
# 다항식에서의 차수를 어떻게 계산 할까

# adjusted R^2 => 각각 제곱차 피팅해보고 얼마나 괜찮게 증가하는지 체크해보면 됨. 그 지점 찾으면 된다.

