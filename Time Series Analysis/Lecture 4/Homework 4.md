# Homework 4

Zhaoyang Chen

## Question 1

### Part A

With the loop of linear regression, I conduted df test on all the 6 series. The result shows that the log price of DKK, HKD, SGD, EUR are not stationary but CHY and CHF are stationary. 

>The output is redundant so it would be better to post an example.
>
><img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210212183719029.png" alt="image-20210212183719029" style="zoom:80%;" />
>
>The coefficient of the log price of EUR is not statistically significant when $\alpha=0.05$ so the serie is an $I(1)$ process.

### Part B

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210212180711650.png" alt="image-20210212180711650" style="zoom:80%;" />

The time series plot of CNY shows that the serie might not be stationary since there is a clear decreasing trend then an increasing trend. The reason for the failure of DF Test is that the test becomes less powerful with the presense of trend.

## Question 2

### Part A

The time series plot of the residual of the regression model is shown below and I can conclude the serie is visually stationary. 

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210212182014868.png" alt="image-20210212182014868" style="zoom:67%;" />	

The DF Test shows that the residual serie is stationary so DKK and EUR are cointegrated and the cointegrating vector is [1, -0.997].

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210212214247532.png" alt="image-20210212214247532" style="zoom:80%;" />

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210212183928077.png" alt="image-20210212183928077" style="zoom:80%;" />



### Part B

Both the two strategies lose money. The basic strategy loses \$0.106 and the reinforcement strategy loses $6.854.

The code for basic strategy and reinforcement strategy are listed below.

```R
### basic
n1 = n2 = 0 # initial volume
count = 0 # trading counts
status = -1 # first time trade
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
n1 = n2 = 0 # initial volume
count = 0 # trading counts
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

```



## Question 3

