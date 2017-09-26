# 1 -----------------------------------------------------------------------
#1)
Auto = read.csv("Auto.csv", header=T, na.strings="?")
Auto = na.omit(Auto)
summary(Auto)
attach(Auto)
lm.fit = lm(mpg ~ horsepower)
summary(lm.fit)
predict(lm.fit, data.frame(horsepower=c(98)), interval="confidence")
predict(lm.fit, data.frame(horsepower=c(98)), interval="prediction")
#2)
plot(horsepower, mpg)
abline(lm.fit)
#3)
par(mfrow=c(2,2))
plot(lm.fit)

# 2 -----------------------------------------------------------------------
#1)
lm.fit1 = lm(mpg~.-name, data=Auto)
summary(lm.fit1)
#2)
par(mfrow=c(2,2))
plot(lm.fit1)
plot(predict(lm.fit1), rstudent(lm.fit1))
#3)
lm.fit2 = lm(mpg~cylinders*displacement+displacement*weight)
summary(lm.fit2)
#4)
lm.fit3 = lm(mpg~log(weight)+sqrt(horsepower)+acceleration+I(acceleration^2))
summary(lm.fit3)
par(mfrow=c(2,2))
plot(lm.fit3)
lm.fit2<-lm(log(mpg)~cylinders+displacement+horsepower+weight+acceleration+year+origin,data=Auto)
summary(lm.fit2)
par(mfrow=c(2,2)) 
plot(lm.fit2)
plot(predict(lm.fit2),rstudent(lm.fit2))


# 3 -----------------------------------------------------------------------
#1)
library(ISLR)
Carseats
c<-is.na(Carseats)
which(c,arr.ind = TRUE) 

summary(Carseats)
attach(Carseats)
lm.fit <- lm(Sales~Price+Urban+US)
summary(lm.fit)


#Price
#The linear regression suggests a relationship between price and sales given 
#the low p-value of the t-statistic. The coefficient states a negative relationship
#between Price and Sales: as Price increases, Sales decreases.

#UrbanYes
#The linear regression suggests that there isn't a relationship between 
#the location of the store and the number of sales based on the high p-value 
#of the t-statistic.

#USYes
#The linear regression suggests there is a relationship between 
#whether the store is in the US or not and the amount of sales. 
#The coefficient states a positive relationship between USYes and Sales: 
#if the store is in the US, the sales will increase by approximately 1201 units.


#Sales = 13.04 + -0.05 Price + -0.02 UrbanYes + 1.20 USYes

#Price and USYes are significant, based on the p-values, F-statistic, and p-value of the F-statistic.

#2)
lm.fit2 = lm(Sales ~ Price + US)
summary(lm.fit2)

anova(lm.fit2,lm.fit)

#Based on the RSE and R^2 of the linear regressions, they both fit the data 
#similarly, with linear regression from (e) fitting the data slightly better.

#3)
lm.fit3=lm(Sales~ Price+US+Price:US,data=Carseats)
#or 
lm.fit3=lm(Sales~ Price*US,data=Carseats)
summary(lm.fit3)


#4)
confint(lm.fit2)
##                2.5 %  97.5 %
## (Intercept) 11.79032 14.2713
## Price       -0.06476 -0.0442
## USYes        0.69152  1.7078

par(mfrow=c(2,2))
plot(lm.fit2)


# 4 -----------------------------------------------------------------------
#1)
install.packages("car")
library(car)
cement<-read.table("cement.txt",header=T)
cement1<-cement[,-1]
c<-cor(cement1)
library(corrplot)
corrplot(c, method = "circle")
#There is a strong negative correlation between X2X4(-0.973) and X1X3 (-0.824). 
#The remaining pairwise correlations are all quite low.


#2)
lm.fit5<-lm(y~.,data=cement)
vif(lm.fit5)


#3)
summary(lm.fit5)

#4)
lm.fit6<-lm(y~x1+x2,data=cement)
summary(lm.fit6)
vif(lm.fit6)


