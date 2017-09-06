# R code 

## Rgraphics
## Rgraphics
x <- c(6, 1:3, NA, 12)
x
x[x>5]
subset(x, x>5)

is.na(x)

x
which(x>5)
x <- c(3,1,4,1)
which(x>5)
y <- which(x>5)
length(y)
x <- c(3,1,4,1)
any(x>5)

x <- c(3,1,4,1)
x%in% c(2,1,4)

x <- c(3,1,4,1)
match(x ,c(2,1,4))

kids <- c("Jack", "Jill")
ages <- c(12, 10)
d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d 
str(d)

names(d)
d$ages
class(d$ages)

getwd()
setwd('D:/rProg')
getwd()

A <-read.table("CO2.dat", header = TRUE, sep = " ", stringsAsFactors= F)
head(A)
class(A$Plant)

install.packages('xlsx')
library(xlsx)
A <-read.xlsx("CO2.xlsx", header = TRUE, sheetIndex = 1, stringsAsFactors= F)
head(A)
class(A$Plant)

A = data.frame(x1 = rep(0,10), x2 = rep('b',10))
B = data.frame(x3 = rep(1,10), x2 = rep('d',10))
AB = cbind(A,B)
head(AB)
rbind(A,B)

attach(mtcars)
head(mtcars, n = 2)

plot(mpg ~ disp, data = mtcars)
plot(hp ~ disp, data = mtcars)

x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, main = "plot (x-y)")

x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, main = "plot (x-y)")

x = seq(-2,2, length = 10)
y = x^2
plot(x,y, type = 'p', main = "y = x^2")

x = seq(-2,2, length = 10)
y = x^2
par(mfrow = c(2,2))
plot(x,y, type = 'p', main = "(a)")
plot(x,y, type = 'b', main = "(b)")
plot(x,y, type = 'l', main = "(c)")
plot(x,y, type = 's', main = "(d)")

plot(x,y, type = "b", lty = 3, main = "y = x^2")

plot(x,y, type = "b", lty = 3, pch = 2, main = "y = x^2")
plot(x = 1:25,y = rep(0, 25), pch = 1:25)
plot(x,y, type = "b", lty = 3, pch = 2, col = "blue", main = "y = x^2")
colors()[1:10]
plot(x,y, type = "b", xlab = "xx", ylab = "yy", main = "y = x^2")
xlim = c(-1,1), ylim = c(-1,1))
plot(mpg~disp, data = cars, xlab = "displacement", ylab = "mile/gallon",
     main = "scatter plot", pch = 20, col = 'darkblue')

pairs(~mpg+disp+drat+wt,data=mtcars, 
      main="Simple Scatterplot Matrix")

x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, pch = 20, main = 'scatter plot')
abline(a = 1, b = 2, col = "red")
abline(v = 1, col = "blue")
abline(h = 1, col = "green")


```{r, echo = F}
x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, pch = 20, main = 'scatter plot')
abline(a = 1, b = 2, col = "red")
abline(v = 1, col = "blue")
abline(h = 1, col = "green")

## points
plot(x = 1,y = 1, type = 'n', xlim = c(0,10), ylim = c(0,5),
     xlab = 'time', ylab = '# of visiting')
x = 0:10
set.seed(1)
y = rpois(length(x), lambda = 1)
points(x, y, col = "blue", type = "s")
points(x, y, col = "red", type = "l")

## lines
plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2, 1, 0, 1, 0)
y = c(0, -1, 2, -2, 1)
lines(x,y)
## lines


plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2,1,0,1,0)
y = c(0, -1, 2, -2,1)
lines(x,y)

plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2, 1, NA, 1, 0)
y = c(0, -1, NA, -2, 1)
lines(x,y)


## lines
plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2, 1, NA, 1, 0)
y = c(0, -1, NA, -2, 1)
lines(x,y)


plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2, 1, NA, 1, 0)
y = c(0, -1, NA, -2, 1)
lines(x,y, lty = 2)

plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2, 1, NA, 1, 0)
y = c(0, -1, NA, -2, 1)
lines(x,y, lty = 2)

plot(0,0, type = 'n', xlim = c(1,5), ylim = c(0,2))
x = seq(1,5, by = 1)
abline(v = x, lty = 1:length(x))
z = sort(rnorm(100))
y1 = 2+ x + rnorm(100)
plot(z, y1, col = "blue", pch = 3)
points(z, y1/2, col = "red", pch = 19)
legend("topright", c("pch_3", "pch_19"), col = c("blue", "red"),
       pch = c(3,19))



## legend

par (mfrow = c(2,2), bg = 'gray50', col = 'white',
     col.main = 'lightblue', col.axis = 'yellow', 
     col.lab = 'lightgreen')
x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, main = "plot (x-y)-1", pch = 20)
y = 2+x + rnorm(100)
plot(x,y/2, main = "plot (x-y)-2")
y = 2+x + rnorm(100)
plot(x,y/3, main = "plot (x-y)-3", col.main = 'black')
y = 2+x + rnorm(100)
plot(x,y/4, main = "plot (x-y)-4", col.axis = 'white')
```

