# 한국행정지도(2014)패키지 kormaps2014

kormaps패키지는 github에 있음. 
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
install.packages("moonBook2")
library(moonBook2)


#kormaps 패키지에는 areacode, kormap1, kormap2, kormap3, korpop1, korpop2, korpop3, tbc데이타가 포함

#시도별 위도 경도 정보
kormap1 : 2014년 한국행정지도(시도별)
kormap2 : 2014년 한국행정지도(시군구별)
kormap3 : 2014년 한국행정지도(읍면동별)

#인구데이터
korpop1 : 2015년 센서스데이터(시도별) 
korpop2 : 2015년 센서스데이터(시군구별) 
korpop3 : 2015년 센서스데이터(읍면동)

#변수명을 변경하여 진행하려면 rename을 사용한다.
korpop1<-rename(korpop1, pop=총인구_명, name=행정구역별_읍면동)


# 지도작성
# map_id로 지정된 code의 경우 숫치로 부여되어 있어서 지도에 표시할 때 실제 지역이름을 표시하기 위해 tooltip을 사용하여 실제이름인 name을 지정해줌

library(ggiraphExtra)
library(ggplot2) #aes구문을 위해 필요
ggChoropleth(korpop1, aes(fill=pop, map_id=code, tooltip=name), map=kormap1, interactive=T)

#변수명을 변경하지 않아도 실행 가능
ggChoropleth(korpop1, aes(fill=남자_명, map_id=code, tooltip=name), map=kormap1, subarea=c("전라","광주"))

문제 ) kosis에서 2015년 인구총조사 자료 중 성씨자료를 이용하여 여러분의 성씨(해당하는 본관)의 분포를 지도에 표시해 봅시다.  

자료위치 참고) 주제별 통계 - 인구총조사 - 인구부문 - 총조사인구(2015년이후) - 전수부문(등록센서스, 2015년 이후) - 성씨, 본관(2015년)  
