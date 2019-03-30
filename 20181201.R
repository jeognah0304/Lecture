



  # minimizing f(x) = exp(-x)+x^2
  par(mfrow=c(1,2))

  f.fun = function(x){
    f = exp(-x) + x^2  # vectorized function
    return(f)
  } 
  
  f.fun(c(0,1))
  x.vec = seq(-10,10, length.out=100)

  f.vec = f.fun(x.vec)
  plot(x.vec, f.vec) # 축의 scale을 확실히 보는게 중요함.
  # 압축한 느낌이거든, 그래서 범위를 x.vec에서 -5부터 시작하는게 좋겠다(너무 폭이 길다)
  
  
  x.vec = seq(-2,2, length.out=100)
  plot(x.vec, f.vec)  # -1부터 1까지 쓰면되겠당  
  
  
  
    x.vec = seq(-1,1, length.out=10000)
    f.vec = f.fun(x.vec)
    plot(x.vec, f.vec)  
    min(f.vec)

    # 최소가되는 x값이 궁금한거니까
    which.min(c(1,-1,2,3)) # 최소가되는 위치를 알려줌
    which.min(f.vec)
    x.vec[which.min(f.vec)] # 최소가되는 x값을 알려줌
    
    # 하나는 그리드랑 골든을 비교할건데, 매트릭스에 최소가되는 포인트 하나는 극대화하는 함수값을 구해볼것
    
    # 빈 매트릭스만들고
    r.mat = matrix(NA,2,2)
    colnames(r.mat) = c("grid","golden")    
    rownames(r.mat) = c("x","f(x)")
    r.mat
    
    # 그리드 데이터 넣어봄
    r.mat[,1] = c(x.vec[which.min(f.vec)],f.vec[which.min(f.vec)] ) 
    
    
    # 골든방법쓰면, ab는 고정값이고 그 외는 계속 업데이트되는 값이라서
    # 내가 찾고자하는 값과 충분히 가까워진 부분 eps(입실론)
    a = -1 ; b=1 ; iter.max = 100 ; eps = 1e-7
    for(iter in 1:iter.max){
      ############
      if(xxxx)break
      
    }    
    # 이게 큰 틀임. 계속 돌려주다가 충분히 가까운 값이면 스탑해야 돌아가는 시간이 적게되지
    # ab와 충분히 가까워지면 브레이크하라는것임.
    a = -1 ; b=1 ; iter.max = 100 ; eps = 1e-7
    r = 0.7 # c계산을 위해 r을 미리 지정해야함/
    for(iter in 1:iter.max){
      c = r*a +(1-r)*b
      d = r*b +(1-r)*a
      
      print(c(a,b,c,d))
      if( f.fun(c)> f.fun(d) ){a = c
        
      } else{
        b = d
      }
      
      if(abs(a-b)<eps) break
      
    } 
    
    a
b    # 최소가 되는 x값은 a든 b든 이렇게 구하면 됨!




    r.mat[,2] = c(a, f.fun(a))

    # 오차가 어느정도는 있겠지만, 이정도면 꽤나 데이터가 근사하게 잘 나온듯
    
    # 몇번계샂ㄴ햇는지 알고싶으면 iter 프린트하면됨.
    
    
    
    # 최대우도추정법을 할때 golden section algorism 으로 하면 
    # mu에 대한 최대우도 구해보면 y.bar가 나오는 것임.
    
    
     y.vec = iris$Sepal.Length
     
     r.mat = matrix(NA,2,2)
     colnames(r.mat) = c("sample.mean","golden")    
     rownames(r.mat) = c("x","f(x)")
     r.mat
    
    f.fun = function(y.vec, mu){
      return(sum((y.vec - mu)^2)) # 여기는 내가 정의한 y.vec
    } 
    
    f.fun(y.vec = y.vec, mu=0) # name = value
    f.fun(cars$speed, 0)
    
    
    n.gird=1000
    a = min(y.vec) ; b=max(y.vec)
    mu.vec = seq(a,b,length.out=n.grid)
    l.vec = rep(NA, n.grid)
    l.vec = c() #이름은 있는데 값은 없는 상태.
    l.vec = rep(NA, n.grid) # NA를 100개 넣은거고, mu컨트롤이 아니라 index 컨트롤하기.
    
    # mu in mu.vec : 그 데이터 하나하나 사이값을 대입해서 돌려보장.
    
    
    # l.vec에 빈공간일때.
    for(mu in mu.vec){ 
      print(l.vec)
      l.vec[] = f.fun(y.vec, mu, vec[]) #mu는 mu.vec에서 가져오는것임.
      # 빈 l.vec에 값 넣어줌. 그래서 빈 객체에 데이터 하나 값이 생기는 것임.
      
    } # 단순할ㄸㅐ 쓰는거..
    
    
    
    
    # l.vec에. NA가 들어있을때.
    for(i in 1:100){ 
      print(l.vec) # 여기는 NA, NA, NA 이런식으로나오게찌?.
      l.vec[i] = f.fun(y.vec, mu, vec[i]) #mu는 mu.vec에서 가져오는것임.
      # 빈 l.vec에 값 넣어줌. 그래서 빈 객체에 데이터 하나 값이 생기는 것임.
      
      
    }  # 복잡할때 쓰는거.
    
    
    
    
    
    
    
    
    
    plot(mu.vec, l.vec) # 해보면 2 근처에 해가 있음을 알 수 있을 것 같다.
    
    
    for(iter in 1:iter.max){
      e = r*a +(1-r)*b
      d = r*b +(1-r)*a
      
      print(c(a,b,c,d))
      if( f.fun(y.vec,c)> f.fun(y.vec, d) ){a = c
      
      } else{
        b = d
      }
      
      if(abs(a-b)<eps) break
      
    } 
    
    a # 알고리즘 돌아가며 나온거고
    b  
    
    
    
    mean(y.vec) # 정확하게 나온것임.
    
    
    # a - mean(y.vec) 이라서 오차를 사용해서 구한거고.
    # 오차를 줄이고 싶으면 eps 값을 매우 줄여서 매우 작은 값으로 만들면
    
    
    # for문에서 break를 만족시켜서 끝날수도 있찌만, 100번 다 돌아가서 지쳐서 끝날수도잇는뎅, 그래서 iterlation도 더 필요해서 그걸 늘여보면 오차가 더 줄어들 수도 있음.
    
    