par (mfrow = c(2,2), bg = 'gray50', col = 'white',
     col.main = 'lightblue', col.axis = 'yellow', col.lab = 'lightgreen', 
     las = 2)
x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, main = "plot (x-y)-1", pch = 20)
y = 2+x + rnorm(100)
plot(x,y/2, main = "plot (x-y)-2")
y = 2+x + rnorm(100)
plot(x,y/3, main = "plot (x-y)-3", col.main = 'black')
y = 2+x + rnorm(100)
plot(x,y/4, main = "plot (x-y)-4", col.axis = 'white')


# Visualization of K-nearest neighborhood method
## Regression

set.seed(1)
x <- sort(rnorm(100))
y<- 3+x^2 + rnorm(100)
plot(x, y, pch = 20)


## Regression
```{r, echo = F}
set.seed(1)
x <- sort(rnorm(100))
y<- 3+x^2 + rnorm(100)
plot(x, y, pch = 20)
```

## Regression
fit <- lm(y~x)
fit$coefficient

## Regression
plot(x, y, pch = 20)
abline(a = fit$coefficients[1], b = fit$coefficients[2], col = 'blue')
yTrueMean <- 3+ x^2
lines(x, yTrueMean , lty=2, col='black')

## Regression
library(FNN)
knnx.index(x, 0, k = 10)
idx <- c(knnx.index(x, 0, k = 10))
idx


## Regression
yhat <- mean( y[idx] ) 
yhat 

## Visualization of KNN
eval.point = 0
plot(x, y, pch = 20)
abline( v = 0, col = 'black')
idx<- c( knnx.index(x, eval.point, k = 10) )
points( x[idx], y[idx], col = 'red', pch = 20)
abline(h = mean(y[idx]), lty = 2, col = 'red')
mean(y[idx])



## Visualization of KNN
eval.point = 0
plot(x, y, pch = 20)
abline( v = 0, col = 'black')
idx<- c( knnx.index(x, eval.point, k = 10) )
points( x[idx], y[idx], col = 'red', pch = 20)
abline(h = mean(y[idx]), lty = 2, col = 'red')
mean(y[idx])
## Visualization of KNN


par( mfrow = c(1,2))
plot(x, y, pch = 20)
abline( v = 1, col = 'black')
index.mat<- c(knnx.index(x, 1 , k = 10))
points( x[index.mat], y[index.mat], col = 'red', pch = 20)
abline(h = mean(y[index.mat]), lty = 2, col = 'red')



plot(x, y, pch = 20)
abline( v = -1, col = 'black')
index.mat<- c(knnx.index(x, -1 , k = 10))
points( x[index.mat], y[index.mat], col = 'red', pch = 20)
abline(h = mean(y[index.mat]), lty = 2, col = 'red')


eval.n = 100
eval.point = seq(-3,3, length= eval.n)
plot(x, y, pch = 20)
idx.mat<- knnx.index(x, eval.point , k = 10)
yhat = rep(0,eval.n)
for (i in 1:eval.n) yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type= 'l', lty = 2, col = 'red')

eval.n = 100
eval.point = seq(-3,3, length= eval.n)
plot(x, y, pch = 20)
idx.mat<- knnx.index(x, eval.point , k = 10)
yhat = rep(0,eval.n)
for (i in 1:eval.n) yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type= 'l', lty = 2, col = 'red')

library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg, main="3D Scatterplot")

library(rgl)
attach(mtcars)
plot3d(wt, disp, mpg, col="red", size=3)

mypal = c('blue', 'red', 'green')
class(mtcars$cyl)
factor(mtcars$cyl)
mypal[factor(mtcars$cyl)]
plot3d(wt, disp, mpg, col= a[factor(mtcars$cyl)], size=10)


library(rgl)
z <- 2 * volcano # Exaggerate the relief
x <- 10 * (1:nrow(z)) # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z)) # 10 meter spacing (E to W)
## Don't draw the grid lines : border = NA
par(bg = "slategray")
persp(x, y, z, theta = 135, phi = 30, col = "green3", scale = FALSE,
      ltheta = -120, shade = 0.75, border = NA, box = FALSE)


