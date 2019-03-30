
  rm(list=ls())

  install.packages("rgeos")
  install.packages("maptools")
  install.packages("rgdal")  
  library("rgeos")
  library("maptools")
  library("rgdal")
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석\\201712기초구역DB_전체분\\전라남도")
    
  
  # readOGR("경로/파일명/shp", encoding="UTF-8") 이렇게 해야 한글안 깨짐.
  xx = readShapePoly(fn = "TL_KODIS_BAS_46.shp", IDvar=NULL, proj4string=CRS(as.character(NA)),
                     verbose=FALSE, repair=FALSE, force_ring=FALSE, delete_null_obj=FALSE,
                     retrieve_ABS_null=FALSE)
  plot(xx, border="purple", axes=TRUE, las=1)
  # 데이터 구조 확인 - > 지역명이 어떤 변수명으로 구성되어있는지 보는게 좋음.
  str(xx@data)
  
  xx$SIG_KOR_NM
  
  library(ggplot2)
  x = fortify(xx, region="SIG_KOR_NM") # 데이터프레임으로 바꾸는 거.
  str(x)  
  x
  
  
  id = c("서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주특별자치도")
  pop = c(699945,240049,174218,197084,119367,129500,75679,18151,849008,107260,118717,148933,128067,99316,171472,200573,40351)
  census = data.frame(id,pop)

  
  library(dplyr)  
  data = x %>% left_join(census) 
  head(x)

  ?ggplot
  ggplot(data, aes(x=lat, y=long, group=group)) +
    geom_polygon(aes(fill=pop)) 
    
  
  
  
  
  
  xx = readShapePoly(fn = "TL_KODIS_BAS_46.shp", IDvar=NULL, proj4string=CRS(as.character(NA)),
                     verbose=FALSE, repair=FALSE, force_ring=FALSE, delete_null_obj=FALSE,
                     retrieve_ABS_null=FALSE)
  plot(xx, border="purple", axes=TRUE, las=1)
  str(xx@data)
  
  xx$SIG_KOR_NM
  
  library(ggplot2)
  x = fortify(xx, region="SIG_KOR_NM") # 데이터프레임으로 바꾸는 거.
  str(x)  
  x
  
  
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석\\201712기초구역DB_전체분\\전라남도")
  library("rgeos")
  library("maptools")
  library("rgdal")
  
  
  xx = readShapePoly(fn = "TL_KODIS_BAS_46.shp", IDvar=NULL, proj4string=CRS(as.character(NA)),
                     verbose=FALSE, repair=FALSE, force_ring=FALSE, delete_null_obj=FALSE,
                     retrieve_ABS_null=FALSE)
  plot(xx, border="purple", axes=TRUE, las=1)
  # 데이터 구조 확인 - > 지역명이 어떤 변수명으로 구성되어있는지 보는게 좋음.
  str(xx@data)
  
  xx$SIG_KOR_NM
  
  library(ggplot2)
  x = fortify(xx, region="SIG_KOR_NM") # 데이터프레임으로 바꾸는 거.
  str(x)  
  x
  
  
  
  
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석\\CTPRVN_201804")
  data=read.csv(file="4-2data.csv")
  data = data[c(135,139:160),]
  names(data)=c("id","pop")
  data
  
  pop <- data$pop
  id <- data$id
  
  data = data.frame(id,pop)
  
  library(dplyr)
  data = x %>% left_join(data) 
  head(x)
  
  ?ggplot
  ggplot(data, aes(x=lat, y=long, group=group)) +
    geom_polygon(aes(fill=pop)) 
  
  
  
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석\\201712기초구역DB_전체분\\서울특별시")
  
  
  # readOGR("경로/파일명/shp", encoding="UTF-8") 이렇게 해야 한글안 깨짐.
  xx = readShapePoly(fn = "TL_KODIS_BAS_11.shp", IDvar=NULL, proj4string=CRS(as.character(NA)),
                     verbose=FALSE, repair=FALSE, force_ring=FALSE, delete_null_obj=FALSE,
                     retrieve_ABS_null=FALSE)
  plot(xx, border="purple", axes=TRUE, las=1)
  # 데이터 구조 확인 - > 지역명이 어떤 변수명으로 구성되어있는지 보는게 좋음.
  str(xx@data)
  
  xx$SIG_KOR_NM
  
  library(ggplot2)
  x = fortify(xx, region="SIG_KOR_NM") # 데이터프레임으로 바꾸는 거.
  str(x)  
  x
  
  
  
  
  
  
  
  
  
  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석\\CTPRVN_201804")
  data=read.csv(file="서울특별시.csv")
  names(data)=c("id","pop")
  data
  
  pop <- data$pop
  id <- data$id
  
  data = data.frame(id,pop)
  
  library(dplyr)
  data = x %>% left_join(data) 
  head(x)
  
  ?ggplot
  ggplot(data, aes(x=lat, y=long, group=group)) +
    geom_polygon(aes(fill=pop)) 
  
  
  
  
  
  
  
  
  
  
  
  