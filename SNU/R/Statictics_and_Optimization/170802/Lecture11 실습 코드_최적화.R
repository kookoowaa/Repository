##p.6~27
#단체법(Simplex method)
# install.packages("linprog")

if (!require('linprog')) install.packages('linprog')
library('linprog')

c = c(4,6)
b = c(11,27,90)
A = rbind(c(-1,1),c(1,1), c(2,5))
res = solveLP(c, b, A, maximum=TRUE)
res$solution; res$opt
res$basvar
res$con


##p.28-29
#2분법(Bisection method) 예시
#알고리즘 p.26
#f:함수, lb,ub:각각 x1,x2, niter:반복횟수, tol:허용오차
bisec.fun=function(f,lb,ub,niter=100,tol=1e-3){
 if (f(lb)*f(ub) >=0 ){ cat('f(lb)*f(ub) >0! \n') 
   break }
 cat('Bisection method................\n')
 err=tol+1
 iter=1
 while((err >tol) & (iter < niter)){
   x0=(lb+ub)/2
   cat(c('iteration no.: ', iter, ' current x: ', 
         round(x0,6),'\n'))
   if(f(x0)==0){ break 
   }else{ if(f(x0)*f(lb) <0){ub=x0
     }else{ lb=x0}
   }
   err=abs(ub-lb)/2
   iter=iter+1
 }
 return(x0)
}
f.x=function(x){ return(cos(x)-x)}

bisec.fun(f.x,-3,1,niter=100,tol=1e-3)
bisec.fun(f.x,-3,0,niter=100,tol=1e-3)#잘못된 초기값

##p.44-45
#고정점 방법(fixed point method) 예시
#알고리즘 p.31
#g:함수, x0:초기값, niter:반복횟수, tol:허용오차
fixed.fun=function(g,x0,niter=100,tol=1e-3){
 iter=1
 oldx=x0
 err=tol+1
 cat('Fixed point method...........\n')
 while((iter <niter)&(err >tol)){
   newx=g(oldx)
   err=abs(newx-oldx)
   cat(c('iteration no.: ', iter, ' current x: ', round(newx,6),'\n'))
   oldx=newx
   iter=iter+1
 }
 return(newx)
}
g1=function(x){return(sqrt(x+1))}
g2=function(x){return(1+1/x)}

#g1
fixed.fun(g1,0,niter=100,tol=1e-3)

#g2
fixed.fun(g2,0,niter=100,tol=1e-3)

##p.52-53
#뉴튼-랩슨(Newton-Raphson) 예시
#알고리즘 p.49
#f:함수, df:f의 도함수, x0:초기값, niter:반복횟수, tol:허용오차
nr.fun=function(f,df,x0,niter=100,tol=1e-3){
 iter=1
 oldx=x0
 err=tol+1
 cat('Newton-Raphson method...........\n')
 while((iter <niter)&(err >tol)){
   newx=oldx-f(oldx)/df(oldx)
   err=abs(newx-oldx)
   cat(c('iteration no.: ', iter, ' current x: ', round(newx,6),'\n'))
   oldx=newx
   iter=iter+1
 }
 return(newx)
}

f.x=function(x){return(cos(x)-x)}
df.x=function(x)(return(-sin(x)-1))
nr.fun(f.x,df.x,-1)

#고정점 방법과 비교
g.x=function(x){return(cos(x))}
fixed.fun(g.x,-1)

##P.59
#f:함수, x0,x1:초기값, niter:반복횟수, tol:허용오차
secant.fun=function(f,x0,x1,niter=100,tol=1e-3){
 iter=1
 oldx0=x0
 oldx1=x1
 err=tol+1
 cat('Secant method...........\n')
 while((iter <niter)&(err >tol)){
   newx=oldx1-((oldx1-oldx0)/(f(oldx1)-f(oldx0)))*f(oldx1)
   err=abs(newx-oldx1)
   cat(c('iteration no.: ', iter, ' current x: ', round(newx,6),'\n'))
   oldx0=oldx1
   oldx1=newx
   iter=iter+1
 }
 return(newx)
}

f.x=function(x){return(cos(x)-x)}
secant.fun(f.x,-1,0,niter=100, tol=1e-3)


##p.94-
#fix seed number to get the same dataset
set.seed(234) 
#Gamma dist with alpha=2,beta=1
x=seq(0,10,by=0.01)
y=dgamma(x,shape=2,scale=1)
plot(x,y,type="l")
#generate 100 data points 
# from Gamma dist with alpha=2, beta=1
data.x=rgamma(100,shape=2,scale=1)

