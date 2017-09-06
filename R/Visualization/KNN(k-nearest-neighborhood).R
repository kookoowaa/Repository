### KNN
eval.point = 1
plot(x, y, pch = 20)
abline(v = eval.point, col = 'black')
idx <- c(knnx.index(x, eval.point, k=10))
points(x[idx], y[idx], col = 'red', pch = 20)
abline(h = mean(y[idx]), lty = 2, col = 'red')
text(-2, 2, labels = round(mean(y[idx]),2))

eval.n = 100
eval.point = seq(-3, 3, length = eval.n)
plot(x, y, pch = 20)
idx.mat <- knnx.index(x, eval.point, k=5)                  # k의 선택이 중요
yhat = rep(0,eval.n)
for (i in 1:eval.n) yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point, yhat, type = 'l', lty = 2, col = 'red')
