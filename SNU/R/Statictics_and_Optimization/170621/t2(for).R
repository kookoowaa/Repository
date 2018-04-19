x=c(1,-6,3,-5,9,4,-7,2,15)
cs=x[1]
for(i in 2:length(x)){
  cs[i]=cs[i-1]+x[i]
}
cs

cs1=numeric(length=9)
cs1[1]=1
for(i in 1:8){
  cs1[i+1]=cs1[i]+x[i+1]
}

  