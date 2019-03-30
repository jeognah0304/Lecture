


# weight average
titanic

# data전체개수 / Age 숫자에 대해 평균 구해보자.

# 그래서 weigted.mean(x,v)
# 그냥 평균구해도 됨

#3번문제.
weighted.mean(x,v)
mean(tmp$Age, na.rm=T)

#4번문제
attach(titanic)
tapply(Survived, sex, mean)

#5번문제_남녀최고령자.
idx = (Survived ==1) & (Sex == "Male")
Age[idx]
?order




#6번. 여성이면서 10대미만

# 생존율을 1,0,1,0 데이터의 mean을 구해보면 답이 나옴.
# dplyr 함수써도되고

?Subset()


par(mfrow=c(2,2))
# barplot 해서 9번 풀면 된다.


#10번 데이터 뽑아요 ->추출
# subset 해서 write.csv() 코드 쓰면 됨.




substr(nn, 5,9) # 데이터규칙
month()

# 데이터 규칙
# 년월일 구분자 ->없애고 세개의 변수를 쓰는 경우
# split

aa = c("2008_01_31", "2010_04_22")
aa
strsplit(aa,"_")    

