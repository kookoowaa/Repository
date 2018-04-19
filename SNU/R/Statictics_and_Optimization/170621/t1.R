3+5
x<-c(1,2,3)
rbind(x,c(2,3,4))

x1=seq(1,9,2); x1
x2=rep(1,10); x2

x=c(1,2,3,4);x=as.character(x);x
print(x)
as.integer(x1)

mv<-c(8,6,9,20,5)
ml=list(name='Fred', wife='Mary',mv)
ml

mv[2]
ml[[3]][1]

t1<-table(mv)
t1
t1[[5]]
str(t1)
a<-6+t1[5];a

mean(mv)
mv
