# Homework 2

Zhaoyang Chen

#12245353

## Question 1

### Part A

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210128193947392.png" alt="image-20210128193947392" style="zoom:80%;" />

### Part B

The model being estimated is:
$$
lvol_t = -11.61+0.681l\times lvol_{t-1}+\epsilon_t-0.306\times\epsilon_{t-1}.
$$
The covariance between coefficients are not so large that we have to eliminate them from the model. The plot of acf and pace of lvol are shown below. Pacf is basically truncated when lag = 1 and acf is truncated when lag = 4, which means we should set a ARMA(1, 4) model. 

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210128194621019.png" alt="image-20210128194621019" style="zoom:67%;" />

We can also compare the plot of lvol and the residuals of the model. We can simply find that the mean of residuals is approximately zero and the variance is close to one, which indicates that the residuals are white noise. Though the setting of the parameters is not perfect, the model makes sense bacause it includes most of the information of the original data.

<img src="/Users/bytedance/Library/Application Support/typora-user-images/image-20210128194942587.png" alt="image-20210128194942587" style="zoom:67%;" />