persp3d(x, y, z, col = "green3")


## Rstat

if (!require(plotrix)) install.packages("plotrix")
if (!require(vioplot)) install.packages("vioplot")
if (!require(vcd)) install.packages("vcd")

counts = table(state.region)
counts
barplot(counts, main = "simple bar chart", 
        xlab = "region", ylab = "freq")

freq.cyl =table(mtcars$cyl)
barplot(freq.cyl, main = "simple bar chart", col ="orange")

cyl.name = c("4 cyl", "6 cyl", "8 cyl")
barplot(freq.cyl, main = "simple bar chart", col ="orange",
        names.arg = cyl.name)

cyl.name2 = paste0( cyl.name, "(", freq.cyl, "%)")
pie(freq.cyl, labels = cyl.name2, 
    col = rainbow(length(freq.cyl)), main = "pie chart")


library(plotrix)
pie3D(freq.cyl, labels = cyl.name2, explode = 0.1, main = "3d pie plot")

fan.plot(freq.cyl, labels = cyl.name2, main = "Fan plot")

## Frequency table
library(vcd)
head(Arthritis, n = 3)

## Frequency table
my.table <- xtabs( ~ Treatment + Improved, data = Arthritis)
my.table

## barplot
barplot( my.table,
         xlab = "Improved", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red"))

## barplot
barplot( t(my.table),
         xlab = "Improved", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red", "orange"))
t(my.table)

barplot( t(my.table),
         xlab = "Improved", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red", "orange"))

tmp = c("buckled", "unbuckled")
belt <- matrix( c(58, 2, 8, 16), ncol = 2, 
                dimnames = list(parent = tmp, child = tmp))
belt

library(vcd)
spine(belt, main="spine plot for child seat-belt usage",
      gp = gpar(fill = c("green", "red")))

x = rnorm(100)
boxplot(x, main = "boxplot", col ='lightblue')
## histogram
x = faithful$waiting
hist(faithful$waiting, nclass = 8)

x = faithful$waiting
hist(faithful$waiting, breaks = seq(min(x), max(x), length = 10),
     probability = T)

x = faithful$waiting
hist(faithful$waiting, nclass = 10, probability = T)
lines(density(x), col = "red", lwd = 2)

library(vioplot)
x = rpois(1000, lambda = 3)
vioplot(x, col = "lightblue")


## violin plot
library(vioplot)
x = rpois(1000, lambda = 3)
vioplot(x, col = "lightblue", names = 'variable')

# visualization for mutivariate variables

## multiple boxplot

attach(mtcars)
boxplot(mpg~cyl, data = mtcars, names = c('4 cyl','6 cyl', '8 cyl'),
        main = "MPG dist by cylinder")

## multiple histogram
hist(mpg[cyl==4], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'lightblue',
     nclass = trunc(sqrt(length(mpg[cyl==4]))))
hist(mpg[cyl==6], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'orange',
     nclass = trunc(sqrt(length(mpg[cyl==6]))), add= TRUE)
hist(mpg[cyl==8], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'red',
     nclass = trunc(sqrt(length(mpg[cyl==8]))), add= TRUE)


## multiple histogram

par(mfrow = c(3,1))
hist(mpg[cyl==4], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'lightblue',
     nclass = trunc(sqrt(length(mpg[cyl==4]))))
hist(mpg[cyl==6], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'orange',
     nclass = trunc(sqrt(length(mpg[cyl==6]))))
hist(mpg[cyl==8], xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0,10), col = 'red',
     nclass = trunc(sqrt(length(mpg[cyl==8]))))


plot(density(mpg[cyl==4]), xlab="MPG", main = "MPG dist by cylinder",
     xlim = c(5, 40), ylim = c(0.,0.26))
lines(density(mpg[cyl==6]), col = "red", lty = 2)
lines(density(mpg[cyl==8]), col = "blue", lty = 3) 
legend("topright", paste(c(4,6,8), "Cylinder"),
       col = c("black","red", "blue"),
       lty = c(1,2,3), lwd = 3, bty ="n")
```


tmp = c("buckled", "unbuckled")
belt <- matrix( c(58, 2, 8, 16), ncol = 2, 
                dimnames = list(parent = tmp, child = tmp))
belt
barplot( t(belt), main = "Stacked Bar chart for child seat-belt usage",
         xlab = "parent", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red")) 