# 5 -----------------------------------------------------------------------
#(1)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
Auto=na.omit(Auto)
summary(Auto)

attach(Auto)
mpg01 = rep(0, length(mpg))
mpg01[mpg > median(mpg)] = 1
Auto = data.frame(Auto, mpg01)

#(2)
train = (year%%2 == 0)  # if the year is even
test = !train
Auto.train = Auto[train, ]
Auto.test = Auto[test, ]
mpg01.test = mpg01[test]

library(MASS)
lda.fit = lda(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, 
              subset = train)
lda.fit
lda.pred = predict(lda.fit, Auto.test)
lda.pred
names(lda.pred)
lda.class=lda.pred$class
table(lda.class,mpg01.test)
mean(lda.class==mpg01.test)
mean(lda.class != mpg01.test)
(14+9)/(182)


#(3)
qda.fit = qda(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, 
              subset = train)
qda.pred = predict(qda.fit, Auto.test)
qda.class=qda.pred$class
mean(qda.pred$class != mpg01.test)
mean(qda.class==mpg01.test)
table(qda.class,mpg01.test)
(13+11)/(182)

#(4)
glm.fit = glm(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, 
              family = binomial, subset = train)
glm.probs = predict(glm.fit, Auto.test, type = "response")
glm.pred = rep(0, length(glm.probs))
glm.pred[glm.probs > 0.5] = 1
mean(glm.pred != mpg01.test)

#(5)

library(class)
train.x = cbind(cylinders, weight, displacement, horsepower)[train, ]
test.x = cbind(cylinders, weight, displacement, horsepower)[test, ]
train.mpg01 = mpg01[train]

set.seed(1)
# KNN(k=1)
knn.pred = knn(train.x, test.x, train.mpg01, k = 1)
mean(knn.pred != mpg01.test)

# KNN(k=10)
knn.pred = knn(train.x, test.x, train.mpg01, k = 10)
mean(knn.pred != mpg01.test)

# KNN(k=100)
knn.pred = knn(train.x, test.x, train.mpg01, k = 100)
mean(knn.pred != mpg01.test)


# 6 -----------------------------------------------------------------------

#1)
Default <- read.table("Default.txt")

attach(Default)
set.seed(1)
glm.fit = glm(default ~ income + balance, data = Default, family = binomial)
summary(glm.fit)
#2)
boot.fn = function(data, index) 
  return(coef(glm(default ~ income + balance, data = data, family = binomial, subset = index)))
#3)
library(boot)
boot(Default, boot.fn, 50)

# 7 -----------------------------------------------------------------------

#1)
set.seed(1)
y = rnorm(100)
x = rnorm(100)
y = x - 2 * x^2 + rnorm(100)
#2)
library(boot)
Data = data.frame(x, y)
set.seed(1)
# i.
glm.fit = glm(y ~ x)
cv.glm(Data, glm.fit)$delta
# ii.
glm.fit = glm(y ~ poly(x, 2))
cv.glm(Data, glm.fit)$delta
# iii.
glm.fit = glm(y ~ poly(x, 3))
cv.glm(Data, glm.fit)$delta
# iv.
glm.fit = glm(y ~ poly(x, 4))
cv.glm(Data, glm.fit)$delta
#3)
summary(glm.fit)
# poly 2 is best


# 8 -----------------------------------------------------------------------

#(1)

data.full = read.table("data.txt")
library(leaps)
mod.full = regsubsets(y ~ poly(x, 10, raw = T), data = data.full, nvmax = 10)
mod.summary = summary(mod.full)

which.min(mod.summary$cp)
which.min(mod.summary$bic)
which.max(mod.summary$adjr2)

plot(mod.summary$cp, xlab = "Subset Size", ylab = "Cp", pch = 20, type = "l")
points(3, mod.summary$cp[3], pch = 4, col = "red", lwd = 7)

plot(mod.summary$bic, xlab = "Subset Size", ylab = "BIC", pch = 20, type = "l")
points(3, mod.summary$bic[3], pch = 4, col = "red", lwd = 7)

