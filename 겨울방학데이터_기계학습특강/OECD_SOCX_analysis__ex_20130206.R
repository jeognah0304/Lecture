
    rm(list=ls())

    install.packages(c("calibrate", "pls" ))
    

    library(graphics)
    library(MASS)
    library(calibrate)
    library(pls)
    
   
    setwd("H:/SecureUSB(필요한자료만_주요작업들)_20180918/개인용무_2019/기계학습을이용한빅데이터분석강좌(2019)/오미애_3주차/")
    raw.data <- read.csv("analysis_data.csv",header=T)

    
    

# names(raw.data)
# [1] "nation"                 "all65over"              "under75"
# [4] "X75over"                "men"                    "women"
# [7] "single"                 "couple"                 "all.age"
# [10] "socx_oa"                "socx_oa_c"              "socx_oa_b"
# [13] "socx_oa_c_1"            "socx_oa_c_2"            "socx_oa_c_3"
# [16] "socx_oa_b_4"            "socx_oa_b_5"            "socx_total"
# [19] "socx_health"            "socx_family"            "socx_unemployment"
# [22] "socx_oa.2009"           "socx_oa_c.2009"         "socx_oa_b.2009"
# [25] "socx_oa_c_1.2009"       "socx_oa_c_2.2009"       "socx_oa_c_3.2009"
# [28] "socx_oa_b_4.2009"       "socx_oa_b_5.2009"       "socx_total.2009"
# [31] "socx_health.2009"       "socx_family.2009"       "socx_unemployment.2009"





    data.2009 <-raw.data[,22:33]

    data1 <- raw.data[,1:21]
    data2 <- raw.data[,c(1:12,18:20)]

    #   data1[16,]  Korea
    ok <-complete.cases(data2)
    data3 <- data2[ok,]  #  poverty and socx_oa + socx_oa_c + socx_oa_b + socx other

    
    #> head(data3[,10:12])
    #socx_oa socx_oa_c socx_oa_b
    #1    4.77  3.230000 1.5700000
    #2   10.80 10.330000 0.4300000
    #3    7.27  7.100000 0.1300000
    #5    6.70  6.433333 0.2333333
    #6    7.37  5.530000 1.7700000
    #7    8.53  7.530000 1.0000000
    
    
    
    
    data3$socx_oa_b <-  data3$socx_oa_b +0.0000001
    data3$socx_family <-  data3$socx_family +0.0000001

    hist(log(data1[,2]))

    adj <- c(0.13,0.17,0.17,0.15,0.16,0.17,0.17,0.2,0.19,0.16,0.12,0.11,0.2,0.22,0.1,0.06,0.15,
              0.13,0.15,0.13,0.18,0.12,0.17,0.18,0.17,0.07,0.16,0.13)*100
    
 
    data3[,10:12]<-data3[,10:12]/adj

    data.st <-stdize(log(data3[,-1]), center = TRUE, scale = TRUE)
    name <- c("nation",names(data.st))

    Data <-cbind(data3[,1],data.st$all65over,data.st$under75,data.st$X75over   ,data.st$men,
    data.st$women
    ,data.st$single , data.st$couple,  data.st$all.age, data.st$socx_oa,  data.st$socx_oa_c,     
    data.st$socx_oa_b,
    data.st$socx_total,   data.st$socx_health,data.st$socx_family )

    colnames(Data) <-name
    rownames(Data) <-data3[,1]


   #  ols between old age poverty and socx_oa

    x <- Data[,"socx_oa"]
    y <- Data[,"all65over"]
    lm.xy<-lm(y~x)
    new<-data.frame(x=seq(from=min(x), to=max(x), length.out=10))
    c.lim<-as.data.frame(predict(lm.xy, new, level=0.95, interval="confidence"))
    plot(x,y, xlim=c(-3,1.5),xlab="socx_old age",ylab="elderly poverty rate",cx=1.5)
    abline(lm.xy, "red")
    lines(cbind(new,c.lim$lwr), col="blue", lty="dashed")
    lines(cbind(new,c.lim$upr), col="blue", lty="dashed")
    textxy(x, y,data3[,1],cx=1.3)
    reg.1<- summary(lm.xy)
    reg.1




 Data <-cbind(data3[,1],data.st$all65over,data.st$under75,data.st$X75over   ,data.st$men,   data.st$women
    ,data.st$single , data.st$couple,  data.st$all.age, data.st$socx_oa,  data.st$socx_oa_c,     data.st$socx_oa_b,
    data.st$socx_total,   data.st$socx_health,data.st$socx_family )

    colnames(Data) <-name
    rownames(Data) <-data3[,1]
    #  corr between old age poverty and socx

    data.cor <-cor(Data[,2:15])

    write.table(data.cor ,  "stand_data_cor_22.csv", sep=",", col.names = NA
        ,row.names = T)

    cor.prob <- function(X, dfr = nrow(X) - 2) {
    	 R <- cor(X)
    	 above <- row(R) < col(R)
    	 r2 <- R[above]^2
    	 Fstat <- r2 * dfr / (1 - r2)
    	 R[above] <- 1 - pf(Fstat, 1, dfr)
    	 R
    }


    data.corprob<-round(cor.prob(Data[,2:15]),4)

    write.table(data.corprob , "stand_data_cor_prob_22.csv", sep=",", col.names = NA
        ,row.names = T)





#################################################################
###    "all65over" ,"socx_oa_c","socx_oa_b" ,"socx_health"    ###
#################################################################


    #  hierarchical clustering
    x <- Data[,c("all65over" ,"socx_oa_c","socx_oa_b","socx_health" )]
   
    hc <- hclust(dist(x)^2, "complete")
    plot(hc)
    plot(hc, hang = -1)
    
    hc <- hclust(dist(x)^2, "single")
    plot(hc)
    plot(hc, hang = -1)
    
    
    hc <- hclust(dist(x)^2, "ave")
    plot(hc)
    plot(hc, hang = -1)
    

    #  PCA

    or.PCA.re<- princomp(x,cor=TRUE)

    or.PCA.re
    mm<-loadings(or.PCA.re)

    write.table(or.PCA.re$sdev, "_PCA_v4(20130111).csv", sep=",", col.names = NA
    ,row.names = T)

    write.table(mm,  "_PCA_loading_v4(20130111).csv" , sep=",", col.names = NA
    ,row.names = T)


    lc.pca<-data.frame(Data,score1=or.PCA.re$scores[,1],score2=or.PCA.re$scores[,2] )


    #  plot #

    file <- paste("PCA_v4(20130111)_1",".jpg",sep="")
    jpeg(file,pointsize=10,width=640,height=640,quality=100)

    plot(or.PCA.re$scores[,1],or.PCA.re$scores[,2],pch=1, col="black",main="", xlab="Principal Component
    1", ylab="Principal Component 2",xlim=c(-3,3.3)  )
   textxy(or.PCA.re$scores[,1], or.PCA.re$scores[,2],data3[,1],cx=1.5)

    dev.off()


