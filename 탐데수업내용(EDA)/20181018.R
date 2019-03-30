






    # 지도에 점찍기

    library(dplyr)
    install.packages("ggiraphExtra")    
    install.packages("tibble")
    
    library(ggiraphExtra)   
    library(tibble)
    library(maps)
    library(mapproj)
    library(dplyr)
    library(ggplot2)
    
    head(USArrests)
    # 지역명이 행이름으로 되어있음
    # 행이름을 지역변수로 생성을 해야함
    
    crime = rownames_to_column(USArrests, var="state")
    crime$state = tolower(crime$state)  ; crime      
    states_map = map_data("state")    ; states_map
    
    ggChoropleth(crime, aes(fill=Murder, map_id=state), map=states_map)
    ggChoropleth(crime, aes(fill=Murder, map_id=state), map=states_map, interactive = T) # 커서 올리면 데이터 나타나는 기능 interactive = T
    
    
    
    
    
    
    
    
    
    
    
    
    # Asia

    asia <- map_data("world", region = c("China","Japan","North Korea","South Korea", "India"))
    
    # 원하는 나라를 map_data를 통하여 불러온다
    
    ggplot(asia, aes(x=longtitude, y=lattitude, group=group, fill=region)) + geom_polygon(colour="black") + scale_fill_brewer(palette="Set1")
    
    # geom_polygon을 이용하여 나라들의 테두리를 그리고 색깔로 채운다
    
    ###############
    
    
    
    
    
    korea <- map_data("world", region = c("North Korea", "South Korea"))
    ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set1")    
    
    
    
    # 2번의 지도로 하고싶은것은 남한과 북한의 도시별인구수를 시각적으로 표현하고 싶다. 모든 도시들을 표시하면 지저분하기 때문에 서울을 제외한 남한의 Top9도시와, 북한의 Top9도시의 인구수를 불러와야한다.
    
    
    
    ######코드#######
    
    
    
    data(world.cities)
    
    head(world.cities) # 데이터가 어떻게 생성되어있고 어떤변수들 무엇을 뜻한지 알아봐야한다
    
    skorea.pop <- world.cities[world.cities$country.etc %in% "Korea South",]
    
    skorea.pop <- skorea.pop[order(skorea.pop$pop),]
    
    skorea.pop <- tail(skorea.pop,10)
    
    skorea.pop <- skorea.pop[-10,]
    
    # South Korea에 해당하는 모든 도시들을 skorea.pop에 따로 저장해놓고 서울을 제외한 인구수가 가장많은 9개의 도시들을 골라냈다
    
    nkorea.pop <- world.cities[world.cities$country.etc %in% "Korea North",]
    
    nkorea.pop <- nkorea.pop[order(nkorea.pop$pop),]
    
    nkorea.pop <- tail(nkorea.pop,9)
    
    korea.pop <- rbind(skorea.pop,nkorea.pop)
    
    # South Korea, North Korea의 9개도시들을 하나로 합쳤다
    
    ###############
    
    
    
    
    
    
    
    
    
    
    3. 도시의 인구수를 원의크기로 나타내기
    
    ######코드#######
    
    
    
    
    
    ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set1")+ geom_point(data=korea.pop, aes(x=long, y=lat, size = pop), shape = 16, color = "green", alpha = 0.4)
    
    # alpha는 투명도를 뜻하고, size = pop를 함으로써 크기를 인구수와 비례하게 만들었다.
    
    ###############
    
    
    
    그래프를 만들긴했지만 전혀 도움이 안됀다. 원들이 너무 작고 눈에 띄지도 않는다. 
    
    
    
    
    
    
    
    
    
    4. 원의크기를 조절하기
    
    ######코드#######
    
    
    
    ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set1")+ geom_point(data=korea.pop, aes(x=long, y=lat, size = pop), shape = 16, color = "green", alpha = 0.4)+ scale_size_area(max_size=30)
    
    
    
    # scale_size_area를 통하여 원의크기를 조절할수 있다.
    
    ###############
    
    
    
    한결 좋아졌지만 원이 나타내는 도시를 알수없다면 무슨 소용이 있는가? 
      
      
      
      
      
      
      
      
      
      
      
    5. 도시의이름 삽입하기
    
    ######코드#######
    
    
    ggplot() + geom_polygon(data=korea, aes(x=long, y=lat, group=group, fill=region),colour="black") + scale_fill_brewer(palette="Set1")+ geom_point(data=korea.pop, aes(x=long, y=lat, size = pop), shape = 16, color = "green", alpha = 0.4)+ scale_size_area(max_size=30)+ geom_text(data=korea.pop, aes(x=long+0.2, y=lat+0.2, label=name))
    
    
    
    # 한글은 아니지만 원이 어떤 도시를 뜻하는지를 알수가 있다.
    
    ###############
    