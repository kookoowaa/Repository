library(glmnet)
credit = read.csv('../Data_Mining/Credit.csv')
head(credit)

attach(credit)
Income = scale(Income)
Limit = scale(Limit)
Rating = scale(Rating)
grid = 10^seq(10,-2, length = 100)
x = cbind(Income, Limit, Rating, Student)
y = Balance

ridge.mod = glmnet(x, y, alpha=0, lambda = grid)
dim(coef(ridge.mod))
coef(ridge.mod)[,50]
plot(log(grid), coef(ridge.mod)[2,], type = 'l', col='red', ylim = c(min(coef(ridge.mod)),max(coef(ridge.mod)) ))
lines(log(grid), coef(ridge.mod)[3,], col='blue')