# course 3
rm(list = ls())
gc()
# poisson distribution
x = 0:20
y1 = dpois(x, lambda = 1)
y2 = dpois(x, lambda = 5)
par(mfrow = c(1,2))
barplot(y1, main = expression(paste(lambda, '= 1', sep="")))
barplot(y2, main = expression(paste(lambda, '= 5', sep="")))


# central limit theorem 1
n = 1e+4
z = rexp(n)
x = c()
for (i in 1:n)
{
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)

# central limit theorem 2
n = 1e+4
z = runif(n)
x = c()

for (i in 1:n)
{
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)

# gamma distribution
x = seq(0,10, length = 100)
y = dgamma(x, shape = 2, scale = 0.5)
par(mfrow = c(1,2))
plot(x,y, type = 'l', ylim = c(0,.8))
y = dgamma(x, shape = 8, scale = 0.5)
plot(x,y, type = 'l', ylim = c(0,.8))


# beta distribution
x = seq(0,1, length = 100)
y = dbeta(x, shape1 = 1, shape2 = 1)
par(mfrow = c(1,3))
plot(x,y, type = 'l', ylim = c(0,2.5))
y = dbeta(x, shape1 = 4, shape2 = 2)
plot(x,y, type = 'l', ylim = c(0,2.5))
y = dbeta(x, shape1 = 2, shape2 = 4)
plot(x,y, type = 'l', ylim = c(0,2.5))  

# multivariate normal distribution
library(mvtnorm)
library(rgl)
n = 50
mu.vec = c(1,1/2)
Sigma.mat = matrix( c(3,0.5,0.5,2),2,2)
x1 = x2 = seq(-3,3, length = n)
z <- matrix(0,n,n)
for (i in 1:n)
  for (j in 1:n)
    z[i,j] <- dmvnorm(c(x1[i],x2[j]), mu.vec, Sigma.mat)
contour(x1,x2,z)
persp3d(x1,x2,z, col='green')



## logliklihood

y = c(1,1,0,1,1)
dbinom(y, size = 1, prob = 0.5, log = TRUE )

loglike  <- like <- c()
theta.vec <- seq(0,1,length = 100)
for (i in 1:100)
{
  theta <- theta.vec[i]
  like[i] <- prod(dbinom(y, size = 1, prob = theta, log = FALSE ))
  loglike[i] <- sum(dbinom(y, size = 1, prob = theta, log = TRUE ))
}
plot(theta.vec, loglike, type = 'l', col = 'blue')
plot(theta.vec, like, type = 'l', col = 'blue')

### visualizing loglikelihood 
n = 100
y<- c(0.1,0.5,0.3,0.15,0.2)
sigma.vec <- seq(0.1,0.3, length = n)
mu.vec <-  seq(0,0.5, length = n)
z <- matrix(0,n,n)
for (i in 1:n)
  for (j in 1:n)
    z[i,j] <- sum(dnorm(y,
                        mu.vec[i], sigma.vec[j],
                        log = T), na.rm = T)

filled.contour(mu.vec, sigma.vec, z, nlevels = 20,
               col = heat.colors(20))


# t-test
n = 1000
testResult <- rep(0,n)
for (i in 1:n)
{
  x <- rep(0,20)
  for (j in 2:20) x[j] <- 0.9*x[j-1] + rnorm(1)
  testfit <- t.test(x,mu=0)
  testResult[i] <- testfit$p.value
}
mean(testResult>0.05)


# univariate regression 
set.seed(1)
x <- sort(rnorm(100))
y<- 3+x^2 + rnorm(100)
plot(x, y, pch = 20)
fit <- lm(y~x)
abline(a = fit$coefficients[1], b = fit$coefficients[2], col = 'blue'  )
ytrue <- 3+ x^2
lines(x, ytrue , lty = 2, col = 'black')

# multivariate regression
library(MASS)
set.seed(1)
rho = 0.5
n = 100 ; mu.vec = c(0,0)
Sigma.mat <- matrix(c(1,rho,rho,1),2,2)
x <- mvrnorm(n, mu.vec, Sigma.mat)
y<- x%*%c(1,1) + rnorm(100)
fit <- lm(y~x[,1]-1)


# iteration code
set.seed(1)
iter.num = 1000
coef.vec <- rep(0,iter.num)
for (i in 1:iter.num)
{
  x <- mvrnorm(n, mu.vec, Sigma.mat)
  y<- x%*%c(1,1) + rnorm(100)
  fit <- lm(y~x[,1]-1)
  coef.vec[i]<- fit$coefficients
}
boxplot(coef.vec, col = 'orange', ylim = c(0,2))
abline(h = 1, lty = 2, col = 'red')

# iteration code by rho

set.seed(1)
iter.num = 1000
rho.vec = seq(-0.7, 0.7, by = 0.1 )
coef.mat <- matrix(0,iter.num, length(rho.vec))
for (j in 1:length(rho.vec))
{
  rho = rho.vec[j]
  Sigma.mat <- matrix(c(1,rho,rho,1),2,2)
  for (i in 1:iter.num)
  {
    x <- mvrnorm(n, mu.vec, Sigma.mat)
    y<- x%*%c(1,1) + rnorm(100)
    fit <- lm(y~x[,1]-1)
    coef.mat[i,j]<- fit$coefficients
  }
}
colnames(coef.mat)<- paste0('rho=',round(rho.vec,2))
boxplot(coef.mat, col = 'orange', ylim = c(0,2))
abline(h = 1, lty = 2, col = 'red')


