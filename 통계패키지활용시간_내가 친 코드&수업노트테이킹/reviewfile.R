

####################### course 1. basic R

  ?sample
  Age = runif(min=20,max=30, n=30)
  summary(Age) # summary about object

  Age # printing object's elements
  id = 1:30
  plot(id, Age) # drawing 2-dimension plot

  
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\통계패키지활용") 
  getwd() # checking working directory
  
  
  #making R Notebook _ checking the lectureNote
  
  
  

  
####################### course 2. Vector
  
  # Vector : collection of numbers
  # Vector's length , dimension
  # types : class function
  # is vector numeric or character?
  
  id = 1:100
  data1 = rnorm(100)      
  data2 = rnorm(100)  

  data = cbind(id, data1, data2)  ; data
  
  length(data)  
  dim(data)  
  
  x = data[,2]
  y = data[,3]  

  x+y  
  
  
  # priority of the four fundamental arithmetic operation
  # ()
  
  1:(10-1)
  1:10-1  

  seq(1,10,by=2)
  seq(2,11,by=2)  
  seq(from=0, to=100, length=10)  

  rep(3,4)  
  replication = rep(data1,4)  ; replication
  length(replication)  

  # You don't need to memorize the sample
  
  
  rep(1:2, each=3)
  rep(1:2, times=3)  
  rep(1:2, length=3)  

  
  # You can select the dataset by using logical vector
  
  # sample1
  x = c(11,22,33,44)
  a = x>20  

  class(x)  
  class(a)  

  x[a]  
  
  # sample2
  
  y = seq(12,30, length=19) ; y
  u = c(5,2,8)
  v = c(1,3,9)
  
  u+v
  
  
  
  # 4. NA, Null
  # Now, We will read the excel data
  
  # Missing value , 결측치 = NA
  # When you have NA, you can analyze the data by deleting that data line. 
  # But you don't have X3's value, you can fill the other data by using Regression's idea.
  # This methods depend on the data, if you don't have any information about data, Sometimes can fill the NA as mean
  
  
  y = 1:5
  mean(y)  
  median(y)  
  sd(y)
  range(y)  
  quantile(y)  
  summary(y)  
  
  
  x = c(88, NA, 12, 168, 13)
  mean(x)   # default : na.rm = FALSE
  mean(x, na.rm=TRUE)  
    
  ls() # R Workspace : This function can show How many subjects are in the WorkSpace.
  
  
  a = 1:88
  c(a, 13)  
  
  a = NULL  
  a  
  
  c(a,13) # NULL is the useful when you want to reset the variale (want to become variables as empty spcae)
  
  
  w <- NULL # This means you make object but we didn't make object's value
  
  
  # filtering
  
  x = 10:1 ; x
  
  x[3]  
  x[c(5,6)]  
  x[-c(5,6)]  
  
  x > 5 #logical vector
  x[x>5] # This means extracting the data
  
  x[x<3] = 1 # if this satisfy certain conditions, replace satisfied vector's location as certain value
  
  x[x<3] = 3:5 ; x

  
  # Subset function
  x = c(6, 1:3, NA, 12)
  x      

  x[x>5]  # All results appeared including NA
  subset(x, x>5) # All results appeared exclduing NA
  is.na(x)  # We can find which area has NA
  x = x[!(is.na(x))] # cleaing NA from your data
  
  x
  which(x>5) # show me location which is larger than 5th

  # possible code  
  x
  which(is.na(x))  
  
  any(x>20) # result can appear if one is larger than 20

  x = 1:10
  y = c(2,7,11)  
  
  x %in% y      # is x in y?
  y %in% x      # is y in x?

  
  ?match # match function shows each elements' location
  x = c(3,1,4,1)
  match(x, c(2,1,4))  
  
  str(iris) # shows data's structure, types, dimension, and variables
  
  
  
  # Question
  # A, B company. Which Company give workers more money?
  # (You contract period is 30 months)

  # A company : monthlypay "100,000,000 won"
  # B company : monthypay " 2^n won " ( n is from 0 to 29)
  
  
  # Code
  
  N = 30
  # A, B -> unit won
  A = sum(10000000*30)  
  B = sum(2^(1:30-1))

  isTRUE(A>B)  
  # B company gives more money to worker during 30 months
  
  
  
  ?sample
  
  # Tossing Coin
  
  N = 10000000
  x = sample(c(1,0), size=N, replace=T)  # number of Front
  sum(x) ; mean(x)

  # statistics : law of large number (simulation)
  
  
  # extracting random nunber from normal distribution
  N = 1000
  x = rnorm(N, mean=1, sd=sqrt(2))  
  mean(x) ; var(x)    
    # mean = consistency
    # X.bar is convergint the mu(pop)
  
  
  N = 20
  x = sample(50:100, size=N)
  y = sample(c("M","F"), size=N, replace = T)  

  m.score = x[y=="M"]  
  f.score = x[y=="F"]  
  
  mean(m.score) ; mean(f.score)
  
  # Caution : We can't do adding two structure for calculating
  # Don't forget formula about independent t- test
  
  
  
  
  ####################### course 3. Matrix
  
  # Matrix : rectangular array of numbers

    # Making Matrix
    y = matrix(1:4, ncol=2, nrow=2) ; y # default "byrow=F"
    matrix(1:4, ncol=2)    
    matrix(rep(3,6), nrow=3)    
    matrix(0,3,2)

    y = matrix(1:8, nrow=4)    ;y
    
    # indexing
    y[1,]
    y[,1]    
    y[2,2]
    y[3,2] 
    y[2:3,]
    
    class(y) # what is the type of y? "matrix"
    
    class(y[1,])  # integer : vector(정수형식)
    class(y[,1])  # integer : vector(정수형식)
    
    # Vector has length
    # Matrix has row and column numbers (Dimension)
    
    length(y)  # length
    dim(y)     # dimension
    nrow(y)    # of id
    ncol(y)    # of variable
    
    x = y[,1]
    class(x)
    is.matrix(x)    
    
    dim(x)  # x can be somethig when x is matrix
    length(x)
    y = t(as.matrix(x)) # making x as matrix, and then transposing x
    
    length(y)
    dim(y)    

    y = matrix(nrow=2, ncol=2) # All elements is NULL
    y[1,1] = 1   
    y[1,2] = 2
    y[2,1:2] = c(3,55)    
    
    # function related with matrix
    attributes(y) # similar as dim(y)
    class(y) # type of data
    ncol(y) ; nrow(y)    
    
    # calculation of linear algebra in Matrix
    a = matrix(c(1:-1, 2:0, 1,1,3),3,3)
    b = matrix(rep(c(1,2,3), each=3),3,3)
    
    a; b    
    a+b ; a-b
    3*a    # multiply number at all matrix's elements
    a%*%b  # multiply between matrics( inner product )   
    
    det(a)     # det|A|
    solve(a)   # inverse matrix
    a%*%solve(a) # Identity matrix
    
    svd(a)$d  # eigenvalue
    
    c = matrix(1,4,3)
    a%*%c  # there is no match between dimensions.
    c%*%a  
    
    det(a) ; solve(a)
    det(b) ; solve(b)    # b don't have inverse matrix
    
    # Ax = b
    
    # Linear equation
    A = matrix(c(1,2,3,4), ncol=2)
    x = c("x","y")  # we are interested in x vector
    b = c(4,2)
    
    Ax = b
    det(A)    
    x = det(A)*solve(A)%*%b
    
    # eigenvector / eigenvalue
    eigen(A)


    
    # image -> save the data
    # Depeding on How many are you cutting fixels, fixels are different.
    # grey -> 1024*1024
    
    # Eventually, Image data is Matrix
    # There is a function which can trasfer images data to matrix
    
    # Pixmap -> It has several function, which read files and then display the matrix
    
    library(pixmap)
    setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
    
    getwd() # checking working directory
    list.files()  # showing file's name in the working directory : character vector.
    
    mtrush1 = read.pnm("mtrush1.pgm")
    str(mtrush1)    # Data's information
    
    mtrush1   # This shows information image.
    
    plot(mtrush1) # That means picture can be presented by matrix.
    
    mtrush1@grey # we can see total matrix
    mtrush1@channels
    mtrush1@size    
    mtrush1@cellres    
    mtrush1@bbox    
    mtrush1@bbcent    # this infornmation can be present by using str() function

    
    
    mtrush1@grey[1:11,1:6]  #informal data
    # image, vocal files are also can be analyzed 
    
    
    
    # image -> numberize -> analyze
    
    str(mtrush1) # showing class
    
    #  Formal class 'pixmapGrey' [package "pixmap"] with 6 slots      ->class : need to check pixmapGrey 
    #  ..@ grey    : num [1:194, 1:259] 0.31 0.259 0.231 0.216 0.204 ...
    #..@ channels: chr "grey"
    ##..@ size    : int [1:2] 194 259
    #..@ cellres : num [1:2] 1 1
    #..@ bbox    : num [1:4] 0 0 259 194
    #..@ bbcent  : logi FALSE
    
    
    
    image.mat = mtrush1@grey
    class(image.mat)     # matrix -> it can make image
    
    image.mat[28,28] # point
    
    # chaning the color from image to white.
    x = mtrush1
    x@grey[20:80, 20:80] = 1    
    plot(x)    

    x@grey[20:30, 40:60] = 0  
    plot(x)    
    
    
    # making randomized noise by using runif
    y = mtrush1@grey[20:80, 20:80]
    rand = runif(length(y), min=0, max=1)    
    n.mat = matrix(rand, nrow=nrow(y))    
    
    t = 0.01
    
    mtrush1@grey[20:80, 20:80] = t*y + (1-t)*n.mat
    plot(mtrush1)
    
    # t*y + (1-n)*n.mat means?
    # sum(weight) = 1 : convex combination
    
    # filtering of matrix
    x = matrix(c(1:3, 2:4), nrow=3)
    
    # Add/Delete col & row
    
    A = matrix(runif(100), ncol=10)
    vector = runif(10)    
    data = cbind(A,vector)    
    dim(A)    
    length(vector)
    dim(data)
    
    z = matrix(c(1:4, rep(1,4), rep(0,4)),4,3)
    hh = rep(100,3)    
    rbind(hh,z)
    rbind(z,hh)    
    
    
    
    
    
    # From 50 to 100, randomly selecting the data (size=10)
    x = sample(50,100, size=10)    
        
    math = sample(50,100, size=10)
    korean = sample(50,100, size=10)    
    english = sample(50, 100, size=10)    
    id = 1:10    

    data = cbind(id, math, korean, english)     ; data
    
    # Some guy transfered the shool
    new = c(11,60,70,50)
    data.new = rbind(data,new)    ; data.new
    

    # matrix[,5,drop=F] <- When you selecting one column, it can make not change vector, continue to be matrix
    # or when you selecting some vector, you can change the data type as as.matrix()
    
    
    a = data.new[5,,drop=F]
    class(a)
    
    b = data.new[5,]
    class(b)
    
    
    # We want to remove work directory's things
    
    ls()
    rm(a)    #removing a
    
    ls()  # All object is showed
    list  # Showing the list
    
    class(ls()) # charactor vector
    rm(list=ls()) # All object is removed
    

    # When you want to collect data, Type has to be equal
    x = 1:10
    y = rep(c("a","b"), rep(5))    
    
    c(x,y)    
    # List can be added by all kinds of data
    
    
    # regression analysis
    # Model : y = b0 + b1x + e
    
    x = 1:10
    y = 2*x + rnorm(10)
    
    # rnorm is error term
    plot(y)
    
    # We'll estimate b0, b1 by least square method
    m = lsfit(x,y)
    
    # estimate b0,b1
    m$coefficients

    lsfit(x,y) # they can be presented by list ( but it has a lot of vectors)
    
    fit = lsfit(x,y)
    fit    
    
    class(fit) # type ; list
    
    # I'm interested in Coefficients
    fit$coefficients
    fit$residuals    #(Real data - Estimated data by model)
    
    fit[[1]] # 1st element
    fit[[2]]  # 2nd element
    
    # list's good thing : It is possible to have different data type, and it can show all data type once
    
    
    # Making List
    a = list(names = "Joe", salary = 55000, union = T , gender = "Male")
    b = list("Joes", 55000, T, "Male") # but list element's names are not here
    
    a$names
    b$names    # it didn't work
    
    b[[1]]
    b[[2]]    # So, when you want to select one point data, have to use [[]]
    
    # Know Type of data
    class(a) ; class(b)
    class(a$names)    
    class(a[[1]])   # This result is presented by "character" 
    class(a[1])    # This result is presented by "list"   
    
    # When I want to add the job's information
    a$job = " data analysist "
    
    # delecting list elements
    a$union = NULL

    a[5:6] = c(T,F)
    class(a[5])

    #Add names
    names(a)  # data : character vector,   5,6 names is none
    
    names(a)[5:6] = c("does he have certifications", "working experience" ) ; a
  
    
    length(a) # List is similar with vector, So it can be used by length function
    
    a # 6 information
    
    ## Note : list can be added by the other list
    
    a = list("Joe", 55000, T , 5)
    b = list(7)    

    c(a,b)    # Add a, b(tow lists)

    # Note1 : same dimension => matrix
    # Note2 : different dimension => list
    
    # confidence level
    # CLT : sampled mean is followed by Normal distribution when the n size is larger
    
    N = 30
    al = mean(runif(N))    
    a2 = mean(runif(N))    
    
    # This is followed by Normal distribution when continuing selecting N
    
    
    # Make dataframe
    fruits = c("banana", "apple"," peach", "grape")
    price = c(300, 500, 300, 600)    
    quantity = c(5,2,4,7)    
    
    d = data.frame(fruits, price, quantity)
    str(d)
    names(d) # checking variable's names
    dim(d)  # checking the datastructure's size
    
    d$price
    d$fruits
    d$quantity    

    #Selecting priceVecotr    
    d[,2]
    d$price    
    
    d[1,] # infor about banana
    d[2,] # infor about apple
    d[3,] # infro about peach
    
    class(d$price) # numeric vector
    
    # selecting conditional data
    d[d$price==300,]
    d[d$price>300,]    
    d[d$quantity>5,]   
    
    subset(d, price>500)
    subset(d, quantity<3)
    subset(d, quantity>4)
    
    # Ordering by Decreasing or increasing
    order(d$quantity) # Data's order shows Vector's formation
    class(order(d$quantity)) # index vector, "integer"
    
    d[order(d$price, decreasing = T),]
    d[order(d$price, decreasing = F),]        
    d[order(d$quantity, decreasing = F),]    
    
    ## Bring Out-data
    # header = T : 1st data uses Variables names
    # sep = "" : 구분자
    
    setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
    
