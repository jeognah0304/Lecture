


    # 텍스트처리

    # 대문자, 소문자 변환.

    tolower("KOREA")
    toupper("Korea")
    
    # 글자수 세는 함수
    nchar("Korea")
    nchar("안녕나는잠못자서죽을거같아")    
    nchar("안녕 나는 잠 못자서 죽을 거 같아")    # 띄어쓰기도 인식이 됨.
    
    nchar(c("korea","한국"))
    length(c("korea","한국"))

    substr("BigdataAnalysis",4,7)    
    substr("BigdataAnalysis",8,15)    

    
    x = c("Korea", "Japan", "England")    
    substr(x, 1,3)    # 한꺼번에 사용 가능.
    
    
    strsplit # 문장에서 여러개 쪼개주는 함수
    myword = "Chungnam national university student"
    x = strsplit(myword, split = " ")    
    class(x)    # list로나옴. 여러개를 한번에 해 줄수가 있음
    
    myword1 = "Wear the old coat and but the new book"
    myword2=  " Do your best"
    myword3= " Heroes never die"      

    myword = c(myword1, myword2, myword3)    
    myword    

    x = strsplit(myword, split = " ")
    x
    
    
    # 띄어쓰기 아닌것도 한번 해보겠습니다
    word = "This is an apple. This is a banana"

    # 점을 기준으로 자른다 가정
    strsplit(word, split=".") #.나 , 는 인식 불가
    strsplit(word, split="\\.")

    
    paste() # 합쳐주는 함수
    number = 1:10
    alphabet = c("a","b","c")    

    alphabet
    
    paste("number", "alphabet", sep="-") # 문자인식    
    paste(number, alphabet, sep="-")    # 저장된 숫자인식.
    paste(number, alphabet, sep="")
    paste0(number , alphabet)  # sep="" 생략하고 싶을때    
    
    paste(number, alphabet, collapse="")
    x = paste(number, alphabet, collapse="")
    length(x)    
    
    paste(number, alphabet, collapse=" ") # 띄어서
    
    
    
    
    
    
    
    ## 각자실습
    n = 1:100
    char = c(rep("student",50), rep("teacher",50))
    id =  paste0(n, char)
      
      
      myword = c(myword1, myword2, myword3)
      results = strsplit(myword, split= " ")    
      
      
      paste(results[[1]], collapse=" ")
      paste(results[[2]], collapse=" ")
      paste(results[[3]], collapse=" ")

      for(i in 1:3){
        print(paste(results[[i]], collapse=" "))
        
      }      # Test 주의.
      
      
      
      # 텍스트처리함수는 character함수여야 표현이 되서
      # 데이털르 character화함. as.character
      
      
      # 그다음에, 년도, 월, 시간 다 쪼갠뒤에
      # paste 함수로 같이 붙이는데, 짝대기 몇개, 시간은 :으로 붙이기
      
      # 그래서 대여일시라는 변수를 따로 만들어서
      x$대여일시 = paste0(x0, "-", x1, "-", x2) #원하는 방식으로 날짜가 코딩이 됨.
      
      x$대여시간 = paste0(x3,":", x4,":",x5) # 원하는 방식으로 시간이 코딩이 됨.
      
      # 반납일시 가지고 -> 시간과 분을 뽑아냄.
      
      
      
      
      
      # 크롤링 : 
      # fast mode : 빠르긴한데 차단될수있음
      