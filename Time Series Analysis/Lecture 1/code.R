library(dplyr)
library(tidyr)
library(chron)

# b
series = read.csv('f657ab9f9ecd5e33.csv')
attach(series)

pr<-PRICE[DATE==20170103] 
vol<-c(1:20)*0
for (k in 1:20){
  dipr<-diff(pr,lag=k)
  vol1<-sum(dipr^2)/k
  vol[k]<-sqrt(vol1*250) #annualized square root scale
} 
plot(vol)

# c
series_0 = series %>% 
  separate(col = TIME_M, into = c('T1', 'T2'), sep = '[.]') %>% 
  mutate(T1 = chron(times = T1)) %>%
  arrange(DATE, T1, T2)
any(series$PRICE == series_0$PRICE)
