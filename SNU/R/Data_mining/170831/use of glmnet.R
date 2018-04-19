### use of glmnet

library(glmnet)
data(BinomialExample)

fit = glmnet(x, y, family = 'binomial')
predict(fit, newx = x[1:5,], type = 'class', s=c(0.05,0.01))

german = read.csv('../data_mining/170822/german_numeric.csv')
head(german)
train = c(1:600)
test = c(601:1000)
german[,16] = german[,16]-1
Response = rep(0,1000)
for (i in c(1:1000)){
  if(german[i,16]==0){Response[i]='Good'}
  else(Response[i]='Bad')
}
y = as.numeric(german$Result)
x = as.matrix(german[,-16])
attach(german)
head(x)
head(y)

model = glmnet(x[train,], y[train], family = 'binomial')
pred_NF = predict(model, newx = x[test,])
cv.out = cv.glmnet(x[train,], y[train])
cv.out$lambda.min
pred = predict(model, newx = x[test,], s = cv.out$lambda.min)
mean(pred- y[test])^2

predict(model, type = 'coefficients', newx = x[test,], s = cv.out$lambda.min)
