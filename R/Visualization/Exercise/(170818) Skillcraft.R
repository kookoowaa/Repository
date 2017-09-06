library('reshape2')
library('dplyr')
library('gridExtra')

game_skill = read.csv('./data/wk2/SkillCraft1_Dataset.csv')
head(game_skill)
str(game_skill)

narm_gs = game_skill[game_skill$TotalHours != '?',]
narm_gs$Age = as.integer(as.character(narm_gs$Age))
narm_gs$HoursPerWeek = as.integer(as.character(narm_gs$HoursPerWeek))
narm_gs$TotalHours = as.integer(as.character(narm_gs$TotalHours))
narm_gs$LeagueIndex = as.factor(narm_gs$LeagueIndex)
narm_gs$GameID = as.character(narm_gs$GameID)


plot(narm_gs$Age, narm_gs$LeagueIndex)


variables = names(narm_gs)[-(1:2)]


new_rate = vector('numeric', length = length(narm_gs$LeagueIndex))
n = 1
for (i in 1:6){
  new_rate[narm_gs$LeagueIndex == i] = n
  if(i%%2 == 0) {
    n = n+1
  }
}
new_rate[narm_gs$LeagueIndex == 7] = 7
new_rate = as.factor(new_rate)
levels(new_rate) = c('noob','casual','pro','Godlike')
### The ratio to each Tier is as follows: (4% : 23% : 23% : 23% : 23% : 4%) excl. Grand Master Tier


for (i in 3:20){
  plot(narm_gs[,i], new_rate, main = names(narm_gs[i])[1], xlab = names(narm_gs[i]), ylab = 'tier', col = narm_gs$LeagueIndex)
}


adj_gs = narm_gs[-which(narm_gs$GameID=='5140'),]
adj_rate = new_rate[-which(narm_gs$GameID == '5140')]

for (i in 3:20){
  plot(adj_gs[,i], adj_gs[,2], main = names(narm_gs[i]), xlab = names(adj_gs[i]), ylab = 'tier', pch = 20, col = adj_gs$LeagueIndex)
}

# 티어별 정보
tier = c('bronze','silver','gold','platinum','diamond','master','grand master')
n=1
for (i in tier){
  adj_gs %>%
  filter(LeagueIndex==n) %>%
  select(Age:ComplexAbilitiesUsed) %>%
  assign(i,., inherits = T)
  n = n+1    
}

grid.table(summary(bronze[,1:5]))

# sub-group
tier2 = c('noob','casual','pro','Godlike')
n=1
for (i in tier2){
  adj_gs[as.numeric(adj_rate)==n,] %>%
    select(Age:ComplexAbilitiesUsed) %>%
    assign(i,., inherits = T)
  n = n+1    
}

dev.off()
par(mfrow=c(2,2))

boxplot(noob$Age, casual$Age, pro$Age, Godlike$Age, names = tier2, main = 'Age')
boxplot(noob$HoursPerWeek, casual$HoursPerWeek, pro$HoursPerWeek, Godlike$HoursPerWeek, names = tier2, main = 'HoursPerWeek')
boxplot(noob$TotalHours, casual$TotalHours, pro$TotalHours, Godlike$TotalHours, names = tier2, main = 'TotalHours', ylim = c(0,4000))
boxplot(noob$APM, casual$APM, pro$APM, Godlike$APM, names = tier2, main = 'APM')
boxplot(noob$SelectByHotkeys, casual$SelectByHotkeys, pro$SelectByHotkeys, Godlike$SelectByHotkeys, names = tier2, main = 'SelectByHotkeys')
boxplot(noob$AssignToHotkeys, casual$AssignToHotkeys, pro$AssignToHotkeys, Godlike$AssignToHotkeys, names = tier2, main = 'AssignToHotkeys')
boxplot(noob$UniqueHotkeys, casual$UniqueHotkeys, pro$UniqueHotkeys, Godlike$UniqueHotkeys, names = tier2, main = 'UniqueHotkeys')
boxplot(noob$MinimapAttacks, casual$MinimapAttacks, pro$MinimapAttacks, Godlike$MinimapAttacks, names = tier2, main = 'MinimapAttacks', ylim=c(0,0.002))
boxplot(noob$MinimapRightClicks, casual$MinimapRightClicks, pro$MinimapRightClicks, Godlike$MinimapRightClicks, names = tier2, main = 'MinimapRightClicks', ylim=c(0,0.002))
boxplot(noob$NumberOfPACs, casual$NumberOfPACs, pro$NumberOfPACs, Godlike$NumberOfPACs, names = tier2, main = 'NumberOfPACs')
boxplot(noob$GapBetweenPACs, casual$GapBetweenPACs, pro$GapBetweenPACs, Godlike$GapBetweenPACs, names = tier2, main = 'GapBetweenPACs')
boxplot(noob$ActionLatency, casual$ActionLatency, pro$ActionLatency, Godlike$ActionLatency, names = tier2, main = 'ActionLatency')
boxplot(noob$ActionsInPAC, casual$ActionsInPAC, pro$ActionsInPAC, Godlike$ActionsInPAC, names = tier2, main = 'ActionsInPAC', ylim=c(0,15))
boxplot(noob$TotalMapExplored, casual$TotalMapExplored, pro$TotalMapExplored, Godlike$TotalMapExplored, names = tier2, main = 'TotalMapExplored')
boxplot(noob$WorkersMade, casual$WorkersMade, pro$WorkersMade, Godlike$WorkersMade, names = tier2, main = 'WorkersMade')
boxplot(noob$UniqueUnitsMade, casual$UniqueUnitsMade, pro$UniqueUnitsMade, Godlike$UniqueUnitsMade, names = tier2, main = 'UniqueUnitsMade')
boxplot(noob$ComplexUnitsMade, casual$ComplexUnitsMade, pro$ComplexUnitsMade, Godlike$ComplexUnitsMade, names = tier2, main = 'ComplexUnitsMade', ylim=c(0,5e-04))
boxplot(noob$ComplexAbilitiesUsed, casual$ComplexAbilitiesUsed, pro$ComplexAbilitiesUsed, Godlike$ComplexAbilitiesUsed, names = tier2, main = 'ComplexAbilitiesUsed', ylim=c(0,0.002))