#grid search
lik=function(a){
 res=((a-1)*mean(log(data.x))-a 
      -a*log(mean(data.x)/a)-log(gamma(a)))#l(a,b.hat)
# return(res)
}
xvec=seq(0.1,4,0.01)
mle=xvec[lik(xvec)==max(lik(xvec))]
mle # mle by grid search

#graph
xvec=seq(0.1,4,0.01)
plot(xvec,lik(xvec),type='l',cex=0.8,cex.axis=1.5,
    cex.lab=1.5,xlab=expression(alpha),
    ylab='log-lik',ylim=c(-3,-1.3))
mle.f=lik(mle)
abline(h=mle.f,col='red')
arrows(mle,mle.f,mle,-3,col='red')
text(2,-3,labels= seq_along(x$x))

#derivative of log-lik
dlik=function(a){
 res=(log(a)-digamma(a)-log(mean(data.x))
      +mean(log(data.x)))#l'(a,b.hat)
 return(res)
}
 
g.x=function(x){
 return(x + dlik(x))
}

#g.x=0의 해 구하기
fixed.fun=function(g,x0,niter=100,tol=1e-3){
 iter=1
 oldx=x0
 err=tol+1
 cat('Fixed point method...........\n')
 while((iter <niter)&(err >tol)){
   newx=g(oldx)
   err=abs(newx-oldx)
   oldx=newx
   iter=iter+1
 }
 cat(c('iteration no.: ', iter, ' current x: ', round(newx,6),'\n'))
 return(newx)
}
#고정점 방법, 할선법
fixed.fun(g.x,1)
secant.fun(dlik,1,1.5)

##p.99-
X = matrix( c(rep(1,4), 7, 14, 27, 51),4,2)
m = c( 55, 157, 159, 16)    # trials
y = c( 0, 2, 7, 3)          # failures

#b:beta
loglik.f=function(b){
 b=matrix(b,2,1)#2행 1열 행렬
 gammai=X%*%b
 res=sum(y*gammai -m*log(1+exp(gammai)))
 return(res)
}
dlik.f=function(b){
 b=matrix(b,2,1)#2행 1열 행렬
 gammai=X%*%b
 pii=exp(gammai)/(1+exp(gammai))
 return(cbind(sum(((y-m*pii))*X[,1]),sum(((y-m*pii))*X[,2])))
}
ddlik.f=function(b){
 b=matrix(b,2,1)
 gammai=X%*%b
 pii=exp(gammai)/(1+exp(gammai))
 tmp1=m*pii*(1-pii)
 tmp2=matrix(0,2,2)
 for(i in 1:length(gammai)){
   tmp2=tmp2+tmp1[i]*(X[i,]%*%t(X[i,]))
   
 }
 return(-tmp2)
}
#graph
beta0=seq(-10,-2,0.1)#x축
beta1=seq(-0.05,0.2,0.005)#y축
lik.v=matrix(0,length(beta0),length(beta1))
for(i in 1:length(beta0)){
 for(j in 1:length(beta1)){
   newbeta=c(beta0[i],beta1[j])
   lik.v[i,j]=loglik.f(newbeta)
  }
}
 
require(graphics)
contour(beta0,beta1,lik.v,levels=c(seq(-70,-60,10),seq(-57,-46,3)),
     xlim=c(-11,0),ylim=c(-0.07,0.25))

#다변수 뉴튼 방법 p.60
#f:기울기벡터, df:헤세 행렬, x0:초기값, niter:반복횟수, tol:허용오차
nr2.fun=function(f,df,x0,niter=100,tol=1e-3){
 iter=1
 oldx=matrix(x0,length(x0),1)
 err=tol+1
 cat('Multivariate Newton-Raphson method...........\n')
 while((iter <niter)&(err >tol)){
   fv=matrix(f(oldx),length(oldx),1)
   newx=oldx-solve(df(oldx))%*%fv
   err=norm(newx-oldx,'2')
   oldx=newx
   iter=iter+1
   cat(c('iteration no.: ', iter, ' current x: ', round(newx,6),'\n'))
 }
 
 return(newx)
}

#initial value
beta <- c( log(sum(y)/sum(m-y)), 0 )
#multivariate Newton-Raphson Method
nr2.fun(dlik.f,ddlik.f,beta)


#최소화 함수
optim(c(2,1),loglik.f)
