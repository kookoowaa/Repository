### generic function
### R의 function은 데이터의 class 타입에 따라 다르게 작동함 (lm, mylm)

### Plot
### main = ' '                               #plot명
### type = c('p','b','l','s')                #라인종류
### lty = 1:6                                #라인타입(LineTYpe)
abline(v=seq(1,6,by=1), lty = 1:6)           #라인타입(6종)
### lwd = 1                                  #라인 두께(LineWiDth)
### pch = 1:25                               #점종류(PointCHaracter)
plot(x=1:25, y = rep(0,25), pch = 1:25)      #점종류(25종)
### col = ' '                                #colos() 참조(657종)
### xlab = ' ' // ylab = ' '                 #축이름
### xlim = c(최소,최대) // ylab = c(,)       #범위 지정
### %DF일 경우
### plot(~행이름+행이름+행이름, data = 'DF명')

### Abline
### abline(a = 'intercept', b='slope',h='지평선', v='수직선')

### Line / Point (기존 plot에 그림)
### x = (x1, x2, x3...., NA, ....xn)
### y = (y1, y2, y3...., NA, ....yn)
### lines(x, y)                              #NA부분은 공란으로 지나감 (섬 같은 걸 그릴때)

### Legends 범례
### lty, lwd, pch ㄷ
### %legend("위치", c(범례이름1, 범례이름2), col=c(범례색1, 범례색2), pch=c(범례모양1, 범례모양2))등