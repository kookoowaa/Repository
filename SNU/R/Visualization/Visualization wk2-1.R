### remember ##### 

for (i in 1:10) eval ( parse (text = paste0("fit",i,"<- i")) )
ls()
a = list()
a[[1]] = ' a1 <- 1'
a[[2]] = ' a2 <- 2'

eval( parse (text = a) )
###################

rm(list = ls())
gc()
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
surveys <- read.csv(file = '~/download/surveys.csv')

# Select colums
match(c("plot_id", "species_id", "weight"),  names(surveys))
surveys[, match(c("plot_id", "species_id", "weight"),  names(surveys)) ]
surveys[,c("plot_id", "species_id", "weight") ]
surveys[c("plot_id", "species_id", "weight") ]

# filter data of which year is 1995
surveys$year == 1995
surveys[surveys$year == 1995, ]
head(surveys[surveys$year == 1995, ])

# select and filter
surveys[surveys$weight<5, c("species_id", "sex", "weight")]
head(surveys[surveys$weight<5, c("species_id", "sex", "weight")])
# check NA
surveys[which(surveys$weight<5), c("species_id", "sex", "weight")]
head(surveys[which(surveys$weight<5), 
             c("species_id", "sex", "weight")])

surveys_sml <- surveys[which(surveys$weight<5), 
                       c("species_id", "sex", "weight")]

surveys_ex <- surveys
surveys_ex$weight_kg <- surveys_ex$weight/1000
surveys_ex <- surveys_ex[!is.na(surveys_ex$weight_kg),] 
head(surveys_ex)



aggregate(weight~sex, data = surveys, FUN = mean, na.rm = TRUE)
aggregate(weight~sex + species_id, data = surveys, FUN = mean, na.rm = TRUE)
tmp1<-aggregate(weight~sex + species_id, data = surveys, FUN = mean, na.rm = TRUE)
tmp2<-aggregate(weight~sex + species_id, data = surveys, FUN = min, na.rm = TRUE)
# total num 
table(surveys$sex)
table(surveys$sex, surveys$plot_id)

#sort
head(surveys[order(surveys$plot_id),])

# double sort
tmp <- surveys 
tmp <- tmp[order(tmp$plot_id),]
tmp <- tmp[order(tmp$month),]
head(tmp)
## arrange()



surveys

###dplyr
select(surveys, plot_id, species_id, weight)
filter(surveys, year == 1995) %>% head
surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>% head

surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)


surveys_ex <- surveys %>% filter( !is.na(surveys$weight)) %>%
  mutate(weight_kg = weight / 1000) 
head(surveys_ex)


#tmp <- surveys %>% group_by(sex)

surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight)) %>%
  print(n=15)

### good !
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  print(n = 30)

surveys %>%
  group_by(sex) %>%
  tally()

surveys %>%
  group_by(plot_id, sex) %>%
  tally()

surveys %>% arrange(month, plot_id) %>% print(n = 15)
surveys %>% arrange(desc(month), plot_id) %>% head(15)
tbl_df(surveys)
?tbl_df


## 
rm(list = ls())
gc()
if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
airquality
str(airquality)
names(airquality) <-  tolower(names(airquality))
aql <- melt(airquality, id.vars= c("month","day"))
head(aql)

aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql)
melt(airquality, id.vars= c("month","day")) %>% head()

aqw <- dcast(aql, month + day ~ climate_variable, 
             value.var ="climate_value")
head(aqw)
# good !!
dcast(aql, month ~ climate_variable, fun.aggregate = mean, 
      na.rm = TRUE, margins  = TRUE)
# margins
# 2 line 
aggregate( climate_value ~ climate_variable + month, 
           data = aql, FUN = mean, na.rm = T) %>% 
  dcast(month ~ climate_variable, value.var = 'climate_value')



## R color
plot(1:20, y=rep(0,20), col = 1:20, cex = 2, pch = 20 )
head(colors())
tail(colors())

mycol = colors()
plot(1:80, y=rep(1,80), col = mycol[1:80], cex = 2, pch = 20, 
     ylim = c(0,1) )
points(1:80, y=rep(0.5,80), col = mycol[81:160], cex = 2, pch = 20 )
points(1:80, y=rep(0,80), col = mycol[161:240], cex = 2, pch = 20 )
image(matrix(1:25^2,25,25), col = mycol)

# RGB
rgb(10, 4, 23, maxColorValue = 255, alpha = 10)
rgb(10, 4, 23, maxColorValue = 25, alpha = 10)
col2rgb('lightblue')

hsv(0.3, 0.5, 0.1, alpha = 0.4)
hcl(h = 0, c = 35, l = 85, alpha = 0.1)


mycol = heat.colors(20, alpha = 1)
plot(1:20, y=rep(0,20), col = mycol, cex = 2, pch = 20 )
mycol = topo.colors(20, alpha = 1)
plot(1:20, y=rep(0,20), col = mycol, cex = 2, pch = 20 )

x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x, y, volcano, col = heat.colors(20, alpha = 1), axes = FALSE)
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = 'white')

x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x, y, volcano, col = topo.colors(20, alpha = 1), axes = FALSE)
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = 'white')

rainbow(5, s = 0.4, v = 0.3, start = 0, end = 0.05, alpha = 1)


library(colorspace)
mycol = diverge_hcl(40, h = c(246, 40), c = 96, l = c(65, 90))
image(x, y, volcano, col = mycol, axes = FALSE)


library(colorspace)
pal = choose_palette()
mycol <- pal(20, alpha = 1)
image(x, y, volcano, col = mycol, axes = FALSE) 

