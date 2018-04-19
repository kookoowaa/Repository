rm(list = ls())
gc()
dev.off()

i = 1
pn.num = c(1:2)
f1.layer.list = vector('list', length = length(pn.num))
for ( i in 1:length(pn.num))
{
  cat(i,'\n')
  p = url (paste("http://biz.chosun.com/svc/list_in/list_title.html?catid=1&pn="
                 , pn.num[i], sep=''), open = 'r')
  ch.vec = c()
  idx = 1
  while(TRUE)
  {
    tmp = readLines(p,n=1, warn = FALSE, encoding = 'UTF-8')
    if (length(tmp) == 0 ) break
    ch.vec[idx] = tmp
    idx = idx + 1
    # cat(idx,'\n')
  }
  close(p)
  f1.layer.list[[i]] = ch.vec
}



### 링크 추출
idx = 1
f1.layer.url = c()
for ( i in 1:length(pn.num))
{
  tmp = f1.layer.list[[i]]
  j = 1
  for ( j in 1:length(tmp))
  {
    tmp1= tmp[[j]]
    v = grep("/site/data/html_dir/[0-9]{4}/[0-9]{2}", tmp1 )
    #if (length(v)>0 ) break
    if (length(v) > 0)
    {
      a = regexpr("href=", tmp1 )
      b = regexpr("[0-9]{13}.html", tmp1 )
      f1.layer.url[idx] = substr(tmp1,a+6, b+17)
      idx = idx + 1
    }
  }
}      



## 접속

i = 2
p = url(paste('http://biz.chosun.com',f1.layer.url[i], sep=''), open = 'r')
ch.vec = c()
idx = 1
while(TRUE)
{
  tmp = readLines(p,n=1, warn = FALSE, encoding = 'UTF-8')
  if (length(tmp) == 0 ) break
  ch.vec[idx] = tmp
  idx = idx + 1
}
close(p)



## 후처리

rec = FALSE
tmp1 = list()
idx = 1
for ( i in 1:length(ch.vec))
{
  v = grep("학술논문", ch.vec[[i]] )
  if (length(v) > 0 ) 
  {
    tmp1[idx] = ch.vec[[i]]
    idx = idx + 1
  }
}
#
tmp2 = list()
idx = 1
for ( i in 1:length(tmp1))
{
  v = grep("<br>", tmp1[[i]] )
  v2 = grep("^((\\t+<br>))", tmp1[[i]] )
  if (length(v2) >0) next
  if (length(v)>0)
  {
    tmp2[[idx]] = tmp1[[i]]
    idx = idx + 1
  }
}

## or laaply 사용
lapply(1:length(tmp2), function(i) gsub('\t', '', tmp2[[i]]))

a = regexpr("EXLParenthesis", tmp1 )
the_number = substr(tmp1,a+17, a+23)
the_number


