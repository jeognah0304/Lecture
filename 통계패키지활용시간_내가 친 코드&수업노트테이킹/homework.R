

    setwd("C:/Users/parkjeongah/Desktop/working/studying major/통계패키지활용")
    Titanic = read.csv(file="titanic.csv", header = T)    
    
  str(Titanic)    
  
  # 1. 생존율 구하기
  attach(Titanic)
  mean(Survived)  
  
  #2. 탑승객 나이에 대한 평균, 중위수, 분산, 표준편차
  summary(Titanic$Age, na.rm = T) # 평균, 중위수
  var(Titanic$Age, na.rm = T)
  sd(Titanic$Age, na.rm = T)
  
  # 3. 가중평균함수를 이용해 생존자의 평균나이를 구하시오
  tmp = Titanic[Survived==1,]
  mean(tmp$Age, na.rm=T)
  
  # 4. 남녀 생존율
  # way1
  library(dplyr)
  Woman = Titanic %>% filter(Sex == "female") 
  mean(Woman$Survived, na.rm = T)
  
  man = Titanic %>% filter(Sex == "male") 
  mean(man$Survived, na.rm = T)
  
  # way2
  tmp1 = Titanic[Sex=="female",]
  mean(tmp1$Survived)
  
  tmp2 = Titanic[Sex=="male",]
  mean(tmp2$Survived)
  
  # 5. 남성최고령자생존자와 여성최고령자 생존자
  Titanic %>%
    filter(Sex == "female") %>%
    arrange(desc(Age)) %>%
    head
  
  Titanic %>%
    filter(Sex == "male") %>%
    arrange(desc(Age)) %>%
    head
  
  # 6. 여자 10살미만, 10대, 20대 생존율 
  #way1
  Woman %>%
    filter(Age < 10 ) %>%
    summarize(mean = mean(Survived))
  
  Woman %>%
    filter(Age >= 10 & Age <20 ) %>%
    summarize(mean = mean(Survived))

  Woman %>%
    filter(Age >= 20 & Age <30 ) %>%
    summarize(mean = mean(Survived))
  #way2
  w_baby = Woman[Age<10,]
  w_10 = Woman[Age>=10 & Age<20,]
  w_20 = Woman[Age>=20 & Age<30,]
  
  mean(w_baby$Survived, na.rm=T)
  mean(w_10$Survived, na.rm=T)
  mean(w_20$Survived, na.rm=T)
  
  # 7. 부모와 함께 탄 아이는 총 몇명인가? _ 다시풀기
  #way1
  tmp = Titanic[Parch>=0&Parch<15,]
  tmp = Titanic[Age<20,]
  dim(tmp)[1, ]
  
  #way2
  Titanic %>%
    filter(Parch>0 & Parch<15) %>%
    filter(Age<20)
  
  # 8. taaply함수 이용해서 좌석 등급별 생존율을 구하시오
  tapply(Titanic$Survived, Titanic$Pclass, mean)
  
  #9. 생존여부, 좌석등급, 성별, 나이의 분포를 위한 4개의 그림을 하나의 창에 그리시오
  par(mfrow=c(2,2))
  table1 = table(Titanic$Survived, Titanic$Survived)
  table2 = table(Titanic$class, Titanic$class)
  

  #10. 좌석등급이 1등급 혹은 2등급이고, 나이가 40세 이상인 생존한 남성의 자료를 추출하여 c:/ 폴더에 csv 파일로 저장하여라
  
  data = Titanic %>%
    filter(Pclass=="1" | Pclass=="2") %>%
    filter(Age>40) %>%
    filter(Sex=="male")

  setwd("c:/")
  write.csv(data,file="data.csv")  
  