??stringAsFactors  
    
    survey_blank = read.table(file="survey_blank.txt", header=TRUE, sep=" ", stringsAsFactors = T)
    survey_comma = read.table(file="survey_comma.txt", header=TRUE, sep=",", stringsAsFactors = F)
    
    survey_blank ; survey_comma
    
    str(survey_blank)
    str(survey_comma)    
    
    # Note: StringAsFactor
    
    # stringAsFactor = T : factor
    # stringAsFActor = F : character vector
    
    
    
    write.table(d, file="ex.txt", sep="@", row.names=T, col.names = T)    #results1
    
    write.table(d, file="ext.txt", sep="@", row.names=F, col.names=F)    #results2
    
    
    # Results 1 -> shows id's number(1,2,3,4) and Variables' names 
    # Results 2 -> dont shows id's number and variables names
    
    
    data1 = read.csv(file="survey_blank_saving.csv")
    data1[1,]    
    
    a = data.frame(x1 = rep(0,5), x2 = rep("x",5))    
    b = data.frame(x1 = rep(1,5), x2 = rep("d",5))    
    c = data.frame(x3 = rep(2,5), x4 = rep("z",5))    
    
    cbind(a,b)
    cbind(a,b,c)    # It's meaningful when the variables are same
    
    # It's impposible because Variable's names are different
    
    
    d1 = data.frame(Name = c("D.va", "Hanzo", "Mercy", "Soldier76"), country = c("Korea","Japan","Swiss", "USA"))
    d2 = data.frame(Age = c(19, 38, 37, 56, 31), Name = c("D.va", "Hanzo", "Mercy", "Soldier76", "Mei") )

    set = merge(d1, d2)  # But this not shows NA
    merge(d1, d2, by="Name")
    merge(d1, d2, by="Name", all=T) # This shows all data including NA
    
    merge(d1, d2, by="Name", all.x=T) # All X's data
    merge(d1, d2, by="Name", all.y=T) # All y's data
    
    
    
    # Question _ 틀린답안.
    N = 100
    id = 1:N    
    sex = rbinom(N, size=1, p=0.5)    # 1=woman 0=man
    ifelse(sex==1, "Woman","Man")

    subject = c("Korean", "English", "Math", "Sociaty")    
    Korean = runif(N, 10,95)    
    English = runif(N, 50,90)   
    Math = rnorm(N, mean=40, sd=10)    
    Sociaty = rnorm(N, 80,5)    
    bt = rbinom(N, size=3, p=0.5)    

    data.frame(id, sex, subject, Korean, English, Math, Sociaty, bt)    
    # Question _ 교수님답안.
    N = 10
    id = 1:N    
    kor = sample(70:95, N, replace=T)    
    Eng = sample(50:90, N , replace = T)    
    Mat = rnorm(N,40, 10) ; Mat[Mat>100] = 100    
    Soc = rnorm(N, 80,5) ; Soc[Soc>100]=100    

    Gen = sample(c("M","F"), N, replace = T)    
    Bld = sample(c("A","B","AB","O"),N, replace = T, prob=c(0.27, 0.25, 0.25,0.23))    
    d = data.frame(id, kor, Eng, Mat, Soc, Gen, Bld)    ; d
    
    library("dplyr")
    # %>% -> chain function
    
    class(iris)
    str(iris)    
    iris %>%  head %>% print  
    
    print(head(iris))    
    
    iris[,1:4] %>% head %>% colMeans %>% mean
    mean(colMeans(head(iris[,1:4])))    
    
    x = 1:10
    mean(x)    
    x %>% mean    
    
    setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
    exam = read.table(file="exam.txt", header = TRUE, stringsAsFactors = T)
    head(exam)    
    
    exam[exam$class==2|exam$class==3,]
    
    
    # filter function : extracting row
    filter(exam, class==1)
    filter(exam, class==1 | class==2)
    
    exam %>% filter(class == 1 | class == 2)
    exam %>% filter(class == 2)    
    exam %>% filter(class!=2)    
    
    # Math score is higher than 50
    exam %>% filter(math > 50)
    
    # Math score is smaller than 50
    exam %>% filter(math < 50)
    
    # Not class 2
    exam %>% filter(english >60 | class!=2)
    exam %>% filter(math >60 | class!=2)
    exam %>% filter(math >=90 | english >=90)
    
    # select function : extracing columns (x variables)
    exam %>% select(-math)
    exam %>% select(math)
    
    # 2,4 반의 영어점수, 과학점수
    exam %>% 
      filter(class==1|class==2) %>%
      select(english,science)
    
    exam %>% 
      filter(class==1|class==2) %>%
      select(english,science) %>%
      colMeans() %>%
      mean
    
    # Math 오름차순
    exam %>% arrange(math)

    # Math 내림차순
    exam %>% arrange(desc(math))
    exam %>% arrange(desc(class), math)        
    
    results = exam %>% arrange(desc(math), english)
    
    cor(results$math, results$english)    
    summary(lm(math~english, data=results))

    Sum = exam %>% select(-id, -class) %>% rowSums    
    Means = exam %>% select(-id, -class) %>% rowMeans    

    exam$Sum = Sum    
    exam$Mean = Means    

    exam = read.table(file = "exam.txt", header = TRUE, sep="\t", stringsAsFactors = F)
    
    Sum = exam %>% select(-id, -class) %>% rowSums
    Means = exam %>% select(-id, -class) %>% rowMeans    
    exam %>% mutate(Sum, Means)    

    x = exam$math    
    ifelse(x>50, "P","F")    
    
    exam %>%
      mutate(sum = math + english + science, 
             mean = sum/3,
             PF = ifelse(mean > 60, "P","F"))
    
    # correlation
    cor(exam$math, exam$science)

    # ANOVA
    summary(aov(exam$math ~ exam$gender))
    
    exam %>%
      filter(gender == "M") %>%
      select(english)

    # Question _ prof. answer
    
    w.a = 0.5*exam$math + 0.2*exam$english + 0.3*exam$science
    gender = rep(c("Male", "Female"), each=10)    
    name = paste("Name", 1:20, sep="")    
    tmp = exam %>%
      select(id,math, english, science) %>%
      mutate(w.a, gender, name)

    quantile(exam$w.a, probs=c(0.3,0.7)) # You write down A , B cut
    exam$grade = ifelse(w.a > 71.68, "A", ifelse(w.a >59.15,"B","C"))
    
    exam %>%
      arrange(id)
    
    # Summarise stat.
    # mean, sd, var, median
    
    # groub_by : You can get a results groupiing by colunm's level
    # By using ANOVA, test comparison of means 

    exam %>%
      summary(mean_math = mean(math))
    
    exam %>%
      group_by(class) %>%   # grouping by class
      summarise(mean_math = mean(math)) # calculating math mean
    
    exam %>%
      group_by(class) %>%
      summarise(mean_math = mean(math),
                sum_math = sum(math),
                median_math = median(math),
                n = n())
    exam %>%
      group_by(gender) %>%
      summarise(mean_math = mean(math),
                mean_eng = mean(english),
                mean_sci = mean(science),
                mean_tot = mean(w.a))
    exam %>%
      group_by(gender) %>%
      summarise(sd_math = sd(math),
                sd_eng = sd(english),
                sd_sci = sd(science),
                sd_tot = sd(w.a))
    
    # When you use stat (such as Quantile, range ... ), error
    # NOTE : Dimension
    
    
    # FACTOR, TABLE
    factor()
    defactor()
    
    score = c(rep("A",3), rep("B",3))
    factor(score, levels=c("A","B","C","D","F"))
    
    as.character(f.tmp)
    as.numeric(vector) # When you analyze survey test, Be careful especially  of calculating means
    
    as.numeric(f.tmp) %>% sum()
    
    
    # summarise categorical data as table 
    # -> obtaining the frequency
    
    height = c(173,182,155,169,163,161)
    year = c("1","1","2","3","3","4")    
    gender = c("M","M","F","M","F","F")    
    grade = c("A","C","B","B","A","C")    
    
    students_f = data.frame(height, year, gender,grade)    
    students_c = data.frame(height, year, gender,grade, stringsAsFactors = F)    
    
    str(students_f) ; str(students_c)

    c(students_f$year, 1) # changing numeric vector
    c(students_f$year, "1") # maintaing Categorical data 
    
    table(students_f$grade) # 1-dimension table
    table(students_f$gender, students_f$grade) #2-dimension table
    table(students_f$gender, students_f$grade, students_f$year) #3-dimension table
    
    class(students_c)
    ls() # Shows all things in R workspace
    
    attach(students_c) # That means I want to attach the students_c dataframe in R workspace
    detach(students_f) # That means I want to detach the students_f dataframe in R workspace
    
    #rm(list=c(Want to remove Things))
    
    
    
    
    
    # APPLY Fucntion
    # Apply is the packages that can do same things repeatly
    
    # tapply (depending on grouping)
    tapply(height, gender, mean)
    tapply(height, year, mean)
    class(tapply(height, gender, mean)) # array
    
    # Caution: Two vectors must have same dimension
    
    tapply(height, list(gender,grade), mean)
    class(tapply(height, list(gender,grade), mean)) # Matrix
    
    # 범주 = levels
    # levels option can make possible to see the factor
    
    height = c(173, 182, 155,169, 163,161)
    year = c("1","1","2","3","3","4")    
    gender = c("M","M","F","M","F","F")    
    grade = c("A","C","B","B","A","C")    
    students = data.frame(height, year, gender, grade)   ; students 
    str(students) # Possible value    

    #Cross tablulation
    x = table(students$gender)
    sum(x)   
    
    table(students$gender) %>%  #1-dimension table
      length
    
    table(students$gender,students$grade) %>% #2-dimension table
      colMeans
    
    table(students$gender,students$grade) %>%
      rowMeans
    
    #Categorical data's distribution : Table's Observed number :Marginal distribution
    
    students %>%
      group_by(gender) %>%
      summarise(mm = mean(height))

       # depending on column, Low / same function can be applied (tapply)
    # by grouping, we can analyze some data
    # in matrix , group by 1st, 2nd column, same work repeatly

    ?apply    
    apply(students,2,table) # We cannot calculate mean value
    
    res = apply(students, 2, table)
    names(res)    
    class(res)     # list
    
    res$grade
    
    # 1,2 row, col 
    
    # lapply -> by list

    tapply(students$height, students$gender, mean)
    tapply(students$height, students$gender, sd)
    tapply(students$height, students$gender, range)
         #Data Vector,     Group Vector,    function
    
    students$weight = c(62, 68, 78, 50,45,65)
    tmp = students[,c(1,5)]    
    tmp    
    
    tapply(tmp[,1], students$gender, mean)
    tapply(tmp[,2], students$gender, mean)
    
    # In Function, you can use additional function
    apply(tmp, 2, tapply, students$gender, mean)
    
    str(iris)
    apply(iris, 2, tapply, iris$Sepal.Length, sd)    
    tapply(students$height,
           list(students$gender, students$grade),
           mean)
    
    # Split for calculating t-apply data
    split(students$height, students$gender)
       
    a = lapply(split(students$height, students$gender), mean) 
    b = tapply(students$height, students$gender, mean)

    # a, b : Same results
    
    # a -> unlisting
    unlist(a)
    b
    

    
    
    library(dplyr)
    # summary
    split(students$height, students$gender) %>%
      lapply(mean) %>%
      unlist
    
    xx = c(rep("A",3), rep("B",3))
    split(students$height, 
          list(students$gender,xx))  
    
    xx = factor(c(rep("A",3), rep("B",3)))
    split(students$height,
          list(students$gender, xx))    

    # aggregate쓰면 tapply 안써도 됨.   
    
    
    iris[,1:4] %>% head
    aggregate(iris[,1:4], list(iris$Species), mean)       aggregate(iris[,1:4], list(iris$Species), range)
    aggregate(iris[,1:4], list(iris$Species), summary)
    
    
    # Barplot - Categorical data
    x = c(1,1,2,1,1,2,2,2,1,1,1,1)
    hist(x) # ? ->this is much better than using barplot
    
    x = table(x)
    barplot(x)    
    
    x = c("A","A","B","A","O","AB","AB")
    x = table(x)    
    hist(x)    

    x = round(runif(n=12, min=5, max=50))    
    barplot(x, names.arg = letters[1:length(x)])    
    barplot(x, names.arg = 1:length(x))    
    
    barplot(x, col=rainbow(length(x)))
    barplot(x, col=rainbow(length(x)), names.arg=letters[1:length(x)])
    
    x = sample(c("A","B","AB","O"), 100, prob = c(0.3, 0.25, 0.25, 0.2), replace = T)
    x = table(x)    
    barplot(x)    

    x = sample(c("1","2","3","4"), 100, prob = c(0.3, 0.25,0.25,0.2), replace = T)    
    x = table(x)    
    barplot(x, names.arg=c("A","B","AB","O"), col=1:4)    
    names(x) = c("A","B","AB","O")
    
    # pie graph
    aa = c(10,20,30,40)
    name.aa = c("Group1","Group2","Group3","Group4")    
    par(mfrow=c(2,2))    
    pie(aa, density = 10, angle=70)    
    
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
    
    # Regression Model
    
    x = 1:10
    y = 2:11    

    plot(x,y)    
    cor(x,y)    
    
    lm(y~x)    
    
    N = 50    
    x= runif(N, 0,5)    
    y = 1 +0.5*x + rnorm(N)    

    plot(x,y)    
    lm(y~x)    
    fit = lm(y~x)    
    names(fit)    
    summary(fit)

    plot(x,y, xlab="time", ylab="quantity", type="p")        
    
    x = c(2210, 2220, 2230,2232,2210,2260)
    y = 1:6    
    
    # checking y-axis
    plot(x,y, type="p", xlab="var1", ylab="var2", ylim=c(0,6))
    
    plot(y, x, type="b", xlab="time", ylab="price", lty=5)
    
    plot(y, x, type="b", xlab="time", ylab="price", lty=5, col="skyblue" )
    
    plot(y, x, type="b", xlab="time", ylab="price", lty=5, col="skyblue" , pch=10 )
    
    plot(y, x, type="b", xlab="time", ylab="price", lty=5, col="skyblue" , pch=10 , bg="grey", lwd=4)
    
    plot(y, x, type="b", xlab="time", ylab="price", lty=5, col="skyblue" , pch=10 , bg="grey", lwd=4, cex=9)
    
    plot(y, x, type="b", xlab="time", ylab="price")

    # It makes you do comparison between 1,2 class's grades
    
    
    
    # Matplot
    x = seq(-3,3, length=100)
    y = dnorm(x)    
    z = dnorm(x, mean=2, sd=1)
    w = dnorm(x, mean=0, sd=2)    
    
    data = matrix(c(y,z,w), ncol=3)    
    matplot(x, data, type="l", lwd=2)    
    
    plot(x, y , type="l") + plot(x,z,type = "l")
    # high level graphic function
    
    # line - function
    plot(x,y, type = "l")
    lines(x,z, col="skyblue")    
    lines(x,w, col="pink")    

    x = seq(-10, 10 , length=100)    
    plot(x,y, type="l", xlim=c(-6,6))    
    lines(x,z, col="skyblue")
    lines(x,w, col="pink")
    
    Data = matrix(c(y,z,w), ncol=3)
    
    matplot(x, Data, type = "l", lwd=2)
    
    
    matplot(x, Data, type="l", lwd=2)
    abline(h=0.1)    
    abline(v=0, col="grey")    
    abline(a=0, b=8, col="purple")    
    