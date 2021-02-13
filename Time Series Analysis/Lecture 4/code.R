# q1
## part a
curr = read.csv('c4a8681f9469f4a8.csv')
keep = c(1:2865)[!is.na(curr[,2])]
curr2 = curr[keep,]
currnames = c("Date","CNY","DKK","HKD","SGD","CHF","EUR")
colnames(curr2) = currnames
lcurr = log(curr2[,2:7])
dlcurr = apply(lcurr,2,diff)

for (name in currnames[2:7]) {
  y = dlcurr[,name]
  x = lcurr[,name][1:2757]
  print(paste('-------', name, '-------'))
  print(summary(lm(y~x-1)))
}

## part b
par(mfrow = c(2,3))
for (name in currnames[2:7]) {
  x = lcurr[,name][1:2757]
  ts.plot(x, xlab = 'Time', ylab = name)
}

# q2
## part a
model = lm(DKK~EUR, data = lcurr)
summary(model)
par(mfrow = c(1,1))
ts.plot(model$residuals, main='time series of residuals from log(spy) ~ log(dax)')

res = model$residuals
summary(lm(diff(res)~res[1:(length(res)-1)]-1))

## part b
port = lcurr$DKK-0.997*lcurr$EUR
c1 = mean(port)
c2 = 1.5*sqrt(var(port))
df = lcurr[,c('DKK','EUR')]

### basic
n1 = n2 = 0
count = 0
status = -1
for(i in 1:2758){
  dkk = df[i,1]
  eur = df[i,2]
  port = dkk-0.997*eur
  if((port >= c1+c2) & (status==0 | status==-1)){
    n1 = n1 - 1/exp(dkk)
    n2 = n2 + 0.997/exp(eur)
    count = count + 1
    status = 1
  } else if ((port <= c1-c2) & (status==1 | status==-1)) {
    n1 = n1 + 1/exp(dkk)
    n2 = n2 - 0.997/exp(eur)
    count = count + 1
    status = 0
  }
}
n1*exp(df[2758,1])+n2*exp(df[2758,2])-0.02*count


### reinforcement
n1 = n2 = 0
count = 0
for(i in 1:2758){
  dkk = df[i,1]
  eur = df[i,2]
  port = dkk-0.997*eur
  if(port >= (c1+c2)){
    n1 = n1 - 1/exp(dkk)
    n2 = n2 + 0.997/exp(eur)
    count = count + 1
  } else if (port <= (c1-c2)) {
    n1 = n1 + 1/exp(dkk)
    n2 = n2 - 0.997/exp(eur)
    count = count + 1
  }
}
n1*exp(df[2758,1])+n2*exp(df[2758,2])-0.02*count
