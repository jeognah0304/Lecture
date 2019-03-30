
install.packages("dplyr")
install.packages("ggiraphExtra")
install.packages("tibble")
install.packages("maps")
install.packages("ggplot2")
install.packages("mapproj")
library(dplyr)
library(ggiraphExtra)
library(tibble)
library(maps)
library(ggplot2)
library(mapproj)

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")

library(kormaps2014)
library(moonBook2)

areacode

str(kormap1)

  setwd("C:\\Users\\parkjeongah\\Desktop\\working\\studying major\\탐사적데이터분석")
  park = read.csv(file="park.csv", header=FALSE)
  names(park) = c("행정구역","전체국내인구","남성","여성")
  
  park
  
  library(ggplot2)
  theme_set(theme_gray(base_family="NanumGothic"))
  
  ggplot(korpop1,aes(map_id=code,fill=총인구_명))+
    geom_map(map=kormap1,colour="black",size=0.1)+
    expand_limits(x=kormap1$long,y=kormap1$lat)+
    scale_fill_gradientn(colours=c('white','orange','red'))+
    ggtitle("2015년도 시도별 인구분포도")+
    coord_map()
  
  ggChoropleth(park,kormap1,fillvar="성씨",facetvar="year",tooltip="name",interactive=TRUE)
  