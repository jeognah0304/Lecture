
######################## 중간고사 ########################

# 수의모임 ; 벡터


#길이, dimention( dim, length함수 쓰기)
#어떤타입의 변수? class라는 함수 쓰면 됨
# numeric인가, charactor인지 알 수 있음.

length(x2)





id <- 1:100
data1 <- rnorm(100)
data2 <- rnorm(100)

Data <-cbind(id, data1, data2)
Data

length(Data)
dim(Data)


x = Data[,2]
y = Data[,3]

x+y


# 연산우선순위 ->괄호
1:(10-1)



seq(1,10,by=2)
seq(2,11,by=2)
seq(from=0,to=100,length=10)

rep(3, 4)
replication<-rep(data1,4)
length(replication)


#sample을 외울필요는 없음

rep(1:2, each=3)
rep(1:2, times=3)
rep(1:2, length=3)


# logical vector? 논리연산자를 이용해서 내가 원하는 데이터셋을 뽑아낼 수 있다.


x <- c(11,22,33,44)
a = x>20

class(x)
class(a) 



x[a] #20보다 큰 애를 이런식으로 뽑아도 된다.


y <- seq(12,30,length=19)
y

y
u <- c(5,2,8)
v <- c(1,3,9)

u+v


##4. NA, NULL
#외부에서 엑셀 데이터에서 읽어올거임.

# missing value, 결측치 = NA

# missingvalue가 없을때, 그 부분 데이터를 빼고 구할 수 있지만
# y=수학능력, x1=국어 x2=영어 x3=수학 Gen 변수
# 만약 x3라는 값이 없다? 여기에 회귀분석 아이디어를 넣고
#결측값대처를 할 수 있음(이건 데이터마다 다른데, 데이터에 대한 아무런 정보가 없다면 평균값을 넣기도 한다)


y=1:5
mean(y)
median(y)
sd(y)
range(y)
range(y)
quantile(y)

summary(y)




x <- c(88, NA,12, 168,13)
mean(x)
mean(x, na.rm=TRUE)
mean(x, na.rm=FALSE)

ls()                # R workspace: 작업공간에 얼마나 많은 객체가 있는지 보여주는 함수


a <-1:88
c(a,13)


a = NULL
a

c(a,13)


NULL #변수를 초기화 시킬 때 유용한 값의 형태이다.(빈공간)



w <- NULL #객체가 만들어진거지만 값은 만들어지지 않은 것.




#필터링

x <- 10:1
x


x[3]
x[c(5,6)]
x[-c(5,6)]



x>5 #logical vector. x의 벡터크기를 따라간다.
x[x>5] # [] <- means extracting the data


x[x<3] <- 1 #특정조건을 만족시키는 벡터의 위치에 어떤 값을 치환할 수도 있다.


x[x<3] <- 3:5

x



# subset function
x <- c(6,1:3, NA, 12)
x

x[x>5] # note : All results appeared including NA

subset(x, x>5) # All results is turned out excluding NA

x


is.na(x) # we can find which area has NA

#if you want to clean NA from your data
x <- x[!(is.na(x))]

x
which(x> 5) #show me location which is larger than 5th 


# poosible code

x
which(is.na(x))



any(x>20) # result can appear if one is larger than 20


x=1:10
y = c(2,7,11)


x %in% y   # is x in y?  

y %in% x



?match # match function shows each element' location
#x의 각 원소가 벡터에 포함된 위치가 어디인가?
x <- c(3,1,4,1)
match(x, c(2,1,4))




str(iris)


#A회사 B회사 : 30개월 계약직

a회사 월급 1000만원 매달
b회사 월급 1원 2월 4원 8원,.... 2^30원

n = 30
a <- sum(1000*n)

b <- function(n){
  for (i in 1:n){
    summary <- 0
    summary <- 2^i
  } 
  print(summary)
}

b(30)



#답.

b <- 2^(0:29)
sum(b)

sum(b)/10000
sum(a)/10000  



a = rep(1000000, 30)
b = 2^((1:30)-1)

sum(a)
sum(b)




N = 40
a = rep(10000000, N)
b = 2^((1:N)-1)
sum(a)
sum(b)


sample(1:100, size=N) 


#동전던지기

  N = 1000000
  x <- sample(c(1,0), size=N, replace=T) # 앞면나오는개수
  sum(x) ; mean(x)

  # 통계학 : 대수의법칙. (시뮬레이션)
  
  
  
  # 정규분포 난수추출을 해보자
  
  N = 1000
  x = rnorm(N, mean=1, sd=sqrt(2))
  mean(x) ; var(x)

  # mean = consistency  
  # x.bar is converging the mu.
  
  
  
  
  N = 20
  x = sample(50:100, size=N)
  y = sample(c("M","F"), size=N, replace=T)  

  m.score = x[y=="M"]  
  f.score = x[y=기="F"]
  
  mean(m.score) ; mean(f.score) # 두개의 structure을 합쳐서 계산할 수 없겠네 =>내가 코드 실수하는 부분이니까 조심하기
  
  # 독립표본 t-test 계산식 잊지말기
  
  
  
  
  

  
  
  
  
  
  
  
  # Matrix : 수의 직사각형 배열
  
  
  # making matrix
  y = matrix(1:4, nrow=2, ncol=2) # default "byrow=F"
  y
  ?matrix
  y = matrix(1:4, nrow=2, ncol=2, byrow=T)
  
  matrix(1:4, nrow=2)
  matrix(rep(3,6),nrow=3)
  matrix(0,3,2)

  
  y = matrix(1:8, nrow=4)  
  
  # indexing
  y[1,]
  y[,1]
  y[2,2]
  y[3,2] # element.
  
  
  y[2:3,]
  y[,1:2]  
  
  class(y) # what is the type of y? "matrix"
  
  class(y[1,]) # integer : vector(정수형식)
  class(y[,1]) # integer : vector(정수형식)
  
  #벡터(길이)
  #행렬 행의수,열의수(차원)
  
  
  
  length(y)
  dim(y)
  nrow(y)
  ncol(y)  

  x = y[,1]
  class(x)  
  is.matrix(x)  

  dim(x) # x can be somthing when x is matrix
  
  length(x)
  y = t(as.matrix(x)) #making x as matrix, and then we can calculate X transposition
  
  length(y)
  dim(y)  


  y = matrix(nrow=2, ncol=2)  # all elements is NULL
  y[1,1] = 1
  y[1,2] = 2 # not available
  
  y[1,1] <- 1
  y[1,2] <- 2 # available
  
  y[2,1:2] = c(3,55)
   
  # function related with matrix
  
  attributes(y) # similar as dim(y)
  class(y) # type of data
  ncol(y)
  nrow(y)
  
  
  
  # calculation of linear algebra in matrix
  
  a = matrix(c(1:-1,2:0,1,1,3),3,3)
  b = matrix(rep(c(1,2,3), each=3),3,3)  
  a;b  
  
  # mutiply between matrics #dimension is very important
  a+b;a-b
  3*a   # multiply number at all matrix's elements
  a%*%b # multiply between matrics(행백터와 열백터의 내적이 원소가 됨.) 
  
  
# we have to think dimension of matrix when you have to calculate multiply matrics
  
# det|A| is not 0 when we have to solve inverse matrix
  det(a)
  solve(a) # inverse matrix

