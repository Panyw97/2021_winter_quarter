# Q1

par(mfrow = c(2,2))
ts1.sim<-arima.sim(n=200,list(order=c(1,0,0), ar=.8)) 
acf(ts1.sim, main = 'n=200')

ts1.sim<-arima.sim(n=2000,list(order=c(1,0,0), ar=.8)) 
acf(ts1.sim, main = 'n=2000')

ts1.sim<-arima.sim(n=20000,list(order=c(1,0,0), ar=.8)) 
acf(ts1.sim, main = 'n=20000')

ts1.sim<-arima.sim(n=200000,list(order=c(1,0,0), ar=.8)) 
acf(ts1.sim, main = 'n=200000')

# Q2
aapl = read.csv('stock_prices_for_lecture_3/AAPL.csv')
amzn = read.csv('stock_prices_for_lecture_3/AMZN.csv')
dis = read.csv('stock_prices_for_lecture_3/DIS.csv')
ford = read.csv('stock_prices_for_lecture_3/FORD.csv')
gm = read.csv('stock_prices_for_lecture_3/GM.csv')
goog = read.csv('stock_prices_for_lecture_3/GOOG.csv')
prices = log(cbind(aapl[,6],goog[,6],amzn[,6],gm[,6],ford[,6],dis[,6])) 
var.labels = c("google","apple","amazon","gm","ford","disney") 
colnames(prices) = var.labels
returns = apply(prices,2,diff) 
Rpsel = returns[1:1000,] 
Rtest = returns[1001:1259,]

par(mfrow = c(2,2))
plot(Rpsel[,2],Rpsel[,3],xlab="Apple",ylab="Amazon",main="scatterplot for returns")

ts.plot(Rpsel[,2]-0.4134798*Rpsel[,3],xlab="time index",ylab="residuals from regression",
        main="residual time series")

ts.plot(cumsum(Rpsel[,2]-0.4134798*Rpsel[,3]),xlab="time index",ylab="integrated residuals",
        main="time series of log(p_{Apple}) - 0.4134798*log(p_{Amazon})")

plot(cumsum(Rpsel[,2]-0.4134798*Rpsel[,3]),Rpsel[,2]-0.4134798*Rpsel[,3],
     xlab= "log(p_{Apple}) - 0.4134798*log(p_{Amazon})",ylab="r_{Apple} - 0.4134798*r_{Amazon}")

# Q3
curr = read.csv('c4a8681f9469f4a8.csv')
keep = c(1:2865)[!is.na(curr[,2])]
curr2 = curr[keep,]
currnames = c("Date","CNY","DKK","HKD","SGD","CHF","EUR")
colnames(curr2) = currnames
lcurr = log(curr2[,2:7])
dlcurr = apply(lcurr,2,diff)

par(mfrow = c(1,1))
corr = cor(dlcurr)
corr
plot(hclust(dist(t(dlcurr))))
