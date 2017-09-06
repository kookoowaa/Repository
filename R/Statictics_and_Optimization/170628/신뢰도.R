n = 49; sigma = 30 ; xbar = 157.02 ; alpha = 0.05 ; d = 5
qnorm(1-alpha/2) #z_(0.025)
## [1] 1.96

c.i <- c(xbar - qnorm (1-alpha/2)*sigma/sqrt(n), xbar + qnorm(1-alpha/2)*sigma/sqrt(n))
c.i

min_n = (qnorm(1-alpha/2)*sigma/d)^2
ceiling(min_n)
## [1] 139
