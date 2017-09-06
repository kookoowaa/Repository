### Graphic Parameters (PAR)

### %par(mfrow = c(2,1))               #그림은 행2, 열1로 구성
### %par(cex = 1.2)                    #글자크기를 1.2배로
### %par(bg = 'gray90')                #배경색은 gray90으로
### %par(las = 2)                      #축서식 문자는 항상 축에 직교
### %par(mai = c(1,2,3,4))             #아래부터 시계방향으로 그래프 마진을 1,2,3,4로 설정
par(mfrow=c(2,2), bg = 'gray50', col = 'white', col.main = 'lightblue', col.axis = 'yellow',col.lab = 'lightgreen')
### 이후 만드는 plot 들은 별도의 옵션 지정하지 않는 한 상기 옵션에 귀속