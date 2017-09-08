##test
rm(list = ls())
for (i in 1:10)
{lambda = i
save.image(paste0('./170908/result -',i,'.Rdata'))}