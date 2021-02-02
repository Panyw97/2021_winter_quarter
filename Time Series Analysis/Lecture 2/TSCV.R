TSCV<- function(x,y,k,j)
{
	# Function: to calculate the Generalzied TSCV of series x and y; or TSRV of x (if x=y)
	# x,y are series with same length; k is the slow time scale, =2,3,4; j is the fast time scale, often=1
	
	CV_K <- sum(diff(x,lag=k)*diff(y,lag=k))/k;	
	CV_J <- sum(diff(x,lag=j)*diff(y,lag=j))/j;
	n <- length(x);

	xTSCV <- (1-(k+j)/n)^(-1)*(1-j/k)^(-1)*(CV_K - j/k*CV_J);

      #if(n==3)

      if(n==(k+j))
      {
          xTSCV<-0;
      }

	xTSCV;
} 
### Per Mykland and Lan Zhang would like to thank Xiaowei Gong
### for writing this code