# what is inverse matrix?
  a%*%solve(a) # results I matrix(identity matrix)


  svd(a)$d # eigenvalue  value
  
  c = matrix(1, 4,3)
  a%*%c # there is no match between dimensions.
  c%*%a
  
  
  det(a) ; solve(a)
  det(b) ; solve(b) # b don't have inverse matrix
  
  # Ax = b 
  
  
  # Linear equation.
  A = matrix(c(1,2,3,4), ncol=2)
  X = c("x","y")   # we are interested in X vector.
  b= c(4,2)

  
  det(A) # determant(A); X = solve(A)%*%b  # 1. solve X

  
  # eigenvector eigenvalue
  eigen(A)
  
  
  getwd() # where is your workspace?
  list.files()
  
  
  # images -> save the data,
  # 몇개의 픽셀로 잘랐냐에 따라 픽셀이 달라짐
  # 회색 ->1024*1024
  
  
  # 이미지데이터는 결국 행렬이다.
  # 이미지 데이터를 행렬로 변환하는 함수가 있을 것이다.
  
  #pixmap ->안에 여러가지 함수가 있는데, 파일을 읽어서 데이터를 매트릭스로 나타냄.
  
  install.packages("pixmap"); library(pixmap)
  setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
  
  getwd() #checking working drectory.
  list.files() # showing file's name in the working drectory : character vector.
  
  mtrush1 <- read.pnm("mtrush1.pgm")
  
  
  #higer ->black,
  #lower -> white
  
  str(mtrush1) # We can see the data's information.
  
  mtrush1
  
  #Pixmap image               information image.
  #Type          : pixmapGrey 
  #Size          : 194x259 
  #Resolution    : 1x1 
  #Bounding box  : 0 0 259 194 
  
  plot(mtrush1)  # that means picture can be presented by matrix.
  
  
  mtrush1@grey # We can see total matrix
  mtrush1@channels
  mtrush1@size
  mtrush1@cellres
  mtrush1@bbox
  mtrush1@bbcent
  
  
  
  mtrush1@grey[1:11,1:6] #비정형데이터,
  # 이미지, 음성파일도 분석하려 함.
  
  # 이미지 자체도 숫자화 시켜서 분석을 해야겠지
  
  
  
  str(mtrush1) # showing class.
  