plot(mod.summary$adjr2, xlab = "Subset Size", ylab = "Adjusted R2", pch = 20, 
     type = "l")
points(3, mod.summary$adjr2[3], pch = 4, col = "red", lwd = 7)

coef(mod.full, 3)


#(2)

mod.fwd = regsubsets(y ~ poly(x, 10, raw = T), data = data.full, nvmax = 10, 
                     method = "forward")
mod.bwd = regsubsets(y ~ poly(x, 10, raw = T), data = data.full, nvmax = 10, 
                     method = "backward")
fwd.summary = summary(mod.fwd)
bwd.summary = summary(mod.bwd)
which.min(fwd.summary$cp)
which.min(bwd.summary$cp)
which.min(fwd.summary$bic)
which.min(bwd.summary$bic)
which.max(fwd.summary$adjr2)
which.max(bwd.summary$adjr2)


par(mfrow = c(3, 2))
plot(fwd.summary$cp, xlab = "Subset Size", ylab = "Forward Cp", pch = 20, type = "l")
points(3, fwd.summary$cp[3], pch = 4, col = "red", lwd = 7)
plot(bwd.summary$cp, xlab = "Subset Size", ylab = "Backward Cp", pch = 20, type = "l")
points(3, bwd.summary$cp[3], pch = 4, col = "red", lwd = 7)
plot(fwd.summary$bic, xlab = "Subset Size", ylab = "Forward BIC", pch = 20, 
     type = "l")
points(3, fwd.summary$bic[3], pch = 4, col = "red", lwd = 7)
plot(bwd.summary$bic, xlab = "Subset Size", ylab = "Backward BIC", pch = 20, 
     type = "l")
points(3, bwd.summary$bic[3], pch = 4, col = "red", lwd = 7)
plot(fwd.summary$adjr2, xlab = "Subset Size", ylab = "Forward Adjusted R2", 
     pch = 20, type = "l")
points(3, fwd.summary$adjr2[3], pch = 4, col = "red", lwd = 7)
plot(bwd.summary$adjr2, xlab = "Subset Size", ylab = "Backward Adjusted R2", 
     pch = 20, type = "l")
points(4, bwd.summary$adjr2[4], pch = 4, col = "red", lwd = 7)


coefficients(mod.fwd, id = 3)
coefficients(mod.bwd, id = 3)
coefficients(mod.bwd, id = 4)


#(3)

library(glmnet)
xmat = model.matrix(y ~ poly(x, 10, raw = T), data = data.full)[, -1]
y=data.full$y
set.seed(1)
mod.lasso = cv.glmnet(xmat, y, alpha = 1)
best.lambda = mod.lasso$lambda.min
best.lambda
par(mfrow = c(1, 1))
plot(mod.lasso)

best.model = glmnet(xmat, y, alpha = 1)
predict(best.model, s = best.lambda, type = "coefficients")



# 9 -----------------------------------------------------------------------

#(1)

library(MASS)
attach(Boston)
lm.fit = lm(nox ~ poly(dis, 3), data = Boston)
summary(lm.fit)
dislim = range(dis)
dis.grid = seq(from = dislim[1], to = dislim[2], by = 0.1)
lm.pred = predict(lm.fit, list(dis = dis.grid))
plot(nox ~ dis, data = Boston, col = "darkgrey")
lines(dis.grid, lm.pred, col = "red", lwd = 2)

#(2)

library(splines)
sp.fit = lm(nox ~ bs(dis, df=4), data = Boston)
summary(sp.fit)
sp.pred = predict(sp.fit, list(dis = dis.grid),se=T)
plot(nox ~ dis, data = Boston, col = "darkgrey")
lines(dis.grid, sp.pred$fit, col = "red", lwd = 2)
attr(bs(dis, df=4),"knots")

#(3)

library(gam)
gam.fit = gam(nox ~ s(dis, df=4) + ns(indus, 4), data = Boston)
summary(gam.fit)


