#(1)
german = read.csv('../Data_Mining/170822/german_numeric.csv')
library(class)
german[,16] = german[,16]-1
Response = rep(0,1000)
for (i in c(1:1000)){
  if (german[i,16]==0){Response[i]='Good'}
  else {Response[i]='Bad'}
}
attach(german)

set.seed(1)
glm.fit = glm(Result~.,data = german, family = binomial)
glm.probs = predict(glm.fit,type='response')

glm.pred = rep('Good', 1000)
glm.pred[glm.probs>.5] = 'Bad'
table(glm.pred,Response)


#(2)
train = 1:600
test = 601:1000

train.x = german[train,-16]
test.x = german[test,-16]
train.y = german[train,16]
test.y = german$Result[test]


library(MASS)
lda.fit = lda(Result~., data = german, subset = train)
lda.fit

lda.pred = predict(lda.fit, test.x)
lda.pred
names(lda.pred)
lda.class = lda.pred$class
table(lda.class, test.y)


#(3)
qda.fit = qda(Result~., data = german, subset = train)
qda.pred = predict(qda.fit, test.x)
qda.class = qda.pred$class
mean(qda.pred$class != test.y)
mean(qda.pred$class == test.y)
table(qda.class, test.y)
