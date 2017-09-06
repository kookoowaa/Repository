faithful<-data(faithful)
View(faithful)
eruption<-faithful$eruptions
waiting<-faithful$waiting

hist(eruption)
edge1<-seq(from=1,to=6,by=0.4)
hist(eruption,breaks=edge1,freq=F,xlim=c(0,6)
     ,ylim=c(0,0.6),main='h=0.4')
faithful$waiting

barplot(VADeaths)
stem(eruption)
plot(eruption,waiting)

