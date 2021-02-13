# Homework 3

Zhaoyang Chen #12245353

## Question 1

### Part A

Based on the formula of ACF of AR(1) process, which is $\rho(k) = \phi_1^k$, the ACF cannot be negative if $\phi_1$ is positive. However, the ACF in the plot becomes negative when k is between 6 and 17. After some simulations, I find that I can get the plot with all positive ACF in some simulations but negative ACF also occurs. Then, I try different sample sizes and it shows that we can get ACF to be purely positive when the sample size is large enough. Thus, the formual is right but the plot is partially wrong when the lag is large because of the limitation of sample size.

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210203171940472.png" alt="image-20210203171940472" style="zoom:50%;" />

### Part B

The two dashed lines basically tell us if the ACF/PACF is close to zero. In this case, the ACF is close to zero when K=5 but it then goes below the lower dashed line, which indicates that the ACF is not close to zero. Thus, if we want to identify whether the ACF tapers off, we need to check if the ACF is within the two dashed lines.

### Pact C

If we want to identify the order for a MA model, we might be worried that the ACF goes below the lower dashed line since the ACF of a MA model is supposed to lie within the two dashed lines after a few lags (maybe 1 or 2). We cannot perfectly indentify the MA model if the plot undershoots the dashed line. On the countray, we do not care how the ACF changes when we want to identify an AR model since the ACF of an AR model should be outside the dashed lines for many lags.

## Question 2

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210205165950516.png" alt="image-20210205165950516" style="zoom:75%;" />

Based on the first plot (scatter plot between Apple and Amazon), the returns of the two stocks are highly correlated and we can observe a clear upward trend. Plus, the residuals of the model is approximately mean reverting according to the seond and the fourth plot. So I think the strategy of the series can be used for pair trading.

## Question 3

### Part A & B

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210205173009551.png" alt="image-20210205173009551" style="zoom:50%;" />

From the correlation matrix, we can find that DKK, EUR, SGD and CHF are highly correlated with each other.

![image-20210205173256225](/Users/bytedance/Library/Application Support/typora-user-images/image-20210205173256225.png)

Based on the dendrogram, CNY & HKD and DKK & EUR can be potential pair trading stocks.

### Part C

It is not hard to understand how CNY and HKD are tied together since HongKong is the special district of China and HKD can be influenced by the policy and development of China. Similarly, Denmark is an active member of the EU since 1973 so DKK is closely related with EUR.