#  Formal class 'pixmapGrey' [package "pixmap"] with 6 slots      ->class : need to check pixmapGrey 
  #  ..@ grey    : num [1:194, 1:259] 0.31 0.259 0.231 0.216 0.204 ...
  #..@ channels: chr "grey"
  ##..@ size    : int [1:2] 194 259
  #..@ cellres : num [1:2] 1 1
  #..@ bbox    : num [1:4] 0 0 259 194
  #..@ bbcent  : logi FALSE
  
  
  
  
  image.mat <- mtrush1@grey
  class(image.mat) # matrix. -> it can make image.
  
  image.mat[28,88] # pointing one 
  
  
  
  # changing the color from image to white.
  x = mtrush1
  x@grey[20:80, 20:80] = 1
  plot(x)
  
  
  x@grey[20:30,40:60] = 0
  plot(x)  
  
  
  
  
  # making randomized noise by using runif
  
  y <- mtrush1@grey[20:80, 20:80] 
  rand <- runif(length(y), min=0, max=1)
  n.mat <- matrix(rand, nrow=nrow(y))  

  t <- 0.01
  
  mtrush1@grey[20:80, 20:80] <- t*y + (1-t)*n.mat

  plot(mtrush1)  

  
  
  mtrush1@grey[20:30,40:60] = 0
  plot(mtrush1)    

  
  # t*y + (1-t)*n.mat means?
  # sum(weight)=1 : convex combination
  
  
  
  
  # filtering of matrix
  
  
  x <- matrix(c(1:3,2:4), nrow=3)
  
  
  # if i want to selecting it larger than 3 from 2rd row's data
  logic <- x[,2]>3
  x[logic]  

  
  # logical vector _ checking lecture note.
  
  

  
  # adding/delecting col and row
  
  A <-  matrix(runif(100), ncol=10)
  vector <- runif(10)  
  data<-cbind(A,vector)  
  
  
  dim(A)
  length(vector)  
  dim(data)  
  
  
  
  z= matrix(c(1:4, rep(1,4), rep(0,4)), 4, 3)
  hh = rep(100,3)
  rbind(hh,z)
  rbind(z,hh)
  
  ?sample  
  x = sample(50,100,size=10)
  # from 50 to 100, randomly selecting the data size=10
  
  
  math= sample(50,100,size=10)
  korean= sample(50,100,size=10)  
  english= sample(50,100,size=10)  
  id =1:10  

  data <- cbind(id, math, korean, english)  

  
  # some guy transfered the school.
  new = c(11,60,70,50)

  data_new<-rbind(data,new)  
  
  
  
  # we want to delect 2rd row
  
  z[-2,]

  
  # we want to delect 2rd and 4th row
  
  z[-c(2,4),]
  z[-c(1:2),]  
  z[,-1]  
  
  # length in matrix
  length(y) # of data 
  dim()
  nrow()
  rcol()
  attributes # this shows features of dim
  
  
  # matrix[,5,drop=F] <- when you selecting one column, it can make not change vector, contiune to be matrix.
  # or when you selecting some vector, you can change the data type as as.matrix()
  
  
  
  

  
  # we want to remove work directory's thingsc(")
  
  # 
  ls()
  
  
  rm(a) # removing a
  
  
  ls() # All object is showed
  list # showing the list
  
  class(ls()) # charactor vector
  rm(list=ls()) #all object is removed 
  
  
  
  
  # when you want to collect data, type has to be equal.
  
  x <- 1:10
  y <- rep(c("a","b"), rep(5))  

  c(x,y)  
  
  
  # list can be added by all kinds of data
  
  
  
  # regression analysis.    =  modeling : y = b0 + b1 x + e
  
  
  x = 1:10
  y = 2*x + rnorm(10)
  
  # rnorm is error term.
  
  plot(y)

  
  
  # we will estimate b0, b1 by least square method
  m = lsfit(x,y)  # least square fit: x,y data is important to estimate b0,b1
  m$coefficients
  
  lsfit(x,y) # they can be presented by list (but it has a lot of vectors)
  
  
  fit = lsfit(x,y)
  fit  
  
  
  class(fit) # type = list 
  
  
  
  # I'm interested in coefficients
  fit$coefficients
  fit$residuals  # (real data - estimated data by model)
  fit$qr
  
  
  fit[[1]] # 1st element
  fit[[2]] # 2nd element
  
  # list positive things : 데이터타입 달라도 되고, 다 합쳐서 보여줄 수 있음
  
  
  
  
  # making list
  a <- list(names="Joe", salary=55000,union=T, gender="Male")
  
  
  b <- list("Joes",55000,T,"Male") # but list elements names are not here
  
  a$names  
  b$names   # it didnt work
  
  b[[1]]
  b[[2]] # so when you want to select data, have to use [[]] 
  
  
  
  
  # know type of data  
  class(a); class(b)
  class(a$names)  
  class(a[[1]])# this result is presented by "character"
  class(a[1]) # this result is presented by "list"
  
  
  
  
  a #want to add the job's information
  a$job = "data analysist"

  #delecting list elements
  a$union = NULL
  
  
  a[5:6] = c(T,F)
  
  
  # adding names
  names(a) # data: vector,    5,6th names is none
  
  names(a)[5:6] <- c("does he have certifications", "working experience")
  a  

    
  
  length(a) # list is similar with vector, so can use length function
  
  mat <- matrix(1:12, 4,3)
  a$mat <- mat

  
  ## note : list can be added by the other list
  
  
  a = list("Joe", 55000,T, 5)
  b = list(7)  

  c(a,b)   # adding a , b(two lists)
  
  
  
  
  ###############################
  # same dimenstion => matrix####
  # different dimenstion => list#
  ###############################
  
  
  
  
  # confidence level
  # clt : 표본평균 -> 크기가 커질수록 정규분포를 따른다.
  # data n 
  
  
  N = 30
  a1 = mean(runif(N))
  a2 = mean(runif(N))  

  
  # 계속해서 N을 뽑으면 정규분포를 따른다.    
  
  
  
  
  
  
  #making dataframe
  
  
  fruits = c("banana", "apple", "peach", "grape")
  price = c(300,500,300,600)
  quantity = c(5,2,4,7)
  
  #하나씩 컬럼을 나열하면 됨.
  d = data.frame(fruits, price, quantity)

  str(d)
  names(d) #checking variables
  dim(d) #  datastrusture의 크기가 궁금하다.
  
  d$price
  d$fruits  
  d$quantity  
  
  #pricevector를 뽑고싶다
  d[,2]
  d$price  
  
  d[1,] #바나나에대한정보
  d[2,] #사과에대한정보
  d[3,] #복숭아에대한정보
  
  class(d$price)
  
  
  #1.2 조건에 맞는 데이터만 가져오기
  d[d$price==300,] #가격이 300인 애들 뽑기
  d[d$price>300,]
  
  
  d[d$quantity>5,] #5개 이상 산 과일의 정보
  subset(d, price>500)

  subset(d, quantity<3)
  subset(d, quantity>4)  

  d[d$price<400,]
  
  
  
  
  #오름차순, 내림차순 정리해보자 : order함수
  order(d$quantity)   # 데이터의 순서가 벡터형식으로 나타남
  class(  order(d$quantity)  ) #인덱스 벡터
  

  d[order(d$price, decreasing=T),]
  d[order(d$price, decreasing=F),]
  d[order(d$quantity, decreasing=F),]
    
  

  #외부데이터파일을 불러오자d
  
  getwd()

  
  # header=T 첫번째데이터를 변수명으로 쓴다
  # sep ="" 구분자
  
  
  setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")

  survey_blank = read.table(file="survey_blank.txt", header=TRUE, sep=" ", stringsAsFactors = F)
  survey_comma = read.table(file="survey_comma.txt", header=TRUE, sep=",", stringsAsFactors = F)
  survey_blank ; survey_comma

  
  
  
  getwd()  
  write.table(d, file="ex.txt", sep="@", row.names = T,
              col.names = T)  # checking working directory
  
  
  
  
  data1<-read.csv(file="survey_blank_saving.csv")
  data1[1,]    
  
  
  
  a = data.frame(x1=rep(0,5), x2=rep("x",5))
  b = data.frame(x1=rep(1,5), x2=rep("d",5))
  c = data.frame(x3=rep(2,5), x4=rep("z",5))
  cbind(a,b)     #변수가 같아야 붙이는게 의미가 있다.  
  
  
  #변수명이 다르기때문에 행으로 묶을 수 없다.
  
  
  
  d1 = data.frame(Name = c("D.va", "Hanzo", "Mercy", "Soldier76" ), country = c("Korea", "Japan", "Swiss", "USA"))
  d2 = data.frame(Age = c(19,38,37,56,31), Name = c("D.va", "Hanzo", "Mercy", "Soldier76","Mei" ) )
  
  
  d1; d2 # 같은 데이터를 한번 묶어보자
  # cbind할려면 데이터 크기가 같아야 사용할 수 있지
  # 그게 아니라면 merge로 해야함(이름을 맞춰서 데이터 합할때 사용)
  
  
  set <- merge(d1,d2)
  merge(d1,d2, by="Name") #이름을 기준으로 묶어라
  merge(d1,d2, by="Name", all=T) #붙였던 x,y결측치도 보여줘
  
  merge(d1,d2, by="Name", all.x=T) # x데이터 값 다나옴
  merge(d1,d2, by="Name", all.y=T) # y데이터 값 다나옴
  
  

  
  # 문제
  
  
  N=100
  
  id <- 1:N
  sex <- rbinom(N,size=1, p=0.5 ) #1=woman 0=man
  ifelse(sex==1, "Woman", "man")
  
  subject <- c("Korean", "English", "Math", "Sociaty")
  Korean <- runif(N, 10,95 )
  English <- runif(N, 50,90 )
  Math <- rnorm(N, mean=40, sd=10 )
  Sociaty <- rnorm(N, 80,5 )
  bt <- rbinom(N,size=3, p=0.5 )

  
  data.frame(id, sex,bt, subject, Korean, English, Math, Sociaty)
  
  
  
  
  # 교수님 답안
  N = 10
  id = 1:N
  Kor = sample(70:95, N, replace=T)트
  Eng = sample(50:90, N, replace=T)  
  Mat = rnorm(N, 40,10) ; Mat[Mat>100]=100  
  Soc = rnorm(N, 80, 5) ; Soc[Soc>100]=100
  
  Gen = sample(c("M","F"), N , replace=T)  
  Bld = sample(c("A","B","AB","O"), N, replace = T, prob = c(.27, .25, .25, .23))
  
  d = data.frame(id, Kor, Eng, Mat, Soc,Gen, Bld)
  
  
  
  
  
  
  install.packages("dplyr") ; library("dplyr")
  # 읽기쉽고 다른것보다 코딩하기 쉬움 dplyr
  
  # %>% ->함수를 연결하는거라고 생각하는게 편함
  
  
  class(iris)
  str(iris)
  iris %>% head %>% print
  print(head(iris))  
  
  
  dim(head(iris))
  
  iris[,1:4] %>% head %>% colMeans %>% mean
  mean(colMeans(iris[,1:4]))
  
  x=1:10
  mean(x)
  x %>% mean  
  
  
  setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
  exam = read.table(file = "exam.txt", header=TRUE, sep="\t", stringsAsFactors = F)
  head(exam)

  exam[exam$class==2|exam$class==3,]  
  
  
  
  
  
  # filter function  : 행을 추출하는 함수
  filter(exam, class==1)
  filter(exam, class==1 | class==2)  

  
  exam %>% filter(class==1 | class==2)  
  exam %>% filter(class==2)
  exam %>% filter(class!=2)

  # math score is higher than 50
  exam %>% filter(math > 50)
  
  # math score is small than 50
  exam %>% filter(math < 50)
  

  # not class 2
  exam %>% filter(english >60 | class!=2)  
  data = exam %>% filter(math >= 90 | english >= 90)
  
  
  
  # select function : 열을 추출하는 함수(x변수추출)
  exam %>% select(-math)
  exam %>% select(math)
  
  
  
  #2, 4반의 영어점수, 과학점수
  exam %>% select(english, science) %>% filter(class==2 | class==4) #error
  exam %>% filter(class==2 | class==4) %>% select(english, science) 
  
  
  exam %>% select(math, english) # loss class infor. ->그래서 에러남
  
  
  # 하이퍼 오퍼레이터 안쓰면 %>%는 간혹 에러가 날 수 있다.
  # 읽기 편하게 아래와 같이 코딩을 하는 것이 좋다.
  
  exam %>%
    filter(class==2) %>%
    select(math, english)
  
  
  
  exam %>%
    filter(class==2) %>%
    select(math, english) %>%
    colMeans() 

  
  exam %>%
    filter(class==2) %>%
    select(math, english) %>%
    colMeans() %>%
    mean()
  
  exam %>%
    filter(class==3) %>%
    select(math, science) %>%
    colMeans()
  
  # math 오름차순
  exam %>% arrange (math)
  
  # math 내림차순
  exam %>% arrange(desc(math))

  exam %>% arrange(desc(class), math)  
  
  
  
  
  results = exam %>% arrange(desc(math), english)
  
  cor(results$math, results$english)
  summary(lm( math ~ english,data= results))

  
  
  Sum = exam %>% select(-id,-class) %>% rowSums
  Means = exam %>% select(-id,-class) %>% rowMeans
  
  # 변수추가
  exam$Sum <- Sum
  exam$Means <- Means


      
  
  
  exam = read.table(file = "exam.txt", header=TRUE, sep="\t", stringsAsFactors = F)

  
  Sum = exam %>% select(-id,-class) %>% rowSums
  Means = exam %>% select(-id,-class) %>% rowMeans  
  exam %>% mutate(Sum, Means)  

  
  # 이걸 한번에 써보자
  x = exam$math
  ifelse(x>50  , "P", "F" )
  
  
  exam %>% mutate(math.r= ifelse(math>50 ,"P","F"))
  # 저장되는건 아니고 보여주는거임, 저장하고프면 할당해보자
  
  
  exam %>% mutate(sum = math + english + science, 
                  mean = sum/3,
                  PF = ifelse(mean >60, "P","F"))

    
  
  
  
  # 교수님 미션 _ 내 답안.
  
  w.a = 0.5*exam$math + 0.2*exam$english + 0.3*exam$science
  
  exam$gender = c(rep("M",10), rep("F",10))
  exam$name = paste("Name", 1:20, sep="")
  exam = exam %>% mutate(w.a)
  
  exam = exam %>% arrange(w.a) 
  exam$grade = c(rep("A",6), rep("B",8), rep("C",6))  #이거보단 quantile함수쓰기
  
  exam = exam %>% arrange(id)
  
  
  
  
  
  ###
  
  
  w.a = 0.5*exam$math + 0.2*exam$english + 0.3*exam$science
  
  exam$gender = c(rep("M",10), rep("F",10))
  exam$name = paste("Name", 1:20, sep="")
  exam %>% mutate(w.a)
  
  exam = exam %>% arrange(w.a) 
  
  exam$grade = quantile(exam$w.a, probs = seq(0.3, 0.4, 0.3), names=c("exam$A","exam$B","exam$C"))
    
    
  exam = exam %>% arrange(id)
  
  
  
  
  #분석_상관관계
  cor(exam$math,exam$science)
  cor(exam$math,exam$english)
  cor(exam$english,exam$science)
  
  # 분산분석
  ?aov
  summary(aov(exam$math~ exam$gender))
  summary(aov(exam$english~ exam$gender))
  
  exam %>%
    filter(gender=="M") %>% 
    select(englsih)
  
  w.a = 0.5*exam$math + 0.2*exam$english + 0.3*exam$science
  
  exam$gender = c(rep("M",10), rep("F",10))
  exam$name = paste("Name", 1:20, sep="")
  exam %>% mutate(w.a)
  
  exam = exam %>% arrange(w.a) 
  
  exam$grade = quantile(exam$w.a, probs = seq(0.3, 0.4, 0.3), names=c("exam$A","exam$B","exam$C"))
  
  
  exam = exam %>% arrange(id)
  
  
  # 교수님 답안
  gender = rep(c("Male","Female"), each=10)
  name = paste("Name", 1:20, sep="")
  tmp = exam %>% 
    select(math, english, science) %>%
    mutate(w.a, gender, name)

  