# 10 ----------------------------------------------------------------------

#(1)

Carseats<-read.table("Carseats.txt")
attach(Carseats)
set.seed(1)

train = sample(dim(Carseats)[1], dim(Carseats)[1]/2)
Carseats.train = Carseats[train, ]
Carseats.test = Carseats[-train, ]

library(tree)
tree.carseats = tree(Sales ~ ., data = Carseats.train)
summary(tree.carseats)

plot(tree.carseats)
text(tree.carseats, pretty = 0)

pred.carseats = predict(tree.carseats, Carseats.test)
mean((Carseats.test$Sales - pred.carseats)^2)


#(2)

cv.carseats = cv.tree(tree.carseats, FUN = prune.tree)
par(mfrow = c(1, 2))
plot(cv.carseats$size, cv.carseats$dev, type = "b")
plot(cv.carseats$k, cv.carseats$dev, type = "b")
# Best size = 9
pruned.carseats = prune.tree(tree.carseats, best = 9)
par(mfrow = c(1, 1))
plot(pruned.carseats)
text(pruned.carseats, pretty = 0)

pred.pruned = predict(pruned.carseats, Carseats.test)
mean((Carseats.test$Sales - pred.pruned)^2)


#(3)

library(randomForest)
bag.carseats = randomForest(Sales ~ ., data = Carseats.train, mtry = 10, ntree = 500, 
                            importance = T)
bag.pred = predict(bag.carseats, Carseats.test)
mean((Carseats.test$Sales - bag.pred)^2)

importance(bag.carseats)


#(4)

rf.carseats = randomForest(Sales ~ ., data = Carseats.train, mtry = 5, ntree = 500, 
                           importance = T)
rf.pred = predict(rf.carseats, Carseats.test)
mean((Carseats.test$Sales - rf.pred)^2)

importance(rf.carseats)


# 11 ----------------------------------------------------------------------

#(1) 

Caravan<-read.table("Caravan.txt")
train = 1:1000
Caravan$Purchase = ifelse(Caravan$Purchase == "Yes", 1, 0)
Caravan.train = Caravan[train, ]
Caravan.test = Caravan[-train, ]


#(2)

library(gbm)
set.seed(342)
boost.caravan = gbm(Purchase ~ ., data = Caravan.train, n.trees = 1000, shrinkage = 0.01, 
                    distribution = "bernoulli")

summary(boost.caravan)


#(3)

boost.prob = predict(boost.caravan, Caravan.test, n.trees = 1000, type = "response")
boost.pred = ifelse(boost.prob > 0.2, 1, 0)
table(boost.pred,Caravan.test$Purchase)
34/(137 + 34)

lm.caravan = glm(Purchase ~ ., data = Caravan.train, family = binomial)
lm.prob = predict(lm.caravan, Caravan.test, type = "response")
lm.pred = ifelse(lm.prob > 0.2, 1, 0)
table(lm.pred,Caravan.test$Purchase)
58/(350 + 58)


# 12 ----------------------------------------------------------------------

#(1)

OJ<-read.table("OJ.txt")
set.seed(9004)
train = sample(dim(OJ)[1], 800)
OJ.train = OJ[train, ]
OJ.test = OJ[-train, ]



#(2)

install.packages("e1071")
library(e1071)

svm.linear = svm(Purchase ~ ., kernel = "linear", data = OJ.train, cost = 0.01)
summary(svm.linear)

train.pred = predict(svm.linear, OJ.train)
table(OJ.train$Purchase, train.pred)
(82 + 53)/(439 + 53 + 82 + 226)

test.pred = predict(svm.linear, OJ.test)
table(OJ.test$Purchase, test.pred)
(29 + 19)/(142 + 19 + 29 + 80)



#(3)

set.seed(1554)
tune.out = tune(svm, Purchase ~ ., data = OJ.train, kernel = "linear",
                ranges = list(cost = 10^seq(-2, 1, by = 0.25)))

