A=matrix(c(1,2,0,0,3,0,2,-4,2),nrow=3,byrow=TRUE)
eigen(A)

A<-matrix(c(1,0,0,0,2,0,0,3,0,0,0,0,0,0,0,0,2,0,0,0),nrow=4,byrow=TRUE)
res<-svd(A)
res


### Single Value Decomposition
library(ISLR)
attach(Hitters)
head(Hitters)
Data<-Hitters[is.na(Salary)==FALSE,]
lm.fit<-lm(Salary~AtBat+Hits+HmRun+Runs+RBI+Walks,data=Data)
X<-Data[,1:6]
X<-cbind(rep(1,nrow(X)),X)
res=svd(X)
sigmahat<-sum(summary(lm.fit)$residual^2)/lm.fit$df.residual
sqrt(diag(sigmahat*res$v%*%diag(res$d^(-2))%*%t(res$v)))


### Cross- Validation
library(ISLR)
attach(Auto)
res = lm(mpg~horsepower, data = Auto)

set.seed(1)
train = sample(392, 392/2)

lm.fit = lm(mpg~horsepower, data = Auto, subset = train)
predict(lm.fit, Auto[-train,])
mean((mpg[-train]-predict(lm.fit, Auto[-train,]))^2)

lm.fit2 = lm(mpg~poly(horsepower,2),data = Auto, subset = train)
mean((mpg[-train]-predict(lm.fit2, Auto[-train,]))^2)

lm.fit3 = lm(mpg~poly(horsepower,3),data = Auto, subset = train)
mean((mpg[-train]-predict(lm.fit3, Auto[-train,]))^2)


### LOOCV
library(boot)
glm.fit = glm(mpg~horsepower, data=Auto)
coef(glm.fit)
coef(lm(mpg~horsepower, data = Auto))
cv.err = cv.glm(Auto, glm.fit)

glm.fit2 = glm(mpg~poly(horsepower,2), data=Auto)
cv.err2 = cv.glm(Auto, glm.fit2)

glm.fit3 = glm(mpg~poly(horsepower,3), data=Auto)
cv.err3 = cv.glm(Auto, glm.fit3)

cv.err$delta
cv.err2$delta
cv.err3$delta


### Bootstrap
alpha.fn = function(data, index){
  X = data$X[index]
  Y = data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

alpha.fn(Portfolio, 1:100)
alpha.fn(Portfolio, sample(100,100,replace=T))
boot(Portfolio, alpha.fn, R=1000)

test.fn = function(data,index)
  return(coef(lm(mpg~horsepower, data = data, subset = index)))

boot(Auto, test.fn, R = 1000)