quantile(examw.a)  # 얘 쓸거면 직접 A,B 컷 써서 ifelse 두번써서 하면 됨.









  ## summarise 요약통계
  #mean, sd, var, median


  # groub_by : 지정한 열의 수준별로 그룹화된 결과를 얻을 수 있다



  # anova이용해서 검정해보기
  exam %>% summarise(mean_math = mean(math)) 
  
  
  exam %>%
    group_by(class) %>%                ## class별로 분리
    summarise(mean_math = mean(math))  ## math 평균 산출
  
  
  
  
  exam %>%
    group_by(class) %>%                   ## class별로 분리
    summarise(mean_math = mean(math),     ## math 평균
              sum_math = sum(math),       ## math 합계
              median_math = median(math), ## math 중앙값
              n = n())                    ## 학생 수  n()가 샘플의 갯수를 세는 것
  
  
  
  
  # goup_by쓰면 쉽게 데이터분석을 하겠지.
  exam %>%
    group_by(gender) %>%
    summarise(mean_math= mean(math), 
              mean_eng= mean(english),
              mean_sci= mean(science),
              mean_tot=mean(w.a))
  
  
  
  exam %>%
    group_by(gender) %>%
    summarise(sd_math= sd(math), 
              sd_eng= sd(english),
              sd_sci= sd(science),
              sd_tot=sd(w.a))
  
  # quantile은 벡터가 쫙 나오는거라 dimension이 틀려서 에러가 틀림.
  # range도 2개가 나와서 dimension이 안나와서 안됨
  # 아마 qunatile이나 range도 [1] 같이 하나 벡터 지정해서 하면 에러가 안날거야
  
  
  
  
  
  
  exam %>%
    group_by(class, gender) %>%
    summarise(mean_math= mean(math), 
              sd_math= sd(math),
              mean_tot = mean(w.a),
              sd_tot=sd(w.a))
  
  
  
  
  
  
  
  # factor와 table
  
  factor(class)
  defactor()
  # factor로 치면 level Ab로 뜨거든, 그니까 수준을 보여줌
  # -> 그룹별로 작업할때 factor라는 형식을 인풋으로 갖는 함수들이 많아
  
  
  
  
  score = c("A","A","A","B","B","B")
 factor(score,levels=c("A","B","C","D","F"))
 
 
 as.character(f.tmp)
 as.numeric(vector)   # 설문지 조사할때 평균 내는거 조심조심조심
 
 as.numeric(f.tmp) %>% sum()
 
 
 # 범주형자료 요약해라 table
 # => 빈도를 구하는 것임
 
 height = c(173,182,155,169,163,161)
 year = c("1","1","2","3","3","4")
 gender = c("M","M","F","M","F","F")
 grade = c("A","C","B","B","A","C")
 students = data.frame(height, year, grade, gender) ;  students
 
 
 str(students) #default는 팩터로 만들어준건데, stringsAsFactor = F로 해야 character로 인식
 
 
 c(students$year ,1) #이렇게 하면 numeric으로 변하니까주의
 c(students$year ,"1") #요러케해야 범주형
 
 
 table(students$grade) #빈도표를 구해줌 _1차원
 table(students$gender, students$grade) #2차우
 table(students$gender, students$grade, students$year)원 # 3차원
 
 
 class(students)

 ls()
 
 attach(students)  #현재 R 세션에 students라는 워크스페이스에 변수를 붙여라
ls()  #작업공간 꼬일수있어. 그니까 attach는 웬만하면 하지말자 ㅠ

