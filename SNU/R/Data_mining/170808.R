### CSV 활용 단순 회귀분석

advertising <- read.csv('Advertising.csv', header = T)
head(advertising)
# advertising의X행은 무의미한 행이므로 삭제
advertising <- subset(advertising, select = -X)
TVtoSales = lm(Sales~TV, data = advertising)
est = TVtoSales$coeff
est
resid = TVtoSales$resid
resid
summary(TVtoSales)

```{r}
library(MASS)
library(ISLR)
```

```{r}
lm.fit<-lm(medv~lstat,data=Boston)
summary(lm.fit)
confint(lm.fit) #신뢰구간
predict(lm.fit)
predict(lm.fit,interval='prediction')
```

