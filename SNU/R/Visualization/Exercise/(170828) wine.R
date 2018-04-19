library(dplyr)

red_wine = read.csv('./data/wk2/winequality-red.csv')
white_wine = read.csv('./data/wk2/winequality-white.csv', sep = ';')

red_wine%>%
  group_by(quality)%>%
  tally()

white_list = c('w3','w4','w5','w6','w7','w8','w9')
red_list = c('r3','r4','r5','r6','r7','r8')

n=3
for (i in white_list){
  white_wine%>%
    filter(quality==n)%>%
    select(-quality)%>%
    assign(i,., inherits=T)
  n = n+1
}

n=3
for (i in red_list){
  red_wine%>%
    filter(quality==n)%>%
    select(-quality)%>%
    assign(i,., inherits=T)
  n = n+1
}

##
boxplot(r3$fixed.acidity, r4$fixed.acidity, r5$fixed.acidity, r6$fixed.acidity, r7$fixed.acidity, r8$fixed.acidity, names = red_list, ylim = c(4,14), main = 'fixed.acidity')
boxplot(w3$fixed.acidity, w4$fixed.acidity, w5$fixed.acidity, w6$fixed.acidity, w7$fixed.acidity, w8$fixed.acidity, w9$fixed.acidity, names= white_list, ylim = c(4,14), main = 'fixed.acidity')
boxplot(r3$volatile.acidity, r4$volatile.acidity, r5$volatile.acidity, r6$volatile.acidity, r7$volatile.acidity, r8$volatile.acidity, names = red_list, ylim = c(0,1.5), main = 'volatile.acidity')
boxplot(w3$volatile.acidity, w4$volatile.acidity, w5$volatile.acidity, w6$volatile.acidity, w7$volatile.acidity, w8$volatile.acidity, w9$volatile.acidity, names= white_list, ylim = c(0,1.5), main = 'volatile.acidity')
boxplot(r3$citric.acid, r4$citric.acid, r5$citric.acid, r6$citric.acid, r7$citric.acid, r8$citric.acid, names = red_list, ylim = c(0,1.5), main = 'citric.acid')
boxplot(w3$citric.acid, w4$citric.acid, w5$citric.acid, w6$citric.acid, w7$citric.acid, w8$citric.acid, w9$citric.acid, names= white_list, ylim = c(0,1.5),main = 'citric.acid')
boxplot(r3$residual.sugar, r4$residual.sugar, r5$residual.sugar, r6$residual.sugar, r7$residual.sugar, r8$residual.sugar, names = red_list, ylim = c(0,20), main = 'residual.sugar')
boxplot(w3$residual.sugar, w4$residual.sugar, w5$residual.sugar, w6$residual.sugar, w7$residual.sugar, w8$residual.sugar, w9$residual.sugar, names= white_list, ylim = c(0,20),main = 'residual.sugar')
boxplot(r3$chlorides, r4$chlorides, r5$chlorides, r6$chlorides, r7$chlorides, r8$chlorides, names = red_list, ylim = c(0,0.2), main = 'chlorides')
boxplot(w3$chlorides, w4$chlorides, w5$chlorides, w6$chlorides, w7$chlorides, w8$chlorides, w9$chlorides, names= white_list, ylim = c(0,0.2),main = 'chlorides')
boxplot(r3$free.sulfur.dioxide, r4$free.sulfur.dioxide, r5$free.sulfur.dioxide, r6$free.sulfur.dioxide, r7$free.sulfur.dioxide, r8$free.sulfur.dioxide, names = red_list, ylim = c(0,80), main = 'free.sulfur.dioxide')
boxplot(w3$free.sulfur.dioxide, w4$free.sulfur.dioxide, w5$free.sulfur.dioxide, w6$free.sulfur.dioxide, w7$free.sulfur.dioxide, w8$free.sulfur.dioxide, w9$free.sulfur.dioxide, names= white_list, ylim = c(0,80),main = 'free.sulfur.dioxide')
boxplot(r3$total.sulfur.dioxide, r4$total.sulfur.dioxide, r5$total.sulfur.dioxide, r6$total.sulfur.dioxide, r7$total.sulfur.dioxide, r8$total.sulfur.dioxide, names = red_list, ylim = c(0,400), main = 'total.sulfur.dioxide')
boxplot(w3$total.sulfur.dioxide, w4$total.sulfur.dioxide, w5$total.sulfur.dioxide, w6$total.sulfur.dioxide, w7$total.sulfur.dioxide, w8$total.sulfur.dioxide, w9$total.sulfur.dioxide, names= white_list, ylim = c(0,400),main = 'total.sulfur.dioxide')
boxplot(r3$density, r4$density, r5$density, r6$density, r7$density, r8$density, names = red_list, ylim = c(0.99,1.01), main = 'density')
boxplot(w3$density, w4$density, w5$density, w6$density, w7$density, w8$density, w9$density, names= white_list, ylim = c(0.99,1.01),main = 'density')
boxplot(r3$pH, r4$pH, r5$pH, r6$pH, r7$pH, r8$pH, names = red_list, ylim = c(2.5,4), main = 'pH')
boxplot(w3$pH, w4$pH, w5$pH, w6$pH, w7$pH, w8$pH, w9$pH, names= white_list, ylim = c(2.5,4),main = 'pH')
boxplot(r3$sulphates, r4$sulphates, r5$sulphates, r6$sulphates, r7$sulphates, r8$sulphates, names = red_list, ylim = c(0.2,1.2), main = 'sulphates')
boxplot(w3$sulphates, w4$sulphates, w5$sulphates, w6$sulphates, w7$sulphates, w8$sulphates, w9$sulphates, names= white_list, ylim = c(0.2,1.2),main = 'sulphates')
boxplot(r3$alcohol, r4$alcohol, r5$alcohol, r6$alcohol, r7$alcohol, r8$alcohol, names = red_list, ylim = c(8,15), main = 'alcohol')
boxplot(w3$alcohol, w4$alcohol, w5$alcohol, w6$alcohol, w7$alcohol, w8$alcohol, w9$alcohol, names= white_list, ylim = c(8,15),main = 'alcohol')