detach(students) #
rm(list=c(지우고싶은거))





    # apply는 똑같은 작업을 해주는 패키지임

    # 그룹별로 똑같은 연산하기:t apply
    class(tapply(height, gender, mean))  #array 형식, 괄호안도 쳐보기
    class(tapply(height, year, mean)) #array 형식. 괄호안도 쳐보기
  # 이거 할때 주의점이 두개의 벡터의 차원이 같아야함.    
    
    
    class(tapply(height, list(gender, grade), mean)) # matrix형식이 나옴. 괄호안도쳐보기
    
    
    #범주=레벨
    # levels 라는 옵션으로 팩터볼수있찡
    
    height = c(173,182,155,169,163,161)
    year = c("1","1","2","3","3","4")
    gender = c("M","M","F","M","F","F")
    grade = c("A","C","B","B","A","C")
    students = data.frame(height, year, grade, gender) ;  students
    
    str(students) #가질수 잇는 값
    
    
    #교차표분석
    x = table(students$gender)
    
    
    
    library(dplyr)
    sum(x)
    
    
    table(students$gender) %>% length
    
    
    table(students$gender, students$grade)    #2차원 분할표
    table(students$gender, students$grade)  %>% colSums
    table(students$gender, students$grade)  %>% rowSums

    # 범주형자료의 분포는 테이블의 관측개수  => 주변부분포
    
    
    
    
    students %>%
      group_by(gender) %>%
      summarise(mm = mean(height))

    
    # colum, low별로 같은 함수를 적용시키자 ->tapply   
    # 남자애들만 모아서 분산, 여자따로모아서 분석가능하지
    # matrix에서 1, 2 컬럼별로 같은 작업을 하자!
    
    
    apply(students, 2, table) #mean은 구할수없음
    
    #데이터를 보고 다 숫자면 mean을 구할수 있지
    # table이란건, 각각 변수에 대한 테이블을 같은작업을 그룹별로 하라는 거임
    #그래서 결과물이 4개가 나오는 것임
    #dimension이 다 다르니까 list로 결과값이 나온것임.
    
    res =     apply(students, 2, table) 

    names(res)        
    class(res)    
    
    
    
    
    res$grade

    
    
   # 1,2 row, col 별로 나옴
    
    
    #lapply => 리스트별로 하는거임
    #tapply -> 그룹별로 같은 함수를 적용시키는 것임
    
    tapply(students$height, students$gender , mean)
    tapply(students$height, students$gender , sd)
    tapply(students$height, students$gender , range)
    #       한줄짜리 벡터, 그룹을 나타내는 벡터, 함수    
    
    
    students$weight = c(62, 68, 78,50, 45,65)
    tmp = students[,c(1,5)]           
    tmp    
    
    
    students
    tapply(tmp[,1], students$gender, mean)    
    tapply(tmp[,2], students$gender, mean)    

    
    # 함수안에 또 함수 쓸 수 있음 _ 두개 합성함수 쓴거랑 똑같은거임.
    apply(tmp, 2, tapply, students$gender, mean)    
    
    #for 문을 써서 해도 됨
    #apply안에 손으로 첫째,두번째 컬럼 연산을 c로 하면
    #r로하면 for문쓰면 너무 연산이 길어짐.ㅠ
    # 컴퓨터로 작업하는 이유가 단순계산을 위한건데 이것도 단순계산하는거임..ㅋ
    
    
    str(iris)
    apply(iris,2, tapply,iris$Sepal.Length,sd )

    
    tapply(students$height, 
           list(students$gender,students$grade),
           mean)  #results can be turned out as TAble
    
    
    
    # tapply 데이터 연산하려면 분리가 필요한데
    # split 분리
    
    split(students$height,students$gender )  #이거 두개 분리한거임, 성별에따라
    # tapply할려면 분리를 일단 하고 같은함수 쓰는건데
    #tapply 이거랑 같은게 뭐냐면
    
    
    lapply(split(students$height,students$gender ), mean)
    tapply(students$height,students$gender, mean )
    
    # 결과물이 같음
    
    
    
    # lapply 이거 리스트라 싫다 하면
    unlist(lapply(split(students$height,students$gender ), mean))
    
    
    # summary써도되긴됨...ㅎㅎ
    split(students$height,students$gender ) %>%
      lapply(mean) %>%
      unlist

    
          
    
    
    xx = c(rep("A",3) , rep("B",3))
    split(students$height,
          list(students$gender, xx))
    
    
    
    xx = factor(c(rep("A",3) , rep("B",3)))
    split(students$height,
          list(students$gender, xx))

    
    
    # aggregate 쓰면 tapply안써두되긴행    
    
    
    
    iris
    head(iris)
    
    str(iris)
    
    
    table(iris$Species)    
    
    
    
    library(dplyr)
    iris [,1:4] %>% head

    aggregate(iris[,1:4], list(iris$Species), mean)     # 두번째 콤마부분이 리스트여야함
    aggregate(iris[,1:4], list(iris$Species), range)    
    aggregate(iris[,1:4], list(iris$Species), summary)    
      
    
    
    # barplot 범주형데이터
    
    x = c(1,1,2,1,1,2,2,2,1,1,1)
    hist(x) # 이거 사실 범주형이라 의미 없어서 barplot이 나아보임
    # table로 만들어서 barplot을 넣어서 해야함
    
    x = table(x)
    barplot(x)
    
    x = c("A","A","B","A","O","AB","AB")
    x = table(x)
    hist(x)
    
    ?round
    ?runif
    
    
    x = round(runif(n=12,min=5,max=50))
    barplot(x, names.arg = letters[1:length(x)])
    barplot(x, names.arg = 1:length(x))
    
    barplot(x, col=rainbow(length(x)))
    barplot(x, col=rainbow(length(x)), names.arg=letters[1:length(x)])
    
    x = sample(c("A","B","AB","O"), 100, prob=c(0.3, 0.25, 0.25,0.2), replace=T)
    x = table(x)
    barplot(x)
    
    x = sample(c("1","2","3","4"), 100, prob = c(0.3,0.25, 0.25, 0.2), replace=T)
    x = table(x)
    barplot(x, names.arg=c("A","B","AB","O"), col=1:4)
    
    
    names(x) = c("A","B","AB","O")  # names에 이름을 이렇게 넣어도됨
    
    
    # pie graph
    # 원그래프를 그릴 때 사용하는 함수
    # 주로 범주형 자료에서 각 범주별 빈도수/비율 표현시 활용.
    
    
    
    
    
    aa = c(10,20,30,40)
    name.aa = c("그룹1", "그룹2", "그룹3", "그룹4")
    par(mfrow=c(2,2))
    pie(aa, density = 10, angle=70, )   #density : 얼마나 빗금을 빽빽하게 침. 100이 최대값
    
    
    par(mfrow=c(1,1))
    area = c("서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주")
    grdp2014 = c(327602, 73744, 46592, 68374, 30998, 32723, 69548, 329449, 36886, 49137, 103740, 44623, 63095, 91563, 102484, 13894)
    labs = paste(area, prettyNum(grdp2014, big.mark = ",",
                                 preserve.width = "none"), sep=":")
    pie(grdp2014, radius=1, labels= labs, col=topo.colors(length(grdp2014)))
      
    
    
    
    # t-test
    
    x = rnorm(10, mean=1)
    y = rnorm(10, mean=0)

    
    t.test(x,y)    

    
    x = rnorm(100, mean=1)
    y = rnorm(100, mean=0)
    
    
    t.test(x,y)    
    
    
    # 평균에 차이가 나도, 샘플사이즈에 따라서 기각할 수 잇고 안할수도있다
    # 그러니까 10개랑 100개의 증거가 틀리니까 주의주의
    
    
    
    ?t.test

    
    
    
    # 회귀분석 : 반응변수 모델링
    
    
 
    
    x = 1:10
    y = 2:11    

    plot(x,y)    
    cor(x,y)    

    
    lm(y~x)    

    
    N = 50
    x = runif(N,0,5)  
    y = 1 + 0.5*x + rnorm(N)

    plot(x,y)
    lm(y~x)
    fit = lm(y~x)
    
    names(fit) #여기서 이론공부를 합시당.
    
    summary(fit)
    
    plot(x,y , xlab="time", ylab="quantity", type="l")
    # type="s" 데이터타입에 맞춰서해야함. 시계열만 데이터타입에 라인그리는게 의미가 있겠다.
    
    
    x = c(2210, 2220, 2230, 2232,2210,2260)
    y = 1:6    

    plot(y,x, type="b", xlab="time", ylab="price")    
    # s- step funciton, o -line+point 오버랩, ....!
    
    
    plot(x,y, type="p", xlab="var1", ylab="var2", ylim=c(0,10))
    
    # 그래프볼때 옆에 축 레이브를 봐야함 =>볼때 현혹시킬 수 있음...ㅠ
    #축과 값이 뭘 의미하는지 봐야합니당..ㅠ
    
    
    
    
    
    
    
    plot(y,x, type="b", xlab="time", ylab="price", lty=5, col="skyblue", pch=10, bg="grey", lwd=4 , cex=9)    
    
    
    
    # plot그릴때 한 창에 두개 그리고싶다면 창을 두개로 나누자
    par(mfrow=c(2,1))
    
    
    plot(y,x, type="b", xlab="time", ylab="price", lty=5, col="skyblue", pch=10, bg="grey", lwd=4 , cex=9)  
    
    
    x = c(2210, 2220, 2230, 2232,2210,2260)
    y = 1:6    
    
    plot(y,x, type="b", xlab="time", ylab="price") 
    
    #1반의 성적,2반의 성적 이런거 비교가 가능하겠찌
    
    
    
    
    ######################## 기말.고사 ########################
    
    
    
    # matplot
    # 여러개의 데이터를 한번에 그리기
    
    
    par(mfrow=c(1,1))
    
    # 정규분포 그림을 한 화면에 세개 그려보자
    
    x = seq(-3,3, length=100)
    y = dnorm(x)    
    z = dnorm(x, mean=2, sd=1)
    w = dnorm(x,mean=0,sd=2)

    data = matrix(c(y,z,w), ncol=3)    
    matplot(x, data, type="l", lwd=2)    
    
    # 이론적인 데이터에서 포인트100개를찍어서 요러케 나온거임
    
    plot(x,y, type="l") + plot(x,z, type="l") # 이렇게하면 차원을 바꿔서 그림->고수준 그래픽함수
    
    
    
    
    #line라는 함수가 있음
    
    plot(x,y, type="l")
    lines(x,z, col="skyblue")
    lines(x,w, col="pink")
    
        
    
    
    x = seq(-10,10, length=100)
    plot(x,y, type="l", xlim=c(-6,6))
    lines(x,z, col="skyblue")
    lines(x,w, col="pink")
    
    
    
    
    
    Data = matrix(c(y,z,w), ncol=3)
    
    
    
    #100개 여러번그리고시다 그러면 matplot을 해보쟈
    
    
    matplot(x,Data, type="l", lwd=2) #한번에 그릴수이따
    
    
    
    
    
    
    # 창을띄워서 그리는 거 고수준 그래픽함수
    # lines는 띄어진 상태에서 라인을 덮어쓴거 _ 저수준 작도함수
    
    # h 수직선 v 수평선
    
    matplot(x,Data, type="l", lwd=2)
    abline(h=0.1)
    abline(v=0, col="grey")    
    abline(a=0,b=8, col="purple")    
    
    as.numeric(as.numeric(c(T,F,T,F)))
    
    
    # legend 범례
    
    
    ###############기말############3
    # 한 화면에 정규분포 세개를 그리고 싶어
    
    x = seq(-3,3, 0.01) # 그리드, -3에서 3까지 601개를 짤라버림.
    y = dnorm(x)  # density 구하는 함수.  
    # qunatile , pnorm, rnorm
    # t분포 카이스퀘어 당연히있음. 바로 찾을 수 있음.
    
    z = dnorm(x, 2,1)    
    w = dnorm(x,0,2)    
    data = matrix(c(y,z,w), ncol=3)
    matplot(x, data, type="l", lwd=2)    

    par(mfrow=c(1,1))    
    
    
    
    # 크게 자르면
    x = seq(-3,3, length=1000)

    
    abline(v=0, col="gray50", lty=2) #vertical line    
    abline(v=seq(-3,3, by=1), col="gray50", lty=2)

    abline(h=seq(0,0.4, by=0.1))  
    
    abline(h=seq(0,0.4, by=0.1), col="gray50", lty=2)  
    
    abline(h=seq(0,0.4, by=0.1), col="gray50", lty=2, lwd=0.2) 
    
    
    
    
    # abline ->x축 y 축 평행하게 그릴 수 있고, 직선도 그릴 수 있다.
    
    # 절편a, 기울기b
    
    abline(a=0, b=0.4/3, col="blue", lwd=2)
    
    #이동시키고싶으면_ 옮겨보기.
    # 그 x축 -3만큼 평행이동 하면 되는걸로 움직이는 것임.
    abline(a=0.4, b=0.4/3, col="blue", lwd=2)
    
    
    
    abline(v=0,h=0, col="purple", lty = 1 , lwd=3)

    # 이거 못지움, 코드 삭제하고 다시 실행시키면 됨.   
    # 저수준작도함수는 plot에 창이 띄어져야 그려짐.
    
    plot(-5:5, -5:5) #점11개찍음
    abline(v=0, h=0)
    
    # arrows라는 함수라는게 있는데 외울필요는없음
    
    #lines그릴려면 두 점을 지정하면됨.
    lines(c(2,2), c(2,-4), lwd=2)
    
    #2,-4d에서 시작해서 -3,3까지 가는 선을 그을거야.
    # 비슷한 함수이긴한데 입력방법이 좀 다름.
    arrows(2,-4,-3,3, col="red", lwd=2)  
    # 저수준작도함수로 위치를 제대로 잡고, 피피티로 잘 그려보면 괜찮지않을까...ㅎㅎ
    
    
    # Text함수
    # 문자치는 함수->좌표가 필요함
    # (0,5) 지점에 "hello"를 입력.
    text(0,5,"hello")
    text(0,5,adj=1, "hello")
    text(0,5,adj=0, "hello")