summary(tune.out)

svm.linear = svm(Purchase ~ ., kernel = "linear", data = OJ.train, cost = tune.out$best.parameters$cost)
train.pred = predict(svm.linear, OJ.train)
table(OJ.train$Purchase, train.pred)
(57 + 71)/(435 + 57 + 71 + 237)

test.pred = predict(svm.linear, OJ.test)
table(OJ.test$Purchase, test.pred)

(29 + 20)/(141 + 20 + 29 + 80)



#(4)-1
set.seed(410)
svm.radial1 = svm(Purchase ~ ., data = OJ.train, kernel = "radial")
summary(svm.radial1)

train.pred1 = predict(svm.radial1, OJ.train)
table(OJ.train$Purchase, train.pred1)

(40 + 78)/(452 + 40 + 78 + 230)

test.pred1 = predict(svm.radial1, OJ.test)
table(OJ.test$Purchase, test.pred1)

(27 + 15)/(146 + 15 + 27 + 82)

#(4)-2
set.seed(755)
tune.out = tune(svm, Purchase ~ ., data = OJ.train, kernel = "radial", 
                ranges = list(cost = 10^seq(-2, 1, by = 0.25)))
summary(tune.out)

svm.radial2 = svm(Purchase ~ ., data = OJ.train, kernel = "radial", cost = tune.out$best.parameters$cost)
train.pred2 = predict(svm.radial2, OJ.train)
table(OJ.train$Purchase, train.pred2)

(77 + 40)/(452 + 40 + 77 + 231)

test.pred2 = predict(svm.radial2, OJ.test)
table(OJ.test$Purchase, test.pred2)

(28 + 15)/(146 + 15 + 28 + 81)



# 13 ----------------------------------------------------------------------

#1)

geneData = read.csv("Ch10Ex11.csv", header=F)
dim(geneData)
geneData<- t(geneData)


#2)

km.out=kmeans(geneData,2,nstart=20)
km.out$cluster


#3)

dd = as.dist(1 - cor(t(geneData)))

hc.complete=hclust(dd, method="complete")
hc.average=hclust(dd, method="average")
hc.single=hclust(dd, method="single")
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)



# 14 ----------------------------------------------------------------------

#1)

library(MASS)
library(pls)

pr.out=prcomp(Boston, scale=TRUE)
pr.out$rotation
biplot(pr.out, scale=0)


#2)

pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')
plot(cumsum(pve), xlab="Principal Component", ylab="Cumulative Proportion of Variance Explained", ylim=c(0,1),type='b')


#3)

pcr.fit = pcr(crim ~ ., data = Boston, scale = TRUE, validation = "CV")
summary(pcr.fit)
validationplot(pcr.fit,val.type="MSEP")


# 15 ----------------------------------------------------------------------


#1)

pers<-read.csv("personality.csv")
library(corrplot)
corrplot(cor(pers), order = "hclust", tl.col='black', tl.cex=.75) 
#there are some sub-clusters that hang together 
#(e.g., talkative, outgoing, sociable, and are negatively related to shy, quiet, and withdrawn).
stand.pers = as.data.frame(scale(pers))


#2)
### Factor analysis with no rotation
fac.pers = factanal(stand.pers, factors = 10, rotation = "none", na.action = na.omit)
fac.pers

#3)

1-fac.pers$uniquenesses



### Plot loadings against one another
load = fac.pers$loadings[,1:2]
plot(load, type="n", xlab='Factor 1', ylab='Factor 2') # set up plot 
text(load,labels=names(stand.pers),cex=.7) # add variable names



#4)
### Factor analysis with rotation
fac.pers2 = factanal(stand.pers, factors = 10, rotation = "varimax", na.action = na.omit)
fac.pers2
load2 = fac.pers2$loadings[,1:2]
plot(load2, type="n", xlab='Factor 1', ylab='Factor 2') # set up plot 
text(load2,labels=names(stand.pers),cex=.7) # add variable names