# classfication algorithm
library(MASS)
library(FNN)
set.seed(1)
x1<-mvrnorm(n = 50, mu = c(1,1), Sigma = matrix(c( 1,0.5,0.5,1), 2,2))
x2.1<-mvrnorm(n = 25, mu = c(0,0), Sigma = matrix(c( 1,-0.5,-0.5,1), 2,2))
x2.2<-mvrnorm(n = 25, mu = c(3,3), Sigma = matrix(c( 1,-0.5,-0.5,1), 2,2))
x2 = rbind(x2.1, x2.2)
x<- rbind(x1, x2)
y<- c(rep(1,50), rep(0,50))
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5), xlab= 'x1', ylab = 'x2')
points(x2, col= 'blue', pch = 20)
legend('bottomright', legend = c('Y=1', 'Y=0'), col = c('red', 'blue'),
       pch = c(20,20))

jdata <- data.frame(y = y, x = x)
#View(jdata)
fit<-lm(y~x)
fit
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5))
points(x2, col= 'blue', pch = 20)
abline(a =(0.5 - fit$coefficients[1])/fit$coefficients[3], b = -fit$coefficients[2]/
         fit$coefficients[3])
tx <- NULL
i = 1
for (i in 1:70)
{
  tmp <-cbind( rep(-2+0.1*(i-1),70), seq(-2,5, length  = 70))
  tx <- rbind(tx, tmp)
}
txx<- cbind(1, tx)
yhat <- txx%*%fit$coefficients
yhat[yhat>0.5] <- 2
yhat[yhat<=0.5] <- 1
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5),
     xlab = 'x1', ylab = 'x2')
points(x2, col= 'blue', pch = 20)
abline(a =(0.5 - fit$coefficients[1])/fit$coefficients[3], b = -fit$coefficients[2]/
         fit$coefficients[3])
points(tx, col = yhat, cex = 0.2, pch = 20)





tx <- NULL
i = 1
for (i in 1:70)
{
  tmp <-cbind( rep(-2+0.1*(i-1),70), seq(-2,5, length  = 70))
  tx <- rbind(tx, tmp)
}

plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5))
points(x2, col= 'blue', pch = 20)
tx = matrix(c(0,2), 1,2)
points(0,2, pch = 3, cex = 2)
index.mat<- c(knnx.index(x, tx , k = 11))
ind1 <- index.mat[index.mat<=50]
ind2 <- index.mat[index.mat>50]
plot(x[ind1,], col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5),
     xlab = 'x1', ylab = 'x2')
points(0,2, pch = 3, cex = 2)
points(x[ind2,, drop = F], col = 'blue', pch = 20)
legend('bottomright', legend = c('Y=1', 'Y=0'), col = c('red', 'blue'),
       pch = c(20,20))


plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5), 
     xlab = 'x1', ylab = 'x2')
points(x2, col= 'blue', pch = 20)
tx = matrix(c(0,0), 1,2)
points(tx, pch = 3, cex = 2)
legend('bottomright', legend = c('Y=1', 'Y=0'), col = c('red', 'blue'),
       pch = c(20,20))


index.mat<- c(knnx.index(x, tx , k = 11))
ind1 <- index.mat[index.mat<=50]
ind2 <- index.mat[index.mat>50]
plot(x[ind1,], col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5),
     xlab = 'x1', ylab = 'x2')
points(tx, pch = 3, cex = 2)
points(x[ind2,, drop = F], col = 'blue', pch = 20)
legend('bottomright', legend = c('Y=1', 'Y=0'), col = c('red', 'blue'),
       pch = c(20,20))



tx <- NULL
i = 1
for (i in 1:70)
{
  tmp <-cbind( rep(-2+0.1*(i-1),70), seq(-2,5, length  = 70))
  tx <- rbind(tx, tmp)
}

index.mat<- knnx.index(x, tx , k = 11)
yhat = rep(0, nrow(index.mat))
for ( i in 1:nrow(index.mat))
{
  yhat[i]<-  mean(y[index.mat[i,]])
}






yhat[yhat>0.5] <- 2
yhat[yhat<=0.5] <- 1
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5),
     xlab = 'x1', ylab = 'x2')
points(x2, col= 'blue', pch = 20)
points(tx, col = yhat, cex = 0.2, pch = 20)

######
index.mat<- knnx.index(x, tx , k = 31)
yhat = rep(0, nrow(index.mat))
for ( i in 1:nrow(index.mat))
{
  yhat[i]<-  mean(y[index.mat[i,]])
}

yhat[yhat>0.5] <- 2
yhat[yhat<=0.5] <- 1
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5),
     xlab = 'x1', ylab = 'x2', main = 'k = 31')
points(x2, col= 'blue', pch = 20)
points(tx, col = yhat, cex = 0.5, pch = 20)
z<- t(matrix(yhat, 70,70))
contour(x = seq(-2,5, length = 70) , y = seq(-2,5, length = 70), z, nlevel = 1,
        add = TRUE)

####
index.mat<- knnx.index(x, tx , k = 30)
yhat = rep(0, nrow(index.mat))
for ( i in 1:nrow(index.mat))
{
  yhat[i]<-  mean(y[index.mat[i,]])
}

yhat[yhat>0.5] <- 2
yhat[yhat<=0.5] <- 1
plot(x1, col = 'red', pch = 20, xlim = c(-2,5), ylim = c(-2,5))
points(x2, col= 'blue', pch = 20)
abline(a =(0.5 - fit$coefficients[1])/fit$coefficients[3], b = -fit$coefficients[2]/
         fit$coefficients[3])
points(tx, col = yhat, cex = 0.2, pch = 20)
z<- t(matrix(yhat, 70,70))
contour(x = seq(-2,5, length = 70) , y = seq(-2,5, length = 70), z, nlevel = 1,
        add = TRUE)