?text    
    
    text(0,5, adj=c(0.5,0), "hello") # 문자의 위쪽을 좌표의 기준으로
    
    plot(-10:10, -10:10)
    abline(v=0, h=0)
    
    # position 기억하기(1,2,3,4)
    
    text(0,5,"hello", pos=1)  #좌표를 기준으로 남쪽에 문자 입력
    text(0,5,"hello", pos=2)  #좌표를 기준으로 서쪽에 문자 입력
    
    text(0,5,"hello", pos=3)  #좌표를 기준으로 북쪽에 문자 입력
    text(0,5,"hello", pos=4)  #좌표를 기준으로 동쪽에 문자 입ㄹ
    
    
    # 범위 줄이는 방법도 있음.
    # 마진을 주자
    
    plot(mai=c(4,1,1,1))
    plot(-5:5,-5:5) 
    abline(v=0, h=0)

    x= -5:5 ; y=2*x ; z=x+3    
    matplot(x, matrix(c(y,z), ncol=2), type="l", lty=1:2, col=1:2)
    abline(v=0, h=0)
    legend("topletf", c("f(x)=2x", "g(x)=x+3"), lty=1:2)    
    
    legend("bottomright", c("f(x)=2x", "g(x)=x+3"), lty=1:2, col=1:2)

    ?legend # deco를 잘 하고싶으면 다 읽어보세요.
    # help창 보는 습관 들이기: 한줄씩 실행시켜보면 work하는거 이해하면 됨.
    
    legend("top", c("f(x)=2x", "g(x)=x+3"), lty=1:2)  

    
    ?par    
    # 이거 들어가보면 하나하나 다 익혀볼 수 잇음.
    # 창 나누기, par(mforw=c(1,1))
    # 전체 plot안에서 margin 나누기
    #lty (linetype)
    
    
    #pca(점의모양)
    
    plot(-5:5,-5:5) 
    plot(-5:5,-5:5, xaxt="n") 
    abline(v=0, h=0)
    
    # 바꾸는 코드 tensorflow확인하기
    
    
    ### ggplot2
    #1,2,3번째 그룹의 각각의 관계를 보고 싶고 그걸 각각의 창에 넣고싶다
    # 그걸 라인그리고, 라인그리고
    # 첫번째 두번째 세번째 그룹 라인 그리는데 레전드 넣어야하고 수작업해야함.
    
    ## group별, 레전드별 이런게 자동으로 되는거라서 matplot보다 많이 쓰이고
    
    # 그리드가 디폴트로 이쁘게나옴.
    # dataframe을 통채로 넣고 x1 y의 회귀분석, 히스토그램을 그리자
    # 두개의 벡터 row값이 기준인데 ggplot은 데이터프레임이 기준이고 변수 이용해서 그림 그려라 하는 옵션
    
    
    df = data.frame(heights = c(183,182,162,172), wegiht=c(82,78,49,53))
    
    
    # ggplot은  dataframe을 통채로 넣음. aes라는 것은 그래프 그릴 데이터 입력해주면 됨(x축에는 키, y축에는 몸무게 _ 데이터속)
    library(ggplot2)

    
    ggplot(data=df, aes(x=height, y=weight))    
    
  + geom_point()  # 점
  + geom_line()  # line
    

    # 코드가 길어지면 아래다가 쓸 수도 있음.
    
    ggplot(data=df, aes(x=height, y=weight)) +
      geom_point()
    
    
    # point에 컬러를 exercies별로 그리고 싶어. 두개의 레벨로 Y, N 다시 또 aes데이터 지정
    # R그래픽스에선 포인트가 같은 데이터라도 
    
    
    plot(df$heights, df$wegiht, col=2)
    
    
    ggplot(data=df, aes(x=height, y=weight)) 
    + geom_point() #error
    
    
    # dplry R에서 chain도 구분했지
    # 부호, operater를 쓰는 습관
    
    #line을 쓰고싶다 그러면 위에다 덮어 쓸 수 있음
    
    ggplot(data=df, aes(x=height, y=weight)) +
      geom_point() +
      geom_line()
    
    # 나는 레이어를 좀 더 간단하게 표현하구싶ㄷ
    
    
    p = ggplot(data=df, aes(x=height, y=weight))
    
    p + geom_point() + geom_line()
    p + geom_line()
    
    
    
    
    # 회귀분석 - > smoothing
    col.vec= ifelse(df$exerice=="N", "red","blue")
    plot(df$exercies, df$heights, col=col.vec)
    
    ggplot()
    
    # co.legned = T, F 해서 없앨수도있고 붙일 수도 있음.
    
    
    
    library(ggplot2)
    str(iris)
    ggplot(data=iris, aes(x=iris$Petal.Length, y=iris$Petal.Width, z=iris$Species, z=Species))  +geom_line()
    
    attach(iris)
    col.vec = ifelse(Species=="setosa", "pink",ifelse(Species=="virginica", "skyblue","black"))
    
    ggplot(data=iris, aes(x=iris$Petal.Length, y=iris$Petal.Width)) +geom_point(aes(colour=col.vec))
    
    
    # ggplot으로 동적그래프 그릴 수 있음.
    ?ggainmap
    
    # 2 dimension _점이 필요함. 점 찍으면 그림 그려짐.
    # 경계라는 좌표 -> visualize 패키지 있음.
    
    
    ggplot(data=df, aes(x=height, y=weight)) +
      geom_point() +
      geom_line()
    
    
    diamonds = data.frame(diamonds)
    dim(diamonds)    

    str(diamonds)
    ?diamonds   
    help("diamonds")

    head(diamonds)    
    
    
    #1. 레이어지정 히스토그램은 x축만 산점도면 x,y 두개축.
    #2. 점 포인트냐 아니냐로 지정 가능하고
    #3. aes로 지정, 컬러별로 포인트 찍어라, 라인도 그릴 수 있다
    
    #aes(사용할 변수 쓰는 것)
    
    p = ggplot(data = diamonds, aes(price))
    p + geom_histogram()
    hist(diamonds$price)        
    
    p + geom_histogram(fill="skyblue")
    
    # 5만개이 데이터로 추정이 가능하다.
    # 비싼다이아몬드는 밀도가 높고, 싼 다이어는 밀도가 낮다
    
    p + geom_density() # density plot, 어디에 밀도가 높은지 알 수 있다
    
    p + geom_density(fill="purple", colour = "white")
    p + geom_histogram(fill="purple", colour = "white")
    
    
    # geom_boxplot
    # 다이아몬드 색깔(factor)에 따라 price(연속형변수)의 분포가 보고싶다
    
    ggplot(diamonds, aes(x = factor(color), y = price)) + geom_boxplot()
    summary(aov(price~color)) #  차이가 있다.
    
    ggplot(diamonds, aes(x = factor(color), y = price)) + geom_boxplot(aes(fill = factor(color)))
    

    ggplot(diamonds, aes(x = factor(color), y = price)) + geom_boxplot(aes(fill = color))

    str(diamonds)    # color 변수가 이미 factor라서 사실 안써도될거같다.
    
    ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth()  # 신뢰구간 confidence interval
    
    ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(aes(color = factor(cut))) # cut별로 각각 가격과 캐럿사이의 회귀식을 다 구해서 추세를 보는 것임.
    
    
    
    # 그룹별로 나눠서 하는게 좋다
    
    
    setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\R_공부파일")

    crime = read.csv(file="crime.csv")    
    str(crime)    
    p = ggplot(crime, aes(y=STATE, x=MURDER))
    + geom_point() 
    
    p + geom_boxplot()

    crime[,1:4]
    

    # 절편->회귀분석 
    b = lm(price~carat, data=diamonds)[1]
    a = lm(price~carat, data=diamonds)[2]

    # ablines(a=a, b=b, col="red) 함수써서 회귀분석 추가할 수 있음
    
    ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(aes(color = factor(cut))) +abline(a=a, b=b, col="red")
    
    # 곡선찾기 gam ::: generalized additive model
    
    
    # 복습하기.
    
    
    
    
    
    
    ################################3
    ## if문...#######################
    
    x = 10
    
    if(x>5){
      print("x is large number")
      z = x + 10
      cat(" z is ", z, "\n")
      }
    
    #조건에 안맞으면 실행을 안함.
    #조건에 맞으면 실행됨.
    # cat : print하라는 함수인데, 문자랑 어떠한 r 객체를 동시에 프린트 못하는데 이건 동시에 프린트 하는 것임. x에 따라 열심히 변화할거임
    
    # print는 엔터를 저절로 쳐주는데, cat은 "\n" 안넣어주면 실행이 안됨. (엔터를 치라는 명령어임.)
    
    
    if(x>5){
      print("x is large number")
      z = x + 10
      cat(" z is ", z, "\n")
      cat(" z is ", z+10, "\n")
    } # if 문 끝
    
    
    # "\t" 얘는 tab으로 인식한다.
    
    # 복잡한 코딩하면 중괄호 많아지는데, 하나의 블록으이 ㅇ해할 수 있는건데 줄을 맞추줘야함
    
    
    
    # if, else문은 참과 거짓을 둘다 실행시키는 것임
    x = 4
    if ( x>5 ){
      print("x is large number")
    }    else {
      print("x is not large number")
    }

    # 많이 쓰임
    
    
    
    x = rnorm(10)
    x  

    
    z = ifelse(x<0, "negative", "positive") # if와 else를 좀 더 간단히.
    #새로운 변수를 만들 때, ifelse를 쓰면 좋다.
    # 설문지분석에선 ifelse를 중첩해서 쓰자.
    
    # 간단한 조건문 예제면 ifelse를 쓰면 되고, 너무 길면 if () {}else{} 쓰면된다.
    
    
    
    x = sample(10:49, size=10)
    #  R에 내장된 명령어.
    z = ifelse(x<20, "10대", 
               ifelse(x<30, "20대",
                      ifelse(x<40,"30대", "40대")))    
    z

    #   full로 쓰는거, else if를 되게 많이 쓸 수 있다.
    x = 10
    if (x >20 ){
      print( " x is large number")
    }    else if(x<5){
      print(" x is small number")
    }   else {
      print("x is middle number")
    }
    
    
    # else if를 쓰는게 너무 헷깔리면 if문만 여러번 쓰면 된다.
    # 코드를 직관적으로 읽기에 매우 수월하다.
    # 함수이다.
    if(x>20) print("x is large number")
    if(x<5) print(" x is small number")    
    if(x>=5 & x<=20) print("x is middle number"    )    
    
    x = 23    
    x=7
    
    
    
    
    x = 30
    if(x>5){
      print(" x is large")
    }    
    
    # 분산이 같으면 , 분산이 다르면 이러한 프로시져에 의해 분석을 한다. if문(조건에 맞춰서 두가지로.)
    
    # 이면그 ㄱ리면서 쓰면 코딩 절대 안헷갈리니까 종이로 쓰는 습관 들이기.
    
    
    
    
    
    
    # 반복문.   1 in 1:10 (1:10이란 집합 내에 1이란 원소가 있는지 없는지)
    for(i in 1:10){
      print(i)
    }

    
    for(i in 10:1){
      print(i)
    }
    
    
    for(i in c(1,5,3,2,1)){
      print(i)
    }
    
    
    
    
    x = 1:10
    sum(x)    

    
    # 위 두 줄 코딩을 for문으로 짜보자
    
    
    x = sample(1:100,5)
    z = 0
    for(i in 1:length(x)){
      print(x[i])
      z = z + x[i]
    } 
    print(z)

    
    # index 벡터라서 1:length(x)
    # 코딩할때 규칙 넣어줘야함, x변할수 잇는거라 길이만큼 fittingㅇ르 해라.
    
    # matrix에서 row의 합, col의 합 구할거임
    r = 7
    c = 5
    
    A = matrix(sample(1:100, size=r*c), nrow=r )
    
    
    # 내가 짠건 이러함.
    colSums(A)
    rsum = 0
    
    
    
    for(i in 1:r*c){
      print(A[i])
      rsum = rsum + A[i]
    }
    print(rsum)
    
    
    
    for(i in 1)
      
      
      
      
      # 답. 7차원 벡터가 있어야 함.
      row.sum = rep(0, nrow(A))
      for(i in 1:nrow(A)){
        row.sum[i] = sum(A[i,])
      }   
    
      col.sum = rep(0, ncol(A))
      for(i in 1:ncol(A)){
        col.sum[i] = sum(A[,i])
      }
      
      
      
      #########################################
      
      N = 100 ; P =50
      x = round(matrix(rnorm(N*P), N,P),2)      
      Grp = sample(c("M","F"), size=N, replace=T)      

      dim(x) ; dim(Grp)

      
      
      res.vec = rep(0, ncol(x))
      for(i in 1:ncol(x)){
      
      tmp = x[,i]
      x = tmp[Grp=="M"]      
      y = tmp[Grp=="F"] 
      p.val = t.test(x,y)$p.value
      if (p.val < 0.05){
        res = "reject H0"
      } else {
        res = "accept H0"
      }      
      print(res)
      res.vec[i]= res
      }
      res.vec
      
      
      
      
      ##########################################3
      
      N = 100 ; P = 50
      x = round(matrix(rnorm(N*P), N,P),2)      
      
      Grp = sample(c("M","F"), size=N, replace=T)      

      p.vec=res.vec = rep(0, ncol(x))       # 그룹별초기화값
      for(i in 1:ncol(x)){
        tmp = x[,i]
        x = tmp[Grp=="M"]
        y = tmp[Grp=="F"]
        p.val = t.test(x,y)$p.value
        if(p.val <0.05){
          res = "reject H0"
        }else {
          res = " accept H0"
        }
        print(res)
        p.vec[i] =p.val
        res.vec[i] = res
      }
      print(res.vec)
           
      
      
      
      # 변수가 p개라서 p개의 t.test결과가 있으면 됨.
      # p-value의 sequence를 보고싶다? 저장할 걸 머릿속에 생각해놔야함.
      # 저장할 것을 입력해주는게 중요.
      
      
      
      x=1:10
      for(i in 1:length(x)){
        print(i)
      }
      
      
      
      # 매개변수가 없는 경우 함수를 직접 만들기
      
      sum110 = function(){
        x = seq(1,10)
        print(sum(x))
      }
      sum110()
      
      
      # N : 매개변수, input함수
      sumN = function(N){
        x = seq(1,N, by=1)
        print(sum(x))
      }     
      
      sumN(100)
      
      
      
      # 전역변수와 지역변수
      
      
      
      
      # input이 복수개가 있을 경우 있다
      
      sumse = function(start, end){
          x = seq(start,end)
          z=sum(x)
          print(z)
      }
      sumse(11,100)
      sumse(1,10) # 반복적인 작업을 한줄에 쓰게끔 하면 됨.
      
      
      
      # 이름을 쓰면 순서를 바꿔도됨.
      # function argue먼트 이름 안쓰면 순서대로 써야함.
      
      
      sumse(end=10, start=5)

      sumse(5,10)            
      
      
      
      x = 1:6
      y = rep(1/6,6)
      sumse = function(X)
        
        
        
        
        # 매개변수의 default
        
        
        
        print_mean = function(x1=0){
          mx1 = mean(x1)
          print(mx1)
        }
      print_mean(x1=1:10)
      print_mean(x1=1:70)      # input을 지정하면 새로운 인풋값으로 계산함.
      
      
      # 함수내의 지역변수가 우선이라서, 매개변수 지정하고 싶으면, x1=10 이라고 함수 바깥에 저장되어있어도 실행이 안됨,
      
      
      ?read.csv
      ?mean

      
      x=seq(1,100) ; xna=c(x,NA)
      my.mean1 = function(x,...){
        mx=mean(x,...)
        return(mx)
      }
      my.mean1(x)
      
      
      # mean옵션 안에 ...을 넣으면 ?mean 에서 보여지는 옵션 다 쓸 수 있다는 것임.
      
      
      
      x = 1:100 ; xna=c(x, NA)
      my.mean = function(x=x, ...){
        mx = mean(x, ...)
        return(mx)
      }      
      
      my.mean0 = function(x=x){
        mx = mean(x)
        return(mx)
      }
      my.mean(xna, na.rm=T)
      my.mean0(xna)

      
      # 옵션을 그대로 갖다쓸수가 없음
      # 점은 세개찍어야함, 두개는 안됨 ! sytanx라서
      
      lm
      attributes(print_mean)    
      # 소스코드 보고 뜯어서 쓰는 사람도있기도 함.
      
      is.function(x)
      # 복잡한작업 많이쓴다 -> 함수짜서 작업하면 됨.
      
      
      
      # for, if문, 점점 복잡한거 연습해보자.
      
      
      
      
      
      
      
      
      
      
      # 시뮬레이션
      
      
      
      #1.1 균일분포하에서 중심극한 정리를 따르는지 한번 보자
      
      #. 1번 작업.
      N=20
      sample = runif(N,0,10)
      mean(sample)
      
      #. 1000번 작업
      par(mfrow=c(1,2))
      N = 20
      nrep = 1000
      res = rep(0,nrep)    # 초기값지정.  
      for(i in 1:nrep){
        sample = runif(N,0,1000)
        res[i] = mean(sample)      # 1000개의 x.bar을 얻을 수 있음. 
        }
      hist(res)
      
      
      qqnorm(res)
      
      
      # 대칭인 분포냐 비대칭인 분포냐에 따라 다름
      
      
      
      # uniform분포에서 평균을 구한다음에 평균값을 저장
      # 1000개의 평균값 ->결과 벡터
      
      # for문대신 채울 수 있는게 replicate
      unif_5 = replicate(1000,mean(runif(5,0,10))) #vector _samplesize 5
      unif_20 = replicate(1000,mean(runif(20,0,10))) #vector _samplesize_20                     
      unif_100 = replicate(1000,mean(runif(100,0,10))) #vector
      unif_500 = replicate(1000,mean(runif(500,0,10))) #vector
      
      
      par(mfrow=c(2,2))
      hist(unif_5); hist(unif_20) ; hist(unif_100) ; hist(unif_500)

      
      
      replicate(10, mean(runif(5,0,10)))     
      
      qqnorm(unif_5)
      qqnorm(unif_20)
      qqnorm(unif_100)
      qqnorm(unif_500)
      
      
      
      # chi-square 분포
      par(mfrow=c(1,1))
      x = seq(0, 15, by=0.1)
      plot(x, dchisq(x , df=3), type = "p", main = "pdf of chisq(3)")      
      N = 20
      sample = rchisq(N,df = 3)
      mean(sample)
      
      result = rep(0,1000)
      for(i in 1:1000){
        sample = rchisq( N , 3 )
        result[i] = mean(sample)
      }      
      hist(result, main="N=20")
      
      qqnorm(result)
      
      
      chisq_3 = replicate(1000, mean(rchisq(3,df=3)))
      chisq_10 = replicate(1000, mean(rchisq(10, df=3)))      
      chisq_30 = replicate(1000, mean(rchisq(30, df=3)))      
      chisq_100 = replicate(1000, mean(rchisq(100, df=3)))      

      par(mfrow=c(2,2))      
      hist(chisq_3)
      hist(chisq_10)
      hist(chisq_30)
      hist(chisq_100)
      
      qqnorm(chisq_3)
      qqnorm(chisq_10)
      qqnorm(chisq_30)
      qqnorm(chisq_100)
      
      
      ?rt
      Fdis_3 = replicate(1000, mean(rt(3,10)))
      Fdis_10 = replicate(1000, mean(rt(10,10)))      
      Fdis_100 = replicate(1000, mean(rt(100, 10)